clear;

in = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\1\Goldhill.bmp');
figure(1);
%below code downsamples by 2, by eliminating rows & cols with factor of 2. 

ds_img_no_avg = in(1:2:end,1:2:end); 

%below code takes an average between 2 rows & cols 
ds_img_avg = in(ceil(mean(reshape(1:end,2,[]))), ceil(mean(reshape(1:end,2,[]))));

%and here below we represent, PI and BI
out1 = bilinear_interpolation(ds_img_no_avg);
subplot(1,2,1)
imshow(out1);
title('B-I using elim method')
BI_Immse = immse(in,out1)

out2 = pixel_replication(ds_img_no_avg);
subplot(1,2,2)
imshow(out2);
title('P-R using elim method')

PR_Immse = immse(in,out2)

function output = pixel_replication(img)
[X,Y] = size(img);
%make sure output is 2* the size of the input
output = zeros(2*X,2*Y);
for x = 1:X 
    for y = 1:Y
        %first we find the top-left, and then find others in respect to it
        j = 2*(x-1) + 1; 
        i = 2*(y-1) + 1;         
        output(j,i) = img(x,y); %// Top-left
        output(j+1,i) = img(x,y); %// Bottom-left
        output(j,i+1) = img(x,y); %// Top-right
        output(j+1,i+1) = img(x,y); %// Bottom-right
    end
end
output = uint8(output);
end

function output = bilinear_interpolation(img)
[X, Y] = size(img);
output = zeros(2*X,2*Y);
% If the zooming factor is 2, then the mapped pixel point in the original 
%image is given by ‘r’ and ‘c’ as r = floor(x/2) and c = floor(y/2)
for i = 1:2*X
    for j = 1: 2*Y 
        x1 = uint32(floor(i/2));
        x2 = uint32(ceil(i/2));
        if x1 == 0
            x1 = 1;
        end
        x = rem(i/2,1);
        
        y1 = uint32(floor(j/2));
        y2 = uint32(ceil(j/2));
        if y1 == 0
            y1 = 1;
        end
        y = rem(j/2,1);
        ctl = img(x1,y1,:); %// Top-left
        cbl = img(x2,y1,:); %// Bottom-left
        ctr = img(x1,y2,:); %// Top-right
        cbr = img(x2,y2,:); %// Bottom-right
        %the bilinear formula in which we use to find correct mapping
        output(i,j,:) = ((cbr*y)+(cbl*(1-y))*x)+((ctr*y)+(ctl*(1-y))*(1-x));
    end
end
output = uint8(output);
end