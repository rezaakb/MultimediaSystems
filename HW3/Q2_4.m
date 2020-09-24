filename='inputs/fomopan_grayscale_512.jpg';
im = imread(filename);

res1 = imadjust(im,[],[],0.2);
res2 = imadjust(im,[],[],0.6);
res3 = imadjust(im,[],[],1.6);
res4 = imadjust(im,[],[],2.2);


h=figure;

subplot(2,2,1)
imshow(res1)
title('g=0.2')

subplot(2,2,2)
imshow(res2)
title('g=0.6')

subplot(2,2,3)
imshow(res3)
title('g=1.6')

subplot(2,2,4)
imshow(res4)
title('g=2.2')

saveas(h,'outputs/Q2/Q2_4.png')
