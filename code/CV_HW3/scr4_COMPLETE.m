clear;
figure(1);
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\3\Lena.bmp');
out = rgb2gray(img);
a = [1,0,-1] * (2);
b = [1,0,-1;1,0,-1;1,0,-1]* (1/6);
c = [1,0,-1;2,0,-2;1,0,-1]* (1/8);

out = do_conv(out,c);

imshow(out);