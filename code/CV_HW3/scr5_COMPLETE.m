clear;
figure(1);
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\3\Lena.bmp');
out = rgb2gray(img);
a = [1,0;0,-1];
b = [0,1;-1,0];

out = do_conv(out,b);

imshow(out);