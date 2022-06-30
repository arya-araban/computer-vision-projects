clear;
A = 1/16 .* [1,2,1;2,4,2;1,2,1] %only this is seperable due to rank = 1
A1 = 1/4 .* [1;2;1];
A2 = 1/4 .* [1,2,1];
B = [-1, -1, -1; -1, 8, -1; -1, -1, -1];
C = [0, -1, 0; -1, 5, -1; 0, -1, 0];
img = rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\4\Barbara.bmp'));
figure(1); imshow(img,[]);

h = C;

%%%%% THIS EXTRA PART ONLY FOR THE FIRST FILTER %%%%%
% h1 = A2;
% h2 = A1;

PQ = 2*size(img);
%STEP 1 - PERFORM FFT 
F = fft2(double(img),PQ(1), PQ(2));
H = fft2(double(h), PQ(1), PQ(2));
%STEP 2 - PERFORM SHIFT
F = fftshift(F);
H = fftshift(H);

figure(2);subplot(1,2,1); imshow(log(abs(F)+1),[]); title('image magnitude spectrum');
subplot(1,2,2); imshow(angle(F),[]);  title('image phase spectrum');

figure(3);subplot(1,2,1);imshow(log(abs(H)+1),[]);  title('mask magnitude spectrum');
subplot(1,2,2);imshow(angle(H),[]); title('mask phase spectrum');
%STEP 3 - APPLY FILTER
F_fH = H.*F;

%%%%% THIS EXTRA PART ONLY FOR THE FIRST FILTER %%%%%

% H = fft2(double(h2), PQ(1), PQ(2));
% H = fftshift(H);
% F_fH = H.*F;
% figure(6);subplot(1,2,1);imshow(log(abs(H)+1),[]);  title('mask magnitude spectrum');
% subplot(1,2,2);imshow(angle(H),[]); title('mask phase spectrum');

figure(4);subplot(1,2,1); imshow(log(abs(F_fH)+1),[]); title('image magnitude spectrum');
subplot(1,2,2); imshow(angle(F_fH),[]);  title('image phase spectrum');
%STEP 4 - PERFORM INVERSE SHIFT 
F_fh = ifftshift(F_fH);
ffi = ifft2(F_fH);
%STEP 5 - RETURN THE IMAGE FROM THE FREQUENCY DOMAIN
ffi = ffi(2:size(img,1)+1, 2:size(img,2)+1);
ffi_abs = abs(ffi);
figure(5); imshow(ffi_abs,[]);