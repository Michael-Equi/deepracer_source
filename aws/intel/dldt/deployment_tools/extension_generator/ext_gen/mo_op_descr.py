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
from ext_gen.interactive_module import InteractiveModule


class MOOpDescr(InteractiveModule):

    def __init__(self, is_extr_gen: bool = False):
        self.params = {
            'isPythonic': ['', False],
            'opName': ['', False],
            'supportedAttrs': [[], False],
            'internalAttrs': [[], False],
            'changeShape': [False, False],
            'hasInfer':[True, False]
        }
        self.all_quests = self.get_all_questions()
        super().__init__(self.params, self.all_quests)
        self.is_extr_gen = is_extr_gen

    def check_is_not_extr_gen(self):
        return not self.is_extr_gen

    def check_is_not_extr_gen_and_not_pythonic(self):
        return (not self.is_extr_gen) and (not self.get_param('isPythonic'))

    def check_is_not_pythonic(self):
        return not self.get_param('isPythonic')

    def check_is_change_shape(self):
        return self.get_param('changeShape')

    def get_all_questions(self):
        return [
            [
                'Is your layer Pythonic (y/n)?   ',
                'isPythonic',
                InteractiveModule.set_answer_to_param_bool,
                self.check_is_not_extr_gen
            ],
            [
                'Please enter operation name:    ',
                'opName',
                InteractiveModule.set_answer_to_param_standard,
                self.return_true
            ],
            [
                '\n'.join([
                    'Please input all attributes that should be output in IR or needed for shape calculation in format:',
                    '    <attr1>',
                    '    <attr2>',
                    '    etc',
                    '    When you finish enter \'q\'',
                    ''
                ]),
                'supportedAttrs',
                InteractiveModule.set_answer_to_param_list,
                self.check_is_not_pythonic
            ],
            [
                '\n'.join([
                    'Please input all internal attributes for your operation (which should be omitted in IR) in format:',
                    '    <attr1>',
                    '    <attr2>',
                    '    etc',
                    '    When you finish enter \'q\'',
                    ''
                ]), 'internalAttrs',
                InteractiveModule.set_answer_to_param_list,
                self.check_is_not_pythonic
            ],
            [
                'Does your operation change shape? (y/n)    ',
                'changeShape',
                InteractiveModule.set_answer_to_param_bool,
                self.return_true
            ],
            [
                '\n'.join([
                    'Do you want to implement shape calculation? (y/n)',
                    '    If you choose \'n\' framework fallback will be used for shape calculation    ']),
                'hasInfer',
                InteractiveModule.set_answer_to_param_bool,
                self.check_is_change_shape
            ],

        ]

    def read_config(self, data):
        # TODO add checks if something omitted in config
        super().set_answer_to_param_standard('opName', data['op'])
        super().set_answer_to_param_standard('changeShape', data['change_shape'])
        super().set_answer_to_param_standard('hasInfer', data['has_infer'])
        super().set_answer_to_param_standard('isPythonic', data['pythonic'])

        if not data['pythonic']:
            params = data['supported_attrs']
            for p in params:
                super().params['supportedAttrs'][0].append([p, p])
            super().params['supportedAttrs'][1] = True

        super().params['internalAttrs'][1] = True

        if 'internal_attrs' in data.keys():
            params = data['internal_attrs']
            for p in params:
                super().params['internalAttrs'][0].append([p, p])
            super().params['internalAttrs'][1] = True
