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

# ===============================================================================
# Generated file for MXNet layer extractor for Model Optimizer
#
# You need to modify this file if you need several attributes of the layer
# to appear in the IR in different format than the default one. Then you
# need to implement pre-processing logic here.
#
# Refer to the section "Extending Model Optimizer with New Primitives" in
# OpenVINO* documentation (either online or offline in
# <INSTALL_DIR>/deployment_tools/documentation/docs/index.html an then navigate
# to the corresponding section).
# ===============================================================================

[[[cog
from ext_gen.interactive_module import InteractiveModule


isCustom = InteractiveModule.get_param('isCustom')
name = InteractiveModule.get_param('name')
op_name = InteractiveModule.get_param('opName')
all_copy = InteractiveModule.get_param('allCopy')
rename = InteractiveModule.get_param('rename')
custom_params = InteractiveModule.get_param('customParams')


cog.outl("from mo.front.mxnet.extractors.utils import get_mxnet_layer_attrs")
cog.outl("from mo.front.common.partial_infer.elemental import copy_shape_infer")
if isCustom:
    cog.outl("from mo.front.extractor import MXNetCustomFrontExtractorOp\n")
else:
    cog.outl("from mo.front.extractor import FrontExtractorOp\n")


if isCustom:
    class_name = ('%sMXNetFrontExtractor' % name)
    cog.outl("class %s(MXNetCustomFrontExtractorOp):" % (class_name))
else:
    class_name = ('%sFrontExtractor' % name)
    cog.outl("class %s(FrontExtractorOp):" % (class_name))
cog.outl("    op = \'%s\'" % (op_name))
cog.outl("    enabled = True\n")

cog.outl("    def extract(self, node):")
cog.outl("        attrs = get_mxnet_layer_attrs(node.symbol_dict)")
cog.outl("        node_attrs = {")
if isCustom:
    cog.outl("            'type': attrs.str('op_type', None),")
else:
    cog.outl("            'type': attrs.str('op', None),")
cog.outl("        }")
cog.outl("        node['type'] = node_attrs['type']")
cog.outl("        node['infer'] = %s.infer" % (class_name))


if all_copy:
    cog.outl("        for k, v in attrs.dict().items():")
    cog.outl("            node[k] = v")
    cog.outl("            node_attrs[k] = v")
    if rename:
        for c in custom_params:
            cog.outl("        node[\'%s\'] = %s" % (c[1], c[0]))
            cog.outl("        node_attrs[\'%s\'] = %s" % (c[1], c[0]))

cog.outl("        return (True, node_attrs)\n")

cog.outl("    @staticmethod")
cog.outl("    def infer(node):")
cog.outl("        copy_shape_infer(node)\n")

]]]
[[[end]]]