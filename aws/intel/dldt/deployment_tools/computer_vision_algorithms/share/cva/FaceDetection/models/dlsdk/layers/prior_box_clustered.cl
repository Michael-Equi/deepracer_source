/*
    Copyright 2018 Intel Corporation.

    This software and the related documents are Intel copyrighted materials,
    and your use of them is governed by the express license under which they
    were provided to you (Intel Simplified Software License (Version April 2018))
    Unless the License provides otherwise, you may not use, modify,
    copy, publish, distribute, disclose or transmit this software or
    the related documents without Intel's prior written permission.

    This software and the related documents are provided as is, with no
    express or implied warranties, other than those that are expressly
    stated in the License.
*/

#pragma OPENCL EXTENSION cl_khr_fp16 : enable
 
__kernel void prior_box_clustered(
    const __global INPUT0_TYPE*  input0,
    const __global INPUT0_TYPE*  input1,
    __global OUTPUT0_TYPE* output)
{
    const int num_priors_ = sizeof(width_)/sizeof(width_[0]);
    const int layer_width = INPUT0_DIMS[3];
    const int layer_height = INPUT0_DIMS[2];
    const float r_img_width  = 1.f/((img_h_ == 0 || img_w_ == 0) ? INPUT1_DIMS[3] : img_w_) ; 
    const float r_img_height = 1.f/((img_h_ == 0 || img_w_ == 0) ? INPUT1_DIMS[2] : img_h_) ;
    const float step_w = (step_w_ == 0 || step_h_ == 0) ? step_ : step_w_;
    const float step_h = (step_w_ == 0 || step_h_ == 0) ? step_ : step_h_;
    const int dim = layer_height * layer_width * num_priors_ * 4;

    global OUTPUT0_TYPE* top_data =  output;
    int idx = 0;
    for (int h = 0; h < layer_height; ++h)
    {
        for (int w = 0; w < layer_width; ++w)
        {
             const float center_x = (w + offset_) * step_w;
             const float center_y = (h + offset_) * step_h;
             for (int s = 0; s < num_priors_; ++s)
             {
                const float box_width = width_[s];
                const float box_height = height_[s];
                const OUTPUT0_TYPE xmin = (center_x - box_width*0.5f)  *r_img_width;     // xmin
                top_data[idx++] = xmin;
                const OUTPUT0_TYPE ymin = (center_y - box_height*0.5f) *r_img_height;    // ymin
                top_data[idx++] = ymin;
                const OUTPUT0_TYPE xmax = (center_x + box_width*0.5f)  *r_img_width;      // xmax
                top_data[idx++] = xmax;
                const OUTPUT0_TYPE ymax = (center_y + box_height*0.5f) *r_img_height;     // ymax
                top_data[idx++] = ymax;
              }
         }
     }
     // clip the prior's coordidate such that it is within [0, 1]
     if (clip_)
     {
         for (int d = 0; d < dim; ++d)
         {
            const OUTPUT0_TYPE clipped = min(max((float)top_data[d], 0.0f), 1.0f);
            top_data[d] = clipped;
         }
     }

     // set the variance.
     const int offset = OUTPUT0_DIMS[2];
     top_data += offset;
  	 //printf("offset %d\n", offset);

     if ((sizeof(variance_)/sizeof(variance_[0])) == 1)
     {
         for (int i = 0; i < dim; ++i)
         {
            const OUTPUT0_TYPE variance = variance_[0];
            top_data[i] = variance;
         }
     }
     else
     {
         int count = 0;
         for (int h = 0; h < layer_height; ++h)
         {
             for (int w = 0; w < layer_width; ++w)
             {
                 for (int i = 0; i < num_priors_; ++i)
                 {
                     for (int j = 0; j < 4; ++j)
                     {
                        const OUTPUT0_TYPE variance = variance_[j];
                        top_data[count++] = variance;
                     }
                 }
             }
         }
     }
}
