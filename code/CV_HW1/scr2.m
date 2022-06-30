in = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\1\Elaine.bmp');

figure(1), clf, hold on
subplot(1,2,1)
imshow(in);

rows = size(in, 1);
cols = size(in, 2);

out = zeros(rows,cols);

midx = cols/2;
midy = rows/2;

deg = 80;
rads = deg*pi/180;

rows_rotated = rows * sqrt(2);
midy_rotated = rows_rotated/2;


cols_rotated = cols*sqrt(2);
midx_rotated = cols_rotated/2;

for i=1:rows_rotated
    x_value = i - midx_rotated;
    for j=1:cols_rotated
        y_value = j - midy_rotated;
        
        %we put round below since we want to get int not double
        x = round(x_value*cos(rads)- y_value*sin(rads)) + midx; 
        y = round(x_value*cos(rads)+ y_value*sin(rads)) + midy;
        
        %we don't want to go out the output size...
        if (x >= 1 && y>=1 && x<=cols && y<=rows)
             out(i,j, :) = in(x,y,:);
        end
    end
end
out = uint8(out);
subplot(1,2,2)
imshow(out);
          