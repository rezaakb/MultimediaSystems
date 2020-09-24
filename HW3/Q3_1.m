filename='inputs/lena_gray_256.tif';
im = imread(filename);

im_noise_salt = imnoise(im,'salt & pepper',0.05);


res_median = medfilt2(im_noise_salt,[3 3])
res_averaging = imfilter(im_noise_salt, ones(3)/9, 'symmetric');

h=figure;


subplot(2,2,1)
imshow(im)
title('im')
subplot(2,2,2)
imshow(im_noise)
title('im with noise')
subplot(2,2,3)
imshow(res_median)
title('median filter')
subplot(2,2,4)
imshow(res_averaging)
title('averaging filter')

saveas(h,'outputs/Q3/Q3_1.png');
