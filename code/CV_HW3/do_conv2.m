function out = convolution2(img, k)
    img = double(img);
    [kX, kY] = size(k);             % Read kernel size
    im_pad = padarray(img, [kX kY]);  % Pad original image
    [X, Y] = size(im_pad);          % Read image size
    out = zeros(X,Y);         % Create empty matrix to store output image
    kr = rot90(k);          % Rotates kernel 180 deg for convolution
    kr = rot90(kr);
   
for ii = 1 : X
    for jj = 1 : Y
        % Get the block
        row_begin = ii;
        row_end = min(X, ii + matrix_rows); %we put the min here so we don't go out of bounds
        col_begin = jj;
        col_end = min(Y, jj + matrix_cols); %we put the min here so we don't go out of bounds
        blk = img(row_begin : row_end, col_begin : col_end, :).*kr;
        O = median(blk(:)); %convert blk to a column, then find median of that
        % the output of this is in O, concatenate this with the other grids
        out(ii, jj) = O;
    end
end
    out=out(1+kY:y-kY,1+kX:x-kX);       % Remove image padding
    out = uint8(out);

end