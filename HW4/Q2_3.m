v = VideoReader('inputs/Cut.mpeg');
res = cutDetection(v);
disp('index cut in Cut.mpeg:');
disp(res);

v = VideoReader('inputs/Dissolve.mpg');
res = dissolveDetection(v);
disp('index dissolve in Dissolve.mpeg:');
disp(res);

v = VideoReader('inputs/Wipe.mpg');
res =wipeDetection(v);
disp('index wipe in Wipe.mpg:');
disp(res);


v = VideoReader('inputs/cbswipe.mpg');
res = cutDetection(v);
disp('index cut in cbswipe.mpg:');
disp(res);

res = dissolveDetection(v);
disp('index dissolve in cbswipe.mpeg:');
disp(res);

res =wipeDetection(v);
disp('index wipe in cbswipe.mpg:');
disp(res);

function res=cutDetection(v)
num_frame = v.NumberOfFrames;
filter = fspecial('gaussian',[10 10],2);
thresh1=2600;
res = [];
for i=1:10:num_frame-10
    f1_image = imfilter(read(v,i), filter, 'symmetric');            
    f2_image = imfilter(read(v,i+10), filter, 'symmetric'); 

    tmp =immse(f2_image,f1_image);
    if tmp>thresh1
        counter = 0;
        for j=i+1:i+9

            f1_image = imfilter(read(v,j), filter, 'symmetric');   
            f2_image = imfilter(read(v,j+1), filter, 'symmetric'); 
            tmp =immse(f2_image,f1_image);
            if tmp>thresh1
                counter = counter +1;
                f=j;
            end
        end
        if counter ==1
            res= [res,[f]];
        end
           
    end
end
end

function res=dissolveDetection(v)
num_frame = v.NumberOfFrames;
thresh1=2500;
thresh2=300;
filter = fspecial('gaussian',[10 10],2);
res = [];
for i=1:20:num_frame-20
    f1_image = imfilter(read(v,i), filter, 'symmetric');            
    f2_image = imfilter(read(v,i+10), filter, 'symmetric'); 
    tmp =immse(f2_image,f1_image);
    if tmp>thresh1
        frame2 = imfilter(read(v,i+20), filter, 'symmetric');            
        for j=i+19:-1:i
            frame1 = imfilter(read(v,j), filter, 'symmetric');
            tmp = immse(frame1,frame2);
            if tmp<thresh2
                f2=j;
            else
                break
            end
        end
        frame2 = imfilter(read(v,i), filter, 'symmetric');            
        for j=i+1:1:i+19
            frame1 = imfilter(read(v,j), filter, 'symmetric');
            tmp = immse(frame1,frame2);
            if tmp<thresh2
                f1=j;
            else
                break
            end
        end
        d= f2-f1+1;
        f3=0;
        f1_image = imfilter(read(v,f1), filter, 'symmetric');            
        f2_image = imfilter(read(v,f2), filter, 'symmetric');            
        for j=f1:f2
            frame = imfilter(read(v,j), filter, 'symmetric');                               
            tmp =immse(frame,(((j-f1)/d)*f2_image+((f2-j)./d)*f1_image));
            if tmp<thresh1
               f3=f3+1;
            end
        end
        if f3==d
            res=[res,[f1,f2]];
        end
    end
end
end

function res=wipeDetection(v)
num_frame = v.NumberOfFrames;
thresh1=3000;
thresh2=300;
thresh3=1000;
filter = fspecial('gaussian',[10 10],2);
res = [];
ar = 20;
for i=1:ar:num_frame-ar
    f1_image = imfilter(read(v,i), filter, 'symmetric');            
    f2_image = imfilter(read(v,i+ar), filter, 'symmetric'); 
    tmp =immse(f2_image,f1_image);
    if tmp>thresh1
        frame2 = imfilter(read(v,i+ar), filter, 'symmetric');            
        f2=i;
        f1=i;
        for j=i+ar-1:-1:i
            frame1 = imfilter(read(v,j), filter, 'symmetric');
            tmp = immse(frame1,frame2);
            if tmp>thresh1
                frame2=frame1;
                continue
            end
            if tmp<thresh2
                f2=j;
            else
                break
            end
        end
        frame2 = imfilter(read(v,i), filter, 'symmetric');            
        for j=i+1:1:i+ar
            frame1 = imfilter(read(v,j), filter, 'symmetric');
            tmp = immse(frame1,frame2);
            if tmp>thresh1
                frame2=frame1;
                continue
            end
            if tmp<thresh2
                f1=j;
            else
                break
            end
        end
        d= f2-f1;
        f3=0;
        f1_image = imfilter(read(v,f1), filter, 'symmetric');            
        f2_image = imfilter(read(v,f2), filter, 'symmetric');   
        for j=f1+1:f2-1
            frame = imfilter(read(v,j), filter, 'symmetric');                               
            tmp =immse(frame,(((j-f1)/d)*f2_image+((f2-j)./d)*f1_image));       
            if tmp<thresh3
               f3=f3+1;
            end
        end
        if f3<(0.3)*d & d>2
            res=[res,[f1,f2]];
            h=figure;
            subplot(1,2,1);
            imshow(read(v,f1));
            subplot(1,2,2);
            imshow(read(v,f2));
        end
    end
end
end

        