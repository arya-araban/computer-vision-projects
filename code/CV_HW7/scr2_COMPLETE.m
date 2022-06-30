clc; clear; close all;
image = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\7\Building.jpg');
image = imresize(image,[512 512]);
image = rgb2gray(image);
imwrite(image, "72_Original_building.jpg");
image_bw = im2single(image);
[result, left_Y, left_X] = harris(image_bw);

figure();imshow(result); imwrite(result,"72_Harris_Binary.jpg");


function [res, r, c] = harris(im)
    
    sigma = 3; thresh = 0.03;
    
    dx = [-1 0 1; -1 0 1; -1 0 1]; % Derivative masks
    dy = dx';
    
    Ix = do_conv(im, dx);    % Image derivatives
    Iy = do_conv(im, dy);    

    % Generate Gaussian filter of size 6*sigma (+/- 3sigma) and of
    % minimum size 1x1.
    g = fspecial('gaussian',max(1,fix(6*sigma)), sigma);
    
    % Smoothed squared image derivatives:
    Ix2 = do_conv(Ix.^2, g); 
    Iy2 = do_conv(Iy.^2, g);
    Ixy = do_conv(Ix.*Iy, g);
    
    % Find the Harris corner measure based on found derivatives: 
    res = (Ix2.*Iy2 - Ixy.^2)./(Ix2 + Iy2 + eps); 
   
	% Extract local maxima by performing a grey scale morphological
	% dilation and then finding points in the corner strength image that
	% match the dilated image and are also greater than the threshold.
	sze = 2+1;                   % Size of mask.
	mx = ordfilt2(res,sze^2,ones(sze)); % Grey-scale dilate.
	res = (res==mx)&(res>thresh);       % Find maxima.
	
	[r,c] = find(res);                  % Find row,col coords.
	
    %show points on the original image: 
     figure, imagesc(im), axis image, colormap(gray), hold on
     plot(c,r,'ys'), title('Corners');


end