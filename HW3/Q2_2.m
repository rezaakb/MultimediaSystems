filename='inputs/nrg_512.tif';
im = imread(filename);

res2 = histeq(im,2);
res4 = histeq(im,4);
res16 = histeq(im,16);
res256 = histeq(im,256);

h=figure;


subplot(4,2,1)
imshow(res2)

subplot(4,2,2)
imhist(res2)
subplot(4,2,3)
imshow(res4)

subplot(4,2,4)
imhist(res4)

subplot(4,2,5)
imshow(res16)

subplot(4,2,6)
imhist(res16)
subplot(4,2,7)
imshow(res256)

subplot(4,2,8)
imhist(res256)


saveas(h,'outputs/Q2/Q2_2.jpg')
