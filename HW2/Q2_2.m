%Q2_2_1
[y,Fs]= audioread('speech.wav','native');
y_normal = double(y)./double(32768);
f = sign(y_normal).*(log(1+255*abs(y_normal))./log(256));
f = f.*127;
audiowrite('Q2_2/sounds/Q2_2_1.wav',f,Fs)

%Q2_2_3
h=figure (1);
subplot(2,1,1)
plot(y)
subplot(2,1,2)
plot(f)
saveas(h, 'Q2_2/pictures/Q2_2_3.png','png');
h=figure (5);
hold on
plot(f/127.0)
plot(y_normal)
legend('u-law signal','original signal')
saveas(h, 'Q2_2/pictures/Q2_2_2.png','png');



%Q2_2_4
maximum =max(abs(f));
f_normal = f/maximum;
y_new = sign(f).*(1.0/255.0).*(((256).^abs(f_normal))-1);
audiowrite('Q2_2/sounds/Q2_2_4.wav',y_new,Fs)

%Q2_2_5
h=figure (2);
subplot(2,1,1)
plot(y_normal)
subplot(2,1,2)
plot(y_new)
saveas(h, 'Q2_2/pictures/Q2_2_5.png','png');

h=figure (4);
hold on
plot(y_new)
plot(y_normal)
legend('dequantized signal','original signal')
saveas(h, 'Q2_2/pictures/Q2_2_7.png','png');


%Q2_2_6
h=figure (3);
subplot(2,1,1)
e_1 = f_normal-y_normal;
plot(e_1)
subplot(2,1,2)
e_2 = y_new - y_normal;
plot(e_2)
saveas(h, 'Q2_2/pictures/Q2_2_6.png','png');


