clear

im1 = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\1\Elaine.bmp');

imshow(im1); 
[m,n,p]=size(im1);


deg = 30;
%converting the degrees to radians..
thet = deg*pi/180;
%we take m*2 and n*2 to make sure the rotated image fits in the range
output_m = m*2;
output_n = n*2;
for t=1:output_m
   for s=1:output_n
       %Here we're doing the affine transformation as well as inverse
       %mapping, hence the reason for subtracting with output_m/2 = m and
       %output_n/2 = n
      i = round((t-m)*cos(thet)+(s-n)*sin(thet)+m/2);
      j = round((s-n)*cos(thet)+n/2-(t-m)*sin(thet));
      if i>0 && j>0 && i<=m && j<=n           
         im2(t,s,:)=im1(i,j,:);
      end
   end
end
figure;
imshow(im2);