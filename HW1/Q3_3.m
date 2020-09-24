quantization('speech.wav',256)

function quantization(filename,n)
[y,Fs]= audioread(filename);

b=max(y);
a=min(y);
delta = (b-a)/n;
q=floor(y/delta+0.5)*delta;
error = y-q;
hold on
plot(y)

plot(q)

plot(error)
title('quantizated signal with N = 256')
legend('original signal','quantizated signal','error')


end