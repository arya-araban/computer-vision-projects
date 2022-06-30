clear;
img1 = rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\4\Lena.bmp'));
img2 = rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\4\F16.bmp'));
img3 = rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\4\Baboon.bmp'));
F_not_shifted = fft2(img3);

%figure(1);subplot(1,2,1);imshow(abs(F_not_shifted),[]);title('without shifting');
F_shifted= fftshift(F_not_shifted);
%subplot(1,2,2);imshow(abs(F_shifted),[]);title('with shifting');
%with log 
modified_img_shift = log(1+abs(F_shifted));
modified_img_noshift = log(1+abs(F_not_shifted));

figure(3);subplot(1,2,1);imshow(modified_img_noshift,[]);title('without shifting');
subplot(1,2,2);imshow(modified_img_shift,[]);title('with shifting');
