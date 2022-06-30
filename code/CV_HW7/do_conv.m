function out = do_conv(img, kernel)
    img = double(img);
    [ker_y, ker_x] = size(kernel);
    im_pad = padarray(img, [ker_x ker_y]);  % STEP 0 -> zero Pad original image
    [y, x] = size(im_pad);   
    out = zeros(x,y);        
    kr = rot90(kernel);          % STEP 1 -> Rotate kernel 180 deg for convolution
    kr = rot90(kr);
    %STEP 2 -> slide the kernel alongside the IMAGE 
    for i=(1+ker_y):(y-ker_y)
        for j=(1+ker_x):(x-ker_x)     % index through each image pixel        
            neigh = im_pad(i-floor(ker_y/2):i+floor(ker_y/2), j-floor(ker_x/2):j+floor(ker_x/2));   % Create local neighborhood of image
            accum = 0; 
            for u=1:ker_y      % index through each kernel row 
                for v=1:ker_x  % index through each kernel element
                    if(i>ker_y && i<y-ker_y && j>ker_x && j<y-ker_x)
                    temp = neigh(u,v)*kr(u,v);
                    accum = accum + temp;
                    end
                end
            end
            out(i,j) = accum;   %Set value of pixel in new image with convolution operation resultant
            %STEP 3 -> REPEAT STEP 2 UNTIL WE'BE GONE OVER ALL THE PIXEL VALUES
            
        end
    end
   
end