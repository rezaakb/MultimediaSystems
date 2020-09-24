filename='inputs/nrg_512.tif';
im = imread(filename);

res1 = histeq(im);
res2 = imadjust(im);

h=figure;

subplot(1,3,1)
imshow(im)
title('im')

subplot(1,3,2)
imshow(res1)
title('histeq(im)')

subplot(1,3,3)
imshow(res2)
title('imadjust(im)')

saveas(h,'outputs/Q2/Q2_3_1.png')

h=figure;

subplot(2,1,1)
imhist(res1)
title('histogram histeq(im)')

subplot(2,1,2)
imhist(res2)
title('histogram imadjust(im)')

saveas(h,'outputs/Q2/Q2_3_2.png')

