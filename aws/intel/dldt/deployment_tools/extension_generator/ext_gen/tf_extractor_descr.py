"""
 Copyright (c) 2018 Intel Corporation

 Licensed under the Apache License, Version 2.0 (the 'License');
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an 'AS IS' BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
"""
from ext_gen.interactive_module import InteractiveModule


class MOTFExtractorDescr(InteractiveModule):
    def __init__(self, op_gen: bool):
        self.params = {
            'isPythonic':[False, True],
            'name': ['', False],
            'allCopy':[False, False],
            'customParams': [[], False],
            'opName': ['', False],
            'opClassName': ['', False],
            'opClassPath': ['', False],
            'supported_types': [{'s': 'String', 'i': 'Int', 'f': 'Float', 'b': 'Bool',
                                 'type': 'DataType', 'shape': 'TensorShapeProto', 
                                 'padding':'Padding type',
                                 'spatial':'Get spatial from dataFormat',
                                 'channel':'Get channel from dataFormat',
                                 'batch':'Get batch from dataFormat',
                                 'list.s': 'List of strings', 'list.i': 'List of ints',
                                 'list.f': 'List of floats', 'list.b': 'list of bools',
                                 'list.type': 'list of DataType', 'list.shape': 'list of TensorShapeProto'}]
        }
        self.is_op_gen = op_gen
        self.all_quests = self.get_all_questions()
        super().__init__(self.params, self.all_quests)

    def print_types(self):
        s=""
        for sa in self.params['supported_types'][0].keys():
            s = s + "{} - {}, ".format(sa, self.params['supported_types'][0][sa])
        return s

    def check_param_all_copy(self):
        return self.get_param('allCopy')

    def get_all_questions(self):
        return [
            [
                'Please enter layer name:   ',
                'name',
                InteractiveModule.set_answer_to_param_standard,
                self.return_true
            ],
            [
                '\n'.join([
                    'Do you want to automatically parse all parameters from model file',
                    '    (parameters will be automatically parsed during Model Optimizer work as is,',
                    '     without renaming or omitting) (y/n)   ',
                ]),
                'allCopy',
                InteractiveModule.set_answer_to_param_bool,
                self.return_true
            ],

            [
                '\n'.join([
                    'Please enter all parameters in format',
                    '   <param1> <new name1> <type1>',
                    '   <param2> <new name2> <type2>',
                    '   etc',
                    '   where type is one of the following types:',
                    '   '+self.print_types(),
                    '   if your attribute type is not in list or you want implement your own attribute parsing just omit <type>\n'
                    '   When you finish please enter \'q\'   \n',
                ]),
                'customParams',
                InteractiveModule.set_answer_to_param_list,
                lambda: not self.check_param_all_copy()
            ],
            [
                'Please enter operation name to use with this extractor:   ',
                'opName',
                InteractiveModule.set_answer_to_param_standard,
                lambda: not self.is_op_gen
            ],
            [
                'Please enter class with operation to use with this extractor:   ',
                'opClassName',
                InteractiveModule.set_answer_to_param_standard,
                lambda: not self.is_op_gen
            ],
            [
                'Please enter import path to class with operation:   ',
                'opClassPath',
                InteractiveModule.set_answer_to_param_standard,
                lambda: not self.is_op_gen
            ]
        ]

    def read_config(self, data):
        # TODO add checks if something omitted in config
        super().set_answer_to_param_standard('name', data['op'])
        super().set_answer_to_param_standard('opName', data['op'])
        super().set_answer_to_param_standard('opClassName', data['op_class_name'])
        super().set_answer_to_param_standard('opClassPath', data['op_class_path'])
        super().set_answer_to_param_standard('allCopy', data['all_copy'])

        if not data['all_copy']:
            params = data['params']
            for p in params:
                if 'type' in p.keys():
                    super().params['customParams'][0].append([p['old_name'],
                                                              p['new_name'], p['type']])
                else:
                    super().params['customParams'][0].append([p['old_name'], p['new_name']])
            super().params['customParams'][1] = True
