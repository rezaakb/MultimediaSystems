filename='inputs/nrg_512.tif';
im = imread(filename);
res = histeq(im);

h=figure;

subplot(2,2,1)
imshow(im)
subplot(2,2,2)
imhist(im)
subplot(2,2,3)
imshow(res)
subplot(2,2,4)
imhist(res)

saveas(h,'outputs/Q2/Q2_1.png')
