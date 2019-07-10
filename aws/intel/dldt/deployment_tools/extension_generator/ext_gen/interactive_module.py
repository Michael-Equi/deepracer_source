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
import logging as log


class InteractiveModule:
    params = {}
    all_quests = []

    def __init__(self, params, all_quests):
        for k in params.keys():
            if k not in __class__.params:
                __class__.params[k] = params[k]
        __class__.all_quests = all_quests

    @staticmethod
    def set_answer_to_param_standard(param_name, answer):
        __class__.params[param_name][0] = answer.strip() if isinstance(answer, str) else answer
        __class__.params[param_name][1] = True

    @staticmethod
    def set_answer_to_param_bool(param_name, answer):
        if answer.lower() == 'y' or answer.lower() == 'yes':
            __class__.params[param_name][0] = True
            __class__.params[param_name][1] = True
        else:
            __class__.params[param_name][0] = False
            __class__.params[param_name][1] = True

    @staticmethod
    def set_answer_to_param_list(param_name, answer):
        if len(__class__.params[param_name][0]) != 0:
            __class__.params[param_name][0].clear()
        while answer.lower() != 'q':
            split_answer = answer.split(' ')
            l = len(__class__.params[param_name][0])
            if len(split_answer) != 0:
                __class__.params[param_name][0].append(split_answer)

            if len(split_answer) == 1:
                i = __class__.params[param_name][0][l][0].rfind('.')
                __class__.params[param_name][0][l].append(__class__.params[param_name][0][l][0][(i + 1):])

            answer = input()

        __class__.params[param_name][1] = True

    def ask_question(self, index):
        if index < 0 or index >= len(self.all_quests):
            log.error("We have no question number " + str(index))
            return
        if self.all_quests[index][3]():
            answer = input(self.all_quests[index][0])
            self.all_quests[index][2](self.all_quests[index][1], answer)
        return

    @staticmethod
    def get_param(param_name):
        if param_name in __class__.params:
            return __class__.params[param_name][0]
        else:
            log.error("You are trying to get param that was not set! " + param_name)
            return

    @staticmethod
    def was_param_set(param_name):
        return (param_name in __class__.params and __class__.params[param_name][1])

    def final_input_data(self):
        print("\n\n******************************************************************************************\n" +
              "Please check your answers for extractor generation:\n")
        index = 1
        or_index = -1
        final_list = []
        for q in self.all_quests:
            or_index = or_index + 1
            if self.params[q[1]][1]:
                final_list.append(or_index)
                print(str(index) + ".  " + q[0] + "    " + str(self.get_param(q[1])))
                index = index + 1
        print("\n**********************************************************************************************\n")
        return final_list

    def ask_final_check(self):
        fin_list = self.final_input_data()
        change = input("Do you want to change any answer (y/n) ? Default \'no\' \n")
        while change == 'yes' or change == 'y':
            index = input("Please input question number to change answer:    ")
            self.ask_question(fin_list[int(index)-1])
            fin_list = self.final_input_data()
            change = input("Do you want to change any answer (y/n) ? Default \'no\' \n")

    def create_extension_description(self):
        for index in range(0, (len(self.all_quests))):
            self.ask_question(index)

        self.ask_final_check()

    def return_true(self):
        return True

    def get_all_questions(self):
        raise NotImplementedError('Need to override method "get_all_questions" to return all required questions')
