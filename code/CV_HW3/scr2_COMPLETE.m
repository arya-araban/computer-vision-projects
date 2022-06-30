clear;
clc;
figure(1);
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\3\Lena.bmp'); 
img = rgb2gray(img);
out1 = imnoise(img,'salt & pepper',0.05);
out2 = imnoise(img,'salt & pepper',0.1);
out3 = imnoise(img,'salt & pepper',0.2);
[X, Y] = size(img); 
WINDOW_SIZE = 9;
out1 = do_median(out1,WINDOW_SIZE);
out2 = do_median(out2,WINDOW_SIZE);
out3 = do_median(out3,WINDOW_SIZE);

subplot(2,2,1);
imshow(out1);
title ('p = 0.05')
immse(img,out1)

subplot(2,2,2)
imshow(out2);
title ('p = 0.1')
immse(img,out2)

subplot(2,2,3)
imshow(out3);
title ('p = 0.2')
immse(img,out3)
