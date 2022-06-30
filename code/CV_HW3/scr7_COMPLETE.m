clear;
figure(1);
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\3\piano.jpg');
WINDOW_SIZE = 7;
out = rgb2gray(img);
box_filter = ones(WINDOW_SIZE) * (1/((WINDOW_SIZE)^2));
sharpen_filter = [0,-1,0;-1,5,-1;0,-1,0];
sobel_filter =[1,0,-1] * (2);


TIMES_TO_FILTER = 3;

for i = 1:TIMES_TO_FILTER
    out = do_conv(out,box_filter);
end
out = do_conv(out,sharpen_filter);
imshow(out);