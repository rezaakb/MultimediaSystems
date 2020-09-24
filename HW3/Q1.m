filename='inputs/cameraman.tif';

% y=0
im1 = Q1_convert(filename,1);
imwrite(im1,'outputs/Q1/y=0.jpg')

% x=0
im2 = Q1_convert(filename,2);
imwrite(im2,'outputs/Q1/x=0.jpg')

% y=x
im3 = Q1_convert(filename,3);
imwrite(im3,'outputs/Q1/y=x.jpg')

% y=-x
im4 = Q1_convert(filename,4);
imwrite(im4,'outputs/Q1/y=-x.jpg')
