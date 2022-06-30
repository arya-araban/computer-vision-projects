clear;
img = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\2\HE1.jpg'); 
[X, Y] = size(img); 
WINDOW_SIZE =200 ;
matrix_rows = WINDOW_SIZE;
matrix_cols = WINDOW_SIZE;
n = zeros(size(img)); % Declare output variable

for ii = 1 : matrix_rows : X
    for jj = 1 : matrix_cols : Y
        % Get the block
        row_begin = ii;
        row_end = min(size(img, 1), ii + matrix_rows); %we put the min here so we don't go out of bounds
        col_begin = jj;
        col_end = min(size(img, 2), jj + matrix_cols); %we put the min here so we don't go out of bounds
        blk = img(row_begin : row_end, col_begin : col_end, :);
        % Perform histogram equalization with the block stored in blk
        % ...
        O = histogramEqualization(blk);
        % Assume the output of this is stored in O
        out(row_begin : row_end, col_begin : col_end, :) = O;
    end
end
figure(1);
imshow(out);