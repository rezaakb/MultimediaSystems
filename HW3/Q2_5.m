filename='inputs/mzrun_color_512.jpg';

im = imread(filename);

hsv_im = rgb2hsv(im);
intensity_hsv_im = hsv_im(:,:,3);
histeq_hsv = histeq(intensity_hsv_im);
imadjust_hsv = imadjust(intensity_hsv_im);

res_histeq_hsv = zeros(size(hsv_im),'like',hsv_im);
res_histeq_hsv(:,:,1:2)=hsv_im(:,:,1:2);
res_histeq_hsv(:,:,3)=histeq_hsv;

res_imadjust_hsv =  zeros(size(hsv_im),'like',hsv_im);
res_imadjust_hsv(:,:,1:2)=hsv_im(:,:,1:2);
res_imadjust_hsv(:,:,3)=imadjust_hsv;

res_imadjust = hsv2rgb(res_imadjust_hsv);
res_histeq = hsv2rgb(res_histeq_hsv);

h=figure;

subplot(1,3,1)
imshow(im)
title('im')

subplot(1,3,2)
imshow(res_histeq)
title('histeq(im)')

subplot(1,3,3)
imshow(res_imadjust)
title('imadjust(im)')

saveas(h,'outputs/Q2/Q2_5_hsv.png');

ycbcr_im = rgb2ycbcr(im);
intensity_ycbcr_im = ycbcr_im(:,:,1);
histeq_ycbcr = histeq(intensity_ycbcr_im);
imadjust_ycbcr = imadjust(intensity_ycbcr_im);

res_histeq_ycbcr = zeros(size(ycbcr_im),'like',ycbcr_im);
res_histeq_ycbcr(:,:,2:3)=ycbcr_im(:,:,2:3);
res_histeq_ycbcr(:,:,1)=histeq_ycbcr;

res_imadjust_ycbcr =  zeros(size(ycbcr_im),'like',ycbcr_im);
res_imadjust_ycbcr(:,:,2:3)=ycbcr_im(:,:,2:3);
res_imadjust_ycbcr(:,:,1)=imadjust_ycbcr;

res_imadjust = ycbcr2rgb(res_imadjust_ycbcr);
res_histeq = ycbcr2rgb(res_histeq_ycbcr);

h=figure;

subplot(1,3,1)
imshow(im)
title('im')

subplot(1,3,2)
imshow(res_histeq)
title('histeq(im)')

subplot(1,3,3)
imshow(res_imadjust)
title('imadjust(im)')

saveas(h,'outputs/Q2/Q2_5_ycbcr.png');
