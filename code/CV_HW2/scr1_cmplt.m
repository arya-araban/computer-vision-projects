clear;
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\2\Camera Man.bmp'); 
figure(1);
subplot(1,2,1)
imshow(img);


freq_arr = histOfImage(img);
  
n = 0 : 255; 
  
% Display Histogram 
subplot(1,2,2)
stem(n, freq_arr); 
title('HISTOGRAM'); 
ylabel('Number of pixels'); 
xlabel('Intensity Levels'); 