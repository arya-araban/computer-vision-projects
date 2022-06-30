clc;
clear;
close;
% Read the image 
a=imread('C:\Users\Arya\Desktop\computer vision\HW\Images\2\Camera Man.bmp');
imdjst = imadjust(a);
hst = histeq(a);
figure(2);
subplot(2,1,1)
imshow(imdjst);
title('imadjust function');
subplot(2,1,2)
imshow(hst);