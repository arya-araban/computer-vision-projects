clear;
img = rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\4\Lena.bmp'));
N = size(img,1);
T=1/4;

F = fft2(double(img));

%COMMENT OUT EITHER P1 OR P2

% PROBLEM 1  

% for k = 1 : N
%     for l = 1 : N
%         if(T*N<k && k<(l-T)*N && T*N<l && l<(l-T)*N)
%          F(k,l) = 0;
%         end  
%     end
% end

%PROBLEM 2 

for k = 1 : N
    for l = 1 : N
        %%%%     2_1       %%% 
        if(0<=k && k<=T*N && 0<=l && l<= T*N)
         F(k,l) = 0;
        end  

        %%%%     2_2       %%% 
        
      if(0<=k && k<=T*N && (1-T)*N <=l && l<= (N-1))
       F(k,l) = 0;
      end  
      
        %%%%     2_3       %%% 
        
      if( (1-T)*N<=k && k<=N-1 && 0 <=l && l<= T*N )
       F(k,l) = 0;
      end 
      
        %%%%     2_4       %%% 
        
      if((1-T)*N<=k && l<= N-1 )
       F(k,l) = 0;
      end       
  
    end
end
ret_img = ifft2(F);
ret_img = uint8(real(ret_img)); 
figure(4); imshow(ret_img); imwrite(ret_img,'3_filter2_1.4.png');