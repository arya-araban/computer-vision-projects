clear; 
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\5\Pepper.bmp');
L = 8; %NUMBER OF LAYERS
sz = size(img);

R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

im(:,1) = R(:);
im(:,2) = G(:);
im(:,3) = B(:); 
im = double(im);
%Doing the main computations for quantization
q = 256/L;
v = floor(im./q);
v = v.*q;
%reshape to the original image
out(:,:,1)=reshape(v(:,1),sz(1),sz(2)); 
out(:,:,2)=reshape(v(:,2),sz(1),sz(2)); 
out(:,:,3)=reshape(v(:,3),sz(1),sz(2)); 

out = uint8(out);
disp("MSE=" + immse(img,out) + " --- " + "PSNR=" + psnr(img,out));
imshow(out); imwrite(out,'2_quan2_8.jpg');