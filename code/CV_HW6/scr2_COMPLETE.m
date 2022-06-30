clear;
img=rgb2gray(imread('C:\Users\Arya\Desktop\computer vision\HW\Images\6\Lena.bmp'));

prompt={'enter the level of pyramid'};
dlg='enter 1 to 8';
l=cell2mat(inputdlg(prompt,dlg));
l= sscanf(l,'%f');
f=1;
for p=1:l
[r,c]=size(img);
z=img;
    for i=1:1:r %moving horizontal
        k=1;
        t=(r/2+1);
        for j=1:2:c % going the pixels 2 by 2, skipping one each time!
            avg=(img(i,j)+img(i,j+1))/2;
            dif=(img(i,j)-img(i,j+1))/2;
            z(i,k)=avg;
            z(i,t)=dif;
            k=k+1;
            t=t+1;
        end
    end
    img=z;
    
    for j=1:1:c % moving vertical
        t=(r/2+1);
        k=1;
        for i=1:2:r
            avg=(img(i,j)+img(i+1,j))/2;
            dif=(img(i,j)-img(i+1,j))/2;
            z(k,j)=avg;
            z(t,j)=dif; 
            k=k+1;
            t=t+1;
        end
    end
    
    if p==1
        v=z;
    else
    v(1:512/(2^f),1:512/(2^f))=z;
    f=f+1;
    end
    img=z(1:512/(2^p),1:512/(2^p));
end

img=imresize(img,[512 512]);
figure();imshow(v);
figure();imshow(img);
   