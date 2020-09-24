filename='inputs/lena_gray_256.tif';

im = im2double(imread(filename));


h=figure;

subplot(2,2,1)
imshow(im)
title('im')

res2 = DCTWithN(im,2);

subplot(2,2,2)
imshow(res2)
title('2')

res6 = DCTWithN(im,6);

subplot(2,2,3)
imshow(res6)
title('6')

res11 = DCTWithN(im,11);

subplot(2,2,4)
imshow(res11)
title('11')

saveas(h,'outputs/Q4/Q4.jpg');

mse_2 = immse(res2,im)
mse_6 = immse(res6,im)
mse_11 = immse(res11,im)


function res = DCTWithN (im,N)
[m,n]=size(im);

D = dctmtx(8);
dct = @(block_struct) D * block_struct.data * D';
DCT_image = blockproc(im, [8 8], dct, 'PadPartialBlocks', true , 'PadMethod', 'replicate');

mask = zeros([8,8]);
DCT = zeros([m,n],'like',DCT_image);

for i=1:8
    for j=1:8
        if (i+j<(N+1))
            mask(i,j)=1;
        end
    end
end

for i=1:8:m
    for j=1:8:n
        DCT(i:i+7,j:j+7) = DCT_image(i:i+7,j:j+7) .* mask;
    end
end

invdct = @(block_struct) D' * block_struct.data * D;
res = blockproc(DCT , [8 8], invdct , 'PadPartialBlocks', ...
true , 'PadMethod', 'replicate');
end
