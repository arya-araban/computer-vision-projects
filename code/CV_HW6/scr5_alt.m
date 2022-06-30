close all
clear
clc
a3=imread('C:\Users\Arya\Desktop\computer vision\HW\Images\6\Lena.bmp');
bnoisy=rgb2gray(a3);

th='s';
thresh_val = 0.6745;
%th = 'h';
bnoisy  = double(imnoise(bnoisy,'gaussian'));

[a1,b1,c1,d1]=dwt2(bnoisy,'db2');
imshow(b1)
[a2,b2,c2,d2]=dwt2(a1,'db2');
[a3,b3,c3,d3]=dwt2(a2,'db2');


v1=(median(abs(b3(:)))/thresh_val);
b3= wthresh(b3,th,v1);
v2=(median(abs(c3(:)))/thresh_val);
c3= wthresh(c3,th,v2);
v3=(median(abs(d3(:)))/thresh_val);
d3= wthresh(d3,th,v3);


v1=(median(abs(b2(:)))/thresh_val);
b2= wthresh(b2,th,v1);
v2=(median(abs(c2(:)))/thresh_val);
c2= wthresh(c2,th,v2);
v3=(median(abs(d2(:)))/thresh_val);
d2= wthresh(d2,th,v3);

v1=(median(abs(b1(:)))/thresh_val);
b1= wthresh(b1,th,v1);
v2=(median(abs(c1(:)))/thresh_val);
c1= wthresh(c1,th,v2);
v3=(median(abs(d1(:)))/thresh_val);
d1= wthresh(d1,th,v3);

a2=idwt2(a3,b3,c3,d3,'db2');
a1=idwt2(a2,b2,c2,d2,'db2');
c=idwt2(a1(1:257,1:257),b1,c1,d1,'db2');


imshow(bnoisy,[])
figure,imshow(c,[])

