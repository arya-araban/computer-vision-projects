clear;
figure(1);
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\2\HE1.jpg'); 
img = rgb2gray(img);
subplot(1,2,1)
imshow(histogramEqualization(img));
title("global HE");
[X, Y] = size(img); 
WINDOW_SIZE =5 ;
matrix_rows = WINDOW_SIZE;
matrix_cols = WINDOW_SIZE;
n = zeros(size(img)); % Declare output variable

for ii = 1 : X
    for jj = 1 : Y
        % Get the block
        row_begin = ii;
        row_end = min(X, ii + matrix_rows); %we put the min here so we don't go out of bounds
        col_begin = jj;
        col_end = min(Y, jj + matrix_cols); %we put the min here so we don't go out of bounds
        blk = img(row_begin : row_end, col_begin : col_end, :);
        % Perform histogram equalization with the block stored in blk
        O = histogramEqualization(blk);
        % Assume the output of this is stored in O
        out(row_begin : row_end, col_begin : col_end, :) = O;
    end
end
subplot(1,2,2)
imshow(out);
title("local HE (window-size " + WINDOW_SIZE + ")")
