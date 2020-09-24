%Q2_1_1
h=figure;
vid=VideoReader('inputs/Video-1.avi');
f=readFrame(vid);
imshow(f)
f=getframe;
display(f)
data=f.cdata;
color=f.colormap;
subplot(2,1,1)
imshow(data);
subplot(2,1,2)
colormap(color);
saveas(h, 'outputs/Q2/Q2_1_1.png')


%Q2_1_2
v = VideoReader('inputs/Video-1.avi');
v_resault = VideoWriter('outputs/Q2/Video-2_1_2');
v_resault.FrameRate = v.FrameRate;
open(v_resault);
filter = fspecial('gaussian',[5 5],1);
counter =1;
while hasFrame(v)
    frame = readFrame(v);
    if mod(counter,5)==0
        frame = imfilter(frame, filter, 'symmetric');
    end
    writeVideo(v_resault,frame)
    counter=counter+1;
end
close(v_resault);

%Q2_1_3
v = VideoReader('inputs/Video-1.avi');
v_resault = VideoWriter('outputs/Q2/Video-2_1_3');
v_resault.FrameRate = v.FrameRate;
open(v_resault);
while hasFrame(v)
    frame = readFrame(v);
    frame(:,:,1) = medfilt2(frame(:,:,1));
    frame(:,:,2) = medfilt2(frame(:,:,2));
    frame(:,:,3) = medfilt2(frame(:,:,3));
    writeVideo(v_resault,frame)
end
close(v_resault);


%Q2_1_4
v = VideoReader('inputs/Video-1.avi');
num_frame = v.NumberOfFrames;
v_resault = VideoWriter('outputs/Q2/Video-2_1_4');
open(v_resault);
I = read(v,1);
writeVideo(v_resault,I)
thresh = 30;
w=0;
for i= 2:2:num_frame-1
    frame = read(v,i);
    prev_frame = read(v,i-1);
    next_frame = read(v,i+1);
    err1 = immse(frame,prev_frame);
    err2 = immse(frame,next_frame);
    
    if err1>thresh & err2>thresh
        writeVideo(v_resault,frame)
        writeVideo(v_resault,next_frame)

    elseif err1<thresh & err2>thresh
        writeVideo(v_resault,prev_frame)
        writeVideo(v_resault,next_frame)

    elseif err1>thresh & err2<thresh
        writeVideo(v_resault,next_frame)
        writeVideo(v_resault,next_frame)

    elseif err1<thresh & err2<thresh
        writeVideo(v_resault,prev_frame)
        writeVideo(v_resault,next_frame)

    end
end
writeVideo(v_resault,read(v,num_frame))
close(v_resault);

%Q2_1_5
v = VideoReader('inputs/Video-1.avi');
v_resault = VideoWriter('outputs/Q2/Video-2_1_5');
v_resault.FrameRate = v.FrameRate;
open(v_resault);
while hasFrame(v)
    frame = readFrame(v);
    writeVideo(v_resault,imresize(frame, 0.5))
end
close(v_resault);


%Q2_1_6
v1 = VideoReader('inputs/Video-1.avi');
v2 = VideoReader('inputs/Video-2.avi');
s=0;
while hasFrame(v1)
    frame1 = rgb2ycbcr(readFrame(v1));
    frame2 = rgb2ycbcr(readFrame(v2));
    s=s+psnr(frame1(:,:,1),frame2(:,:,1));
end
display(s./num_frame)


