filename='inputs/lena_gray_256.tif';
im = imread(filename);

im_noise_salt = imnoise(im,'salt & pepper',0.05);
im_noise_gaussian = imnoise(im,'gaussian',0,0.01);

h = fspecial('gaussian',[5 5],1);
res_gaussian = imfilter(im_noise_gaussian, h, 'symmetric');
res_median = medfilt2(im_noise_salt,[3 3]);
res_averaging = imfilter(im_noise_salt, ones(3)/9, 'symmetric');


mse_gaussian = immse(res_gaussian,im)
mse_median = immse(res_median,im)
mse_averaging = immse(res_averaging,im)
