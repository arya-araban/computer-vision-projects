clear

in = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\1\Barbara.bmp');
dataType = 'uint8'; %the original datatype
in = rgb2gray(in);
L = 1; %NUMBER OF LAYERS
figure(1);


% we convert to double so we can do math on the original image
in = double(in); 
%Doing the main computations for quantization
q = 256/L;
v = floor(in./q);
v = v.*q;

%return the images to their original datatype
v = uint8(v); 
in = uint8(in);
%--- PLOT without histeq ----
subplot(1,2,1)
imshow(v);
title('without histeq')
without_histeq_mse = int64(immse(v,in))

%---NOW WITH HISTEQ ----
v = histeq(v); 
with_histeq_mse = int64(immse(v,in))

subplot(1,2,2)
imshow(v);
title('with histeq')