function res=Q1_convert(filename, mode)
im = imread(filename);
[m,n] = size(im);
res = zeros([m,n],'like',im);
if mode==1
    % y=0
    res = im(m:-1:1,1:n);
elseif mode==2
    % x=0
    res = im(1:m,n:-1:1);
elseif mode==3
    % y=x
    theta = -90;
    tform = affine2d([cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1]);
    res = imwarp(im,tform); 
    res = res(1:m,n:-1:1);
elseif mode==4
    % y=-x
    theta = 90;
    tform = affine2d([cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1]);
    res = imwarp(im,tform); 
    res = res(1:m,n:-1:1);
end
end
