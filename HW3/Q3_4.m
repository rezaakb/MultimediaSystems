filename='inputs/lena_gray_256.tif';
im = imread(filename);

im_canny = edge(im,'Canny');
im_sobel = edge(im,'Sobel');

h=figure;
subplot(1,3,1)
imshow(im)
title('im')
subplot(1,3,2)
imshow(im_canny)
title('canny')
subplot(1,3,3)
imshow(im_sobel)
title('sobel')
saveas(h,'outputs/Q3/Q3_4.png');