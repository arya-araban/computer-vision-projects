clear;
clc;
figure(1);
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\3\Lena.bmp'); 
img = rgb2gray(img);
WINDOW_SIZE = 7;
box_filter = ones(WINDOW_SIZE)*(1/((WINDOW_SIZE)^2));

out1 = imnoise(img, 'gaussian', 0, 0.01);%add noise
out2 = imnoise(img, 'gaussian', 0, 0.05);
out3 = imnoise(img, 'gaussian', 0, 0.1);

%out1 = do_median(out1,WINDOW_SIZE);
out1 = do_conv(out1,box_filter);
subplot(2,2,1);
imshow(out1);
title ('var = 0.05')
immse(img,out1)

%out2 = do_median(out2,WINDOW_SIZE);
out2 = do_conv(out2,box_filter);
subplot(2,2,2);
imshow(out2);
title ('var = 0.05')
immse(img,out2)

%out3 = do_median(out3,WINDOW_SIZE);
out3 = do_conv(out3,box_filter);
subplot(2,2,3);
imshow(out3);
title ('var = 0.1')
immse(img,out3)
