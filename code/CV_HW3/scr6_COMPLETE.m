clear;
figure(1);
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\3\Lena.bmp');
img = rgb2gray(img);
img = double(img);
a = 1; % a is between [0,1]
sigm1 = 0.5; %filter size is 2*ceil(2*sigma)+1
             %sigma is either 0.5(FS ->3), or 1 (FS -> 5),or 1.5 (FS -> 7), or 2 (FS -> 9)
sigm2 = 1;
sigm3 = 1.5;
sigm4 = 2;
%converting to double to perform arithmatic operations
img_guass1 = double(imgaussfilt(uint8(img), sigm1)); 
out1 = uint8(img + a*(img_guass1 - img));
subplot(2,2,1);imshow(out1);title("FS ->3");

img_guass2 = double(imgaussfilt(uint8(img), sigm2)); 
out2 = uint8(img + a*(img_guass2 - img));
subplot(2,2,2);imshow(out2);title("FS ->5");

img_guass3 = double(imgaussfilt(uint8(img), sigm3)); 
out3 = uint8(img + a*(img_guass3 - img));
subplot(2,2,3);imshow(out3);title("FS ->7");

img_guass4 = double(imgaussfilt(uint8(img), sigm4)); 
out4 = uint8(img + a*(img_guass4 - img));
subplot(2,2,4);imshow(out4);title("FS ->9");
