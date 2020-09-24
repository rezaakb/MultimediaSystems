filename='inputs/lena_gray_256.tif';
im = imread(filename);

im_noise_gaussian = imnoise(im,'gaussian',0,0.01);

h = fspecial('gaussian',[5 5],1);
res_gaussian = imfilter(im_noise_gaussian, h, 'symmetric');

h=figure;

subplot(1,3,1)
imshow(im)
title('im')
subplot(1,3,2)
imshow(im_noise)
title('im with noise')
subplot(1,3,3)
imshow(res_gaussian)
title('gaussian filter')

saveas(h,'outputs/Q3/Q3_2.png');
