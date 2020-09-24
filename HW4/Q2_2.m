im1 = imread('inputs/Frame-3.jpg');
im2 = imread('inputs/Frame-4.jpg');

%Q2_2_1
im1 = rgb2gray(im1);
im2 = rgb2gray(im2);

h=figure;
subplot(1,2,1)
imshow(im1)
subplot(1,2,2)
imshow(im2)
saveas(h, 'outputs/Q2/Q2_2_1.png')

%Q2_2_2
h=figure;
dif = im1-im2;
imshow(dif)
saveas(h, 'outputs/Q2/Q2_2_2.png')

%Q2_2_3
[m, n] = size(im1);
resault = zeros([m n],'uint8');
mov1 = zeros([floor(m/16) floor(n/16) 2],'uint8');
for i= 1:16:m-16
    for j= 1:16:n-16
         [resault(i:i+16,j:j+16),mov1(floor(i/16)+1,floor(j/16)+1,:)] = findBestMatch(im1,im2(i:i+16,j:j+16),i,j);
         mov1(floor(i/16)+1,floor(j/16)+1,1) = mov1(floor(i/16)+1,floor(j/16)+1,1) -i;
         mov1(floor(i/16)+1,floor(j/16)+1,2) = mov1(floor(i/16)+1,floor(j/16)+1,2) -j;
    end
end

h=figure;
imshow(resault)
saveas(h, 'outputs/Q2/Q2_2_3.png')


%Q2_2_4
[m, n] = size(im1);
resault = zeros([m n],'uint8');
mov2 = zeros([floor(m/16) floor(n/16) 2],'uint8');
for i= 1:16:m-16
    for j= 1:16:n-16
        [resault(i:i+16,j:j+16),mov2(floor(i/16)+1,floor(j/16)+1,:)] = findBestMatchWithDivideAndConquer(im1,im2(i:i+16,j:j+16),i+8,j+8,23,16);
        mov2(floor(i/16)+1,floor(j/16)+1,1) = mov2(floor(i/16)+1,floor(j/16)+1,1) -i;
        mov2(floor(i/16)+1,floor(j/16)+1,2) = mov2(floor(i/16)+1,floor(j/16)+1,2) -j;
    end
end

h=figure;
imshow(resault)
saveas(h, 'outputs/Q2/Q2_2_4.png')


function [res,mov,minimum] = findBestMatch(im1,block,i2,j2)
[m, n] = size(im1);
minimum=1000000;
i1=0;
j1=0;
for i= max(i2-16,1):min(m-16,i2+16)
    for j= max(j2-16,1):min(n-16,j2+16)
        tmp =sum(sum(abs(im1(i:i+16,j:j+16)-block)));
        if tmp <minimum
            minimum = tmp;
            i1 = i;
            j1 = j;
        end
    end
end
res = im1(i1:i1+16,j1:j1+16)-block;
mov = [i1,j1];

end


function [res,mov] = findBestMatchWithDivideAndConquer(im1,block,i2,j2,a,b)
if b==1
    res = im1(i2-8:i2+8,j2-8:j2+8)-block;
    mov = [i2-8,j2-8];
    return 
end
[m, n] = size(im1);
minimum=1000000;
i1=0;
j1=0;
for i= max(i2+floor(b/2)-a,9):2*a-b:min(m-8,i2+a-floor(b/2))
    for j= max(j2+floor(b/2)-a,9):2*a-b:min(n-8,j2+a-floor(b/2))
        tmp =sum(sum(abs(im1(i-8:i+8,j-8:j+8)-block)));
        if tmp <minimum
            minimum = tmp;
            i1 = i;
            j1 = j;
        end
    end
end
[res,mov] = findBestMatchWithDivideAndConquer(im1,block,i1,j1,floor(a/2),floor(b/2));
end
