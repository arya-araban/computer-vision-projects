clear;
figure(1);
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\3\Lena.bmp');
WINDOW_SIZE = 3;

out = rgb2gray(img);
TIMES_TO_FILTER = 10;
box_filter = ones(WINDOW_SIZE) * (1/((WINDOW_SIZE)^2));
for i = 1:TIMES_TO_FILTER
    out = do_conv(out,box_filter);
end
imshow(out);