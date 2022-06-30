clear;
prob = 0;

img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\2\Camera Man.bmp'); 
figure(1);

freq_arr = histOfImage(img); 

n = 0 : 255; 
  

new_img = histogramEqualization(img);
subplot(1,2,1)
imshow(new_img);
freq_arr2 = histOfImage(new_img);

subplot(1,2,2)
stem(n,freq_arr2);
title('EQUALIZED HISTOGRAM'); 
ylabel('Number of pixels'); 
xlabel('Intensity Levels'); 
