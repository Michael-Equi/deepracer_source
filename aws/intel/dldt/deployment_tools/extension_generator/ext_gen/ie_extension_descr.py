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


class IEExtensionDescr(InteractiveModule):
    def __init__(self, plugin: str = 'cpu'):
        self.params = {
            'isPythonic':[False, False],
            'plugin': ['', False],
            'ie_name': ['', False],
            'params_cpu': [[], False],
            'params_gpu': [[], False],
            'supported_cpu_types': [{'int': 'Int', 'float': 'Float', 'bool': 'Bool',
                                   'string': 'String', 'listfloat': 'Floats', 'listint': 'Ints'}]
        }

        self.all_quests = self.get_all_questions()
        super().__init__(self.params, self.all_quests)
        self.check_plugin_name('plugin', plugin)

    def is_cpu(self):
        return InteractiveModule.get_param('plugin') == 'cpu'

    def is_gpu(self):
        return InteractiveModule.get_param('plugin') == 'cldnn'

    def check_plugin_name(self, param_name, answer):
        while answer != 'cldnn' and answer != 'cpu':
            print("Incorrect plugin name, please choose on of [cpu, cldnn]")
            answer = input()

        InteractiveModule.set_answer_to_param_standard(param_name, answer)

    def get_all_questions(self):
        return [
            [
                "Please enter operation name:    ",
                'ie_name',
                InteractiveModule.set_answer_to_param_standard,
                self.return_true
            ],
            [
                '\n'.join([
                    "Please enter all parameters in format",
                    '    <param1> <type>',
                    '    <param2> <type>',
                    '    etc',
                    '    Supported cpu types: %s' % ', '.join(self.params['supported_cpu_types'][0].keys()),
                    "    When you finish please enter \'q\'",
                    ''
                ]),
                'params_cpu',
                InteractiveModule.set_answer_to_param_list,
                self.is_cpu
            ],
            [
                '\n'.join([
                    "Please enter all parameters in format",
                    '    <param1> <type> <default_value>',
                    '    <param2> <type> <default_value>',
                    '    etc',
                    "    When you finish please enter \'q\'",
                    ''
                ]),
                'params_gpu',
                InteractiveModule.set_answer_to_param_list,
                self.is_gpu
            ]
        ]

    def read_config(self, data):
        # TODO add checks if something omitted in config
        super().set_answer_to_param_standard('ie_name', data["op"])
        super().set_answer_to_param_standard('isPythonic', data["pythonic"])
        super().set_answer_to_param_standard('plugin', data["plugin"])

        if not data["pythonic"]:
            params = data["params"]
            for p in params:
                if "default" in p.keys():
                    super().params['params_cpu'][0].append([p["name"], p["type"], p["default"]])
                else:
                    super().params['params_cpu'][0].append([p["name"], p["type"]])
            if len(params) != 0:
                super().params['params_cpu'][1] = True
