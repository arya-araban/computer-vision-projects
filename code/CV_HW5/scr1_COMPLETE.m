clear; 
figure(1);
im = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\5\Pepper.bmp');
img = double(im)/255; % show image between [0,1]

R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);

%FINDING HUE

theta = acosd((1/2*((R-G)+(R-B))) ./ ((((R-G).^2+((R-B).*(G-B))).^0.5))); 
H = theta;
H(B>G)=360-H(B>G);
H=H/360; % normalize hue to between [0,1]

%FINDING SATURATION
S =1-(3./(R+G+B)).*min(img,[],3);
%FINDING INTENSITY
I = (R+G+B)./3;

HSI=zeros(size(im));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;
imshow(HSI);

figure(2);
subplot(1,3,1)
imshow(H); 
title("Hue");
subplot(1,3,2)
imshow(S);
title("saturation");
subplot(1,3,3)
imshow(I); 
title("intensity");