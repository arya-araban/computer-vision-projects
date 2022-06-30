function gs_frequency_array = histOfImage(img)

    [X, Y] = size(img); 
    % we Create a grayscale frequency array 
    gs_frequency_array = 1 : 256;   
    count = 0; 
    
    % we Iterate over grayscale image matrix for all possible intensities,
    % and then count them, to finally put them in gs_frequency

    for intensity_val = 1 : 256 
        for x = 1 : X 
            for y = 1 : Y 

                % if image pixel value at location (x, y) is equal to
                % intensity_val-1, then we increment its count 
                if img(x, y) == intensity_val-1 
                        count = count + 1; 
                end
            end
        end
        % update ith position of frequency array with count, then reset count
        gs_frequency_array(intensity_val) = count; 
        count = 0; 

    end
    
end 
