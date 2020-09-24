
[fdown f down y]=makeAudio(5);


subplot(411)
plot(y)
title('original signal')

subplot(412)
plot(f)
title('filtered signal with n=200')

subplot(413)
plot(fdown)
title('filtered and downsampled with dsr = 5')

subplot(414)
plot(down)
title('just downsampled with dsr = 5')

makeAudio(3);
makeAudio(7);


function [down y_1 y_2 y]=makeAudio(dsr)
[y,Fs]=audioread('Q2_1/input.au');
y=y(:,1);
disp([13 'the origional sound' 13]); 
sound(y,Fs,8); 
pause(length(y)/Fs);
y_2 = downSample(y,Fs,dsr,0);
y_1 = filterLowPass(y,dsr);
down= downSample(y_1,Fs,dsr,1);
end


function x=downSample(y,Fs, dsr,f) 
% Downsample 
dis = ['the downsampled sound with dsr = ' num2str(dsr)];
if f==1
    dis = [ 'the downsampled and filtered sound with dsr = ' num2str(dsr)];
end
disp(dis); 
x = y(1:dsr:end);
dFs = Fs/dsr; 
sound(x, dFs,8);
pause(length(y)/Fs);
% save down sample as Q2_1/dsr =  dsr.wav or Q2_1/dsr = dsr, with filter.wav
output = ['Q2_1/dsr = ' num2str(dsr) '.wav'];
if f==1
    output = ['Q2_1/dsr = ' num2str(dsr) ', with filter.wav'];
end
dFs= int16(dFs);
audiowrite(output, x, dFs);
end



function filteredSound=filterLowPass(y,dsr)
filter_coeff = fir1(200, 1/dsr); 
filteredSound = filter(filter_coeff, 1, y);
end