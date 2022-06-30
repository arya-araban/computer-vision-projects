clear; clc; close all;

imNum = 3;

%detect the features of both the img and reference using FAST algorithm 

main_img = rgb2gray(imread(['C:\Users\Arya\Desktop\computer vision\HW\Images\7\Attack 1\',num2str(imNum),'.bmp']));

img_features = detectFASTFeatures(main_img,'MinContrast', 0.0000000001);

reference_img = rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\7\Reference.bmp'));
reference_img = imresize(reference_img,[350,350]);
ref_features = detectFASTFeatures(reference_img);

%extract features from the main image and the reference image
[features1,validpoints1] = extractFeatures(main_img,img_features);
[features2,validpoints2] = extractFeatures(reference_img,ref_features);

%returns indices of the matching features in the two feature sets. 
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = validpoints1(indexPairs(:,1));
matchedPoints2 = validpoints2(indexPairs(:,2));

%find exact x and y points, each in a vector,
%x1 and y1 for main image, x2 and y2 for the referecne image
x1 = matchedPoints1.Location(:,1);
y1 = matchedPoints1.Location(:,2);
x2 = matchedPoints2.Location(:,1);
y2 = matchedPoints2.Location(:,2);
z1 = [x1 y1];
z2 = [x2 y2];

%Fit geometric transformation to control point pairs
tform = fitgeotrans(z1,z2,'nonreflectivesimilarity');

new_img = rgb2gray(imread(['C:\Users\Arya\Desktop\computer vision\HW\Images\7\Attack 2\',num2str(imNum),'.bmp']));

output = imwarp(new_img,tform,'cubic','OutputView', imref2d(size(new_img)));
output = imresize(output,[512 512]);

figure,imshow(output);

original_img = rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\7\Original.bmp')); 

disp("MSE=" + immse(original_img,output) + " --- " + "SSIM=" + ssim(original_img,output) + " --- " + "MP= "+ matchedPoints1.Count);

imwrite(output ,'x.png');

figure, imagesc(main_img), axis image, colormap(gray), hold on
    plot(x1,y1,'ys'), title('main');
    
figure, imagesc(reference_img), axis image, colormap(gray), hold on
    plot(x2,y2,'ys'), title('reference');
