 %Q2_3_3
inputFile='speech.wav';
[y,Fs]= audioread(inputFile);
n=4;
[differ,err]=mydpcm(inputFile,n);
y_new = myidpcm(y(1), differ);
audiowrite('Q2_3/sounds/Q2_3_3_n=4.wav',y_new,Fs)
err_new = y_new-double(y);
h=figure (1);
hold on
plot(err_new)
plot(err)
legend('err between 2 signal','err')
saveas(h, 'Q2_3/pictures/Q2_3_3.png','png');


n=8;
[differ,err]=mydpcm(inputFile,n);
y_new_8 = myidpcm(y(1), differ);
audiowrite('Q2_3/sounds/Q2_3_3_n=8.wav',y_new_8,Fs)



n=2;
[differ,err]=mydpcm(inputFile,n);
y_new_2 = myidpcm(y(1), differ);
audiowrite('Q2_3/sounds/Q2_3_3_n=2.wav',y_new_2,Fs)


h=figure (2);
hold on
plot(y)
plot(y_new_2)
plot(y_new)
plot(y_new_8)
legend('orginal signal','n=2','n=4','n=8')


function[differ,err]=mydpcm(inputFile,n)
[y,~]= audioread(inputFile);
tmp = diff(y);
differ = quantization(tmp,2^(n-1),2^(n-1)-1,2^n);
err = tmp-differ;
end

function y=myidpcm(x_1,differ)
n=length(differ)+1;
y = zeros(n,1);
y(1)=x_1;
for i=2:n
    y(i)=y(i-1)+differ(i-1);
end
end

function q=quantization(y,a,b,n)
delta = (b-a)/n;
q=floor(y/delta+0.5)*delta;
end

