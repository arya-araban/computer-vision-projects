clear;
img = rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\6\Lena.bmp'));
nLevel = 3;  % Number of decompositions
map = gray; %grayscale colormap
nColors = size(map, 1);  % Number of colors in colormap
cA = cell(1, nLevel);    % Approximation coefficients
cH = cell(1, nLevel);    % Horizontal detail coefficients
cV = cell(1, nLevel);    % Vertical detail coefficients
cD = cell(1, nLevel);    % Diagonal detail coefficients

startImage = img;
%Pyramid Construction 
for iLevel = 1:nLevel,
  [cA{iLevel}, cH{iLevel}, cV{iLevel}, cD{iLevel}] = dwt2(startImage, 'haar');
  %  applying the quantFunc for each of the regions
  cA{iLevel} = quantFunc(cA{iLevel});
  cH{iLevel} = quantFunc(cH{iLevel});
  cV{iLevel} = quantFunc(cV{iLevel});
  cD{iLevel} = quantFunc(cD{iLevel});
  startImage = cA{iLevel};
end

tiledImage = wcodemat(cA{nLevel}, nColors);
for iLevel = nLevel:-1:1,
  tiledImage = [tiledImage                    wcodemat(cH{iLevel}, nColors); ...
                wcodemat(cV{iLevel}, nColors) wcodemat(cD{iLevel}, nColors)];
end

figure;imshow(tiledImage, map);

%Original Image Reconstruction
fullRecon = cA{nLevel};
for iLevel = nLevel:-1:1,
  fullRecon = idwt2(fullRecon, cH{iLevel}, cV{iLevel}, cD{iLevel}, 'haar');
end
fullRecon = uint8(fullRecon);

imwrite(fullRecon, "4_reconstructed.jpg");
figure;imshow(fullRecon);
disp("MSE=" + immse(img,fullRecon) + " --- " + "PSNR=" + psnr(img,fullRecon));


function out = quantFunc (img) %quantize an image with by the step size(gamma) of two 
    [X,Y] = size(img);
    out = double(zeros(X,Y));
    for i=1:X
        for j=1:Y
            out(i,j) = 2* sign(img(i,j))*floor( abs(img(i,j))/2);
        end
    end
end
