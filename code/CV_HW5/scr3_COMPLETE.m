clear; 

img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\5\Pepper.bmp');
L1 = 8; %R and G layers
L2 = 4; % B layer
sz = size(img);

R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

im(:,1) = R(:);
im(:,2) = G(:);
im(:,3) = B(:); 
im = double(im);
%Doing the main computations for quantization
q1 = 256/L1;
v1 = floor(im(:,1:2)./q1); %R and G 
v1 = v1.*q1;

q2 = 256/L2;
v2 = floor(im(:,3)./q2); %B 
v2 = v2.*q2;

v = [v1 v2];
%reshape to the original image
out(:,:,1)=reshape(v(:,1),sz(1),sz(2)); 
out(:,:,2)=reshape(v(:,2),sz(1),sz(2)); 
out(:,:,3)=reshape(v(:,3),sz(1),sz(2)); 

out = uint8(out);
disp("MSE=" + immse(img,out) + " --- " + "PSNR=" + psnr(img,out));
imshow(out); imwrite(out,'3_quan_dif_levels.jpg');