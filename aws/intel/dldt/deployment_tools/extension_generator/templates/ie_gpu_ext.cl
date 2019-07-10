/*
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
*/

// ===============================================================================
// Generated file for Inference Engine extension for GPU plugin
//
// IMPLEMENT YOUR KERNEL HERE.
//
// Refer to the section "Adding Your Own Kernels to the Inference Engine" in
// OpenVINO* documentation (either online or offline in
// <INSTALL_DIR>/deployment_tools/documentation/docs/index.html an then navigate
// to the corresponding section).
// ===============================================================================

#pragma OPENCL EXTENSION cl_khr_fp16 : enable

[[[cog
from ext_gen.interactive_module import InteractiveModule

name = InteractiveModule.get_param('ie_name')
cog.outl("__kernel void %s_kernel(" % (name.lower()))
]]]
[[[end]]]                                       
     // insert pointers to inputs, outputs as arguments here
     // if your layer have one input and one output, argumants will be:
     //     const __global INPUT0_TYPE*  input0, __global OUTPUT0_TYPE* output
     )
{
    // Here kernel implementation should be added!
}