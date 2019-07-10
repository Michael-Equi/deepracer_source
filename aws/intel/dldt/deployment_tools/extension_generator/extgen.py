#!/usr/bin/env python3

"""
 Copyright (c) 2018 Intel Corporation

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
"""
import sys
from shutil import move, copy
import os

import shutil

from ext_gen.caffe_extractor_descr import MOExtractorDescr
from ext_gen.mxnet_extractor_descr import MOMXNetExtractorDescr
from ext_gen.tf_extractor_descr import MOTFExtractorDescr
from ext_gen.mo_op_descr import MOOpDescr
from ext_gen.ie_extension_descr import IEExtensionDescr
from ext_gen.interactive_module import InteractiveModule

from cogapp import Cog

from extgen_cli import ExtGenCLIController
from utils import create_mo_folder_structure, create_ie_folder_structure


def io_task(what, where, operation, force):
    if not force:
        return operation(what, where)
    return operation(what, os.path.join(where, what))


def driver(output_dir, is_mo_caffe_ext_gen, is_mo_mxnet_ext_gen, is_mo_tf_ext_gen, is_mo_op_gen, is_ie_cpu_gen, is_ie_gpu_gen=False,
           is_from_config=False):
    analysis = '\n'.join([
        'Generating:',
        '\tModel Optimizer: ',
        '\t\t Extractor for Caffe Custom Layer: {}'.format(is_mo_caffe_ext_gen),
        '\t\t Extractor for MxNet Custom Layer: {}'.format(is_mo_mxnet_ext_gen),
        '\t\t Extractor for TensorFlow Custom Layer: {}'.format(is_mo_tf_ext_gen),
        '\t\t Framework-agnostic operation extension: {}'.format(is_mo_op_gen),
        '\t Inference Engine: ',
        '\t\t CPU extension: {}'.format(is_ie_cpu_gen),
        '\t\t GPU extension: {}'.format(is_ie_gpu_gen),
    ])
    print(analysis)

    if is_mo_caffe_ext_gen or is_mo_mxnet_ext_gen or is_mo_tf_ext_gen or is_mo_op_gen:
        [caffe_extr_path, mxnet_extr_path, tf_extr_path, op_path] = create_mo_folder_structure(output_dir)

    if is_ie_cpu_gen or is_ie_gpu_gen:
        [ie_cpu_path, ie_gpu_path] = create_ie_folder_structure(output_dir)

    if is_mo_caffe_ext_gen:
        mo_extr_descr = MOExtractorDescr(is_mo_op_gen)
        if not is_from_config:
            mo_extr_descr.create_extension_description()

    if is_mo_mxnet_ext_gen:
        mo_extr_descr = MOMXNetExtractorDescr(is_mo_op_gen)
        if not is_from_config:
            mo_extr_descr.create_extension_description()

    if is_mo_tf_ext_gen:
        mo_extr_descr = MOTFExtractorDescr(is_mo_op_gen)
        if not is_from_config:
            mo_extr_descr.create_extension_description()

    if is_mo_op_gen:
        mo_op = MOOpDescr(is_mo_caffe_ext_gen or is_mo_tf_ext_gen)
        if not is_from_config:
            mo_op.create_extension_description()

    if is_ie_cpu_gen and not is_from_config:
            ie_ext_descr_cpu = IEExtensionDescr('cpu')
            ie_ext_descr_cpu.create_extension_description()

    if is_ie_gpu_gen and not is_from_config:
            ie_ext_descr_gpu = IEExtensionDescr('cldnn')
            ie_ext_descr_gpu.create_extension_description()

    pathname = os.path.dirname(sys.argv[0])
    path = os.path.abspath(pathname)

    jobs = []

    op = lambda what, where, operation: lambda is_force=False: io_task(what, where, operation, force=is_force)

    if is_mo_caffe_ext_gen:
        what = InteractiveModule.params['name'][0].lower() + '_ext.py'
        command = ['', '-d', '-o' + what, os.path.join(path, './templates/caffe_extractor.py')]
        sub_jobs = [op(what, caffe_extr_path, move)]
        jobs.append((command, sub_jobs))

    if is_mo_mxnet_ext_gen:
        what = InteractiveModule.params['name'][0].lower() + '_ext.py'
        command = ['', '-d', '-o' + what, os.path.join(path, './templates/mxnet_extractor.py')]
        sub_jobs = [op(what, mxnet_extr_path, move)]
        jobs.append((command, sub_jobs))

    if is_mo_tf_ext_gen:
        what = InteractiveModule.params['name'][0].lower() + '_ext.py'
        command = ['', '-d', '-o' + what, os.path.join(path, './templates/tf_extractor.py')]
        sub_jobs = [op(what, tf_extr_path, move)]
        jobs.append((command, sub_jobs))

    if is_mo_op_gen:
        what = InteractiveModule.get_param('opName').replace(".","_").lower() + '.py'
        command = ['', '-d', '-o' + what, os.path.join(path, './templates/mo_op.py')]
        sub_jobs = [op(what, op_path, move)]
        jobs.append((command, sub_jobs))

    if is_ie_cpu_gen:
        #try to find out IE samples to copy ext_base files
        # 1. extgen and IE samples in one packet
        if os.path.exists(os.path.join(path, "../inference_engine/samples/extension/ext_base.cpp")):
            ext_base_path = os.path.join(path, "../inference_engine/samples/extension/")
        else:
            # 2. we have InferenceEngine_DIR path
            if os.getenv('InferenceEngine_DIR') and os.path.exists(os.path.join(os.getenv('InferenceEngine_DIR'), "../src/extension/ext_base.cpp")):
                ext_base_path = os.path.join(os.getenv('InferenceEngine_DIR'), "../src/extension/")
            else:
                # 3. we have path to extension sample explicitly (for development mainly)
                if os.getenv('IE_extension_sample') and os.path.exists(os.path.join(os.getenv('IE_extension_sample'), "./ext_base.cpp")):
                    ext_base_path = os.getenv('IE_extension_sample')
                else:
                    raise Exception("Can not locate the Inference Engine extension sample.\n"+
                                "Please run setupenv.sh from OpenVINO toolkit or set path to "+
                                "IE sample extension explicitly in IE_extension_sample")
        what = 'ext_' + InteractiveModule.get_param('ie_name').replace(".","_").lower() + '.cpp'
        command = ['', '-d', '-o' + what, os.path.join(path, './templates/ie_extension.cpp')]
        sub_jobs = [
            op(what, ie_cpu_path, move),
            op(os.path.join(path, './templates/CMakeLists.txt'), ie_cpu_path, copy),
            op(os.path.join(ext_base_path, './ext_base.cpp'), ie_cpu_path, copy),
            op(os.path.join(ext_base_path, './ext_base.hpp'), ie_cpu_path, copy),
            op(os.path.join(ext_base_path, './ext_list.cpp'), ie_cpu_path, copy),
            op(os.path.join(ext_base_path, './ext_list.hpp'), ie_cpu_path, copy)
        ]
        jobs.append((command, sub_jobs))

    if is_ie_gpu_gen:
        for ext in ('cl', 'xml'):
            op_file = InteractiveModule.get_param('ie_name').lower() + '_kernel.{}'.format(ext)
            command = ['', '-d', '-o' + op_file, os.path.join(path, './templates/ie_gpu_ext.{}'.format(ext))]
            sub_jobs = [op(op_file, ie_gpu_path, move)]
            jobs.append((command, sub_jobs))

    for job, sub_jobs in jobs:
        Cog().main(job)
        for sub_job in sub_jobs:
            try:
                sub_job()
            except shutil.Error as e:
                file_name = str(e).split('\'')[1]
                if 'already exists' in str(e):
                    res = "no"
                    if not is_from_config:
                        res = input('The file {} will be overwritten and all changes can be lost. '.format(file_name) +
                                    'Are you sure (y/n)?  ')
                    if res.lower() == 'yes' or res.lower() == 'y':
                        sub_job(True)
                    else:
                        print('[WARNING] File {} already exist. If you want to re-generate it, remove or move the file {} and try again'.format(file_name, file_name))

    if is_mo_caffe_ext_gen:
        print('Stub file for Caffe Model Optimizer extractor is in {} folder'.format(str(os.path.abspath(caffe_extr_path))))
    if is_mo_tf_ext_gen:
        print('Stub file for TensorFlow Model Optimizer extractor is in {} folder'.format(str(os.path.abspath(tf_extr_path))))
    if is_mo_mxnet_ext_gen:
        print('Stub file for MxNet Model Optimizer extractor is in {} folder'.format(str(os.path.abspath(mxnet_extr_path))))
    if is_mo_op_gen:
        print('Stub file for Model Optimizer operation is in {} folder'.format(str(op_path)))
    if is_ie_cpu_gen:
        print('Stub files for Inference Engine CPU extension are in {} folder'.format(str(ie_cpu_path)))
    if is_ie_gpu_gen:
        print('Stub files for Inference Engine GPU extension are in {} folder'.format(str(ie_gpu_path)))

    return 0


if __name__ == '__main__':
    controller = ExtGenCLIController()
    [is_mo_caffe_ext, is_mo_mxnet_ext, is_mo_tf_ext, is_mo_op, is_ie_cpu, is_ie_gpu,
     is_from_config, output_dir] = controller.get_cli_results()
    driver(output_dir, is_mo_caffe_ext, is_mo_mxnet_ext, is_mo_tf_ext, is_mo_op, is_ie_cpu,
           is_ie_gpu, is_from_config)
