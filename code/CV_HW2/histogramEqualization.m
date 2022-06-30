function [output_img] = histogramEqualization(img)

[X, Y] = size(img); 


freq_arr = histOfImage(img); 
total_pixels = sum(freq_arr); %the total number of pixels we have for all intensity values

pdf = freq_arr/total_pixels;
cdf=cumsum(pdf);
lut = round(cdf*255);

output_img = zeros(size(img));
for x=1:X                              %loop tracing the rows of image
    for y=1:Y                          %loop tracing thes columns of image
        t=(img(x,y)+1);                %pixel values in image
        output_img(x,y)=lut(t);        %Making the ouput image using cdf as the transformation function
    end                                             
end
output_img = uint8(output_img);
end
