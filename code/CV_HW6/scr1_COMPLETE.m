clear;
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\6\Lena.bmp');
img = rgb2gray(img);
L = 3;
%CONSTRUCT PYRAMID
[pyramid,laplacians] = laplacian_pyramid(img,L);    

%RECONSTRUCTION
[n,~] = size(laplacians);
last_img = laplacians{n};
for i=1:L
    n = n-1;
    last_img = pixel_replication(last_img);
    last_img = last_img + laplacians{n};
end
last_img = uint8(last_img);

disp("MSE=" + immse(img,last_img) + " --- " + "PSNR=" + psnr(img,last_img));
imshow(last_img);


figure();imshow(last_img);

imwrite(last_img, "1_reconstructed.jpg");



function [final,laplacians_last_img] = laplacian_pyramid(img,levels)
    
    avg_filter = [1 1;1 1]/4;
    [R,C]  = size(img);
    final = zeros(2*R,2*C,'uint8');
    old_img = double(img);
    
    N = levels;
    laplacians_last_img = cell(N,1);
    for i=1:levels
        
        r1 = R-(0.5)^(i-1)*R+1;
        r2 = R;
        
        c1 = ((2^(i-1)-1)/(2^(i-2)))*C+1;
        c2 = (2^(i)-1)/(2^(i-1))*C;
        
        final(r1:r2,c1:c2) = old_img;
        
        new_img = guassian_filter(old_img,avg_filter);
        
        
        laplace = old_img - pixel_replication(new_img);
    
        laplacians_last_img{i} = laplace;
        
        laplace = normalize(laplace);
        laplace = uint8(laplace);
        
        r1 =R+1;
        r2 = R+(0.5)^(i-1)*R;
        
        final(r1:r2,c1:c2)=laplace ;
        old_img = new_img;
    end
    
    i = levels+1;
    r1 = R-(0.5)^(i-1)*R+1;
    r2 = R;
    c1 = ((2^(i-1)-1)/(2^(i-2)))*C+1;
    c2 = (2^(i)-1)/(2^(i-1))*C;
    final(r1:r2,c1:c2) = old_img;
    r1 =R+1;
    r2 = R+(0.5)^(i-1)*R;
    final(r1:r2,c1:c2) = old_img;
    
    laplacians_last_img{levels+1}=old_img;
end

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
end

function output=guassian_filter(image,filter)
    [R,C] = size(image);
    output = zeros(R/2,C/2,'double');
    for i=1:2:R
        for j=1:2:C
            part = double(image(i:i+1,j:j+1));
            mult = part.*filter;
            out = sum(mult,'all');
            output(ceil(i/2),ceil(j/2)) = out;
        end
    end
end

function output = normalize(img)
    output = mat2gray(img);
    Max = max(max(output));
    Min = min(min(output));
    output = (255/(Max-Min))*output;
end