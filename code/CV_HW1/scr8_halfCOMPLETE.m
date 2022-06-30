clear;

MAX_X=750;
in1 = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\1\car1.jpg');

in2 = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\1\car2.jpg');

figure(1);
in1_modified = in1(1:end-17,1:777,:);
imshow(in1_modified);

in2_modified = in2(18:end,360:end,:);
figure(2);
% imshow(in2_modified);
imshow([in1_modified, in2_modified]);