function out = do_median(img,WINDOW_SIZE)

[X, Y] = size(img); 
matrix_rows = WINDOW_SIZE;
matrix_cols = WINDOW_SIZE;

out = uint8(zeros(X,Y));

for ii = 1 : X
    for jj = 1 : Y
        % Get the block
        row_begin = ii;
        row_end = min(X, ii + matrix_rows); %we put the min here so we don't go out of bounds
        col_begin = jj;
        col_end = min(Y, jj + matrix_cols); %we put the min here so we don't go out of bounds
        blk = img(row_begin : row_end, col_begin : col_end, :);
        O = median(blk(:)); %convert blk to a column, then find median of that
        % the output of this is in O, concatenate this with the other grids
        out(ii, jj) = O;
    end
end
end

