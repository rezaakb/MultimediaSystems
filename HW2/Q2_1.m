[x32,Fs]= audioread('speech.wav');
audiowrite('Q2_1/sounds/x32.wav',x32,Fs);

%Q2_1_1
h=figure (1);
plot(x32);
ylim([-1.3 1.3]);
xlabel('Time');
ylabel('Amplitude');
saveas(h, 'Q2_1/pictures/Q2_1_1.png','png');


%Q2_1_2
h=figure (2);
Y = fft(x32)/length(x32);
plot(abs(Y));
xlabel('Frequency');
xlim([0 Fs])
ylim([ 0 0.008]);
saveas(h, 'Q2_1/pictures/Q2_1_2.png','png');


%Q2_1_3
h=figure (3);
x8=x32(1:4:length(x32));
audiowrite('Q2_1/sounds/x8.wav',x8,Fs/4)

plot(x8);
ylim([-1.3 1.3])
xlabel('Time');
ylabel('Amplitude');
saveas(h, 'Q2_1/pictures/Q2_1_3_1.png','png');

h=figure (4);
Y = fft(x8)/length(x8);
size(Y)
plot(abs(Y));
xlabel('Frequency');
xlim([0 Fs])
ylim([ 0 0.008]);
saveas(h, 'Q2_1/pictures/Q2_1_3_2.png','png');


%Q2_1_4
f = fir1(64,1/4);

%Q2_1_5
x32f = filter(f , 1 , x32);
audiowrite('Q2_1/sounds/x32f.wav',x32f,Fs)
h=figure (12);
hold on
plot(x32)
plot(x32f)
legend('original signal','filtered signal')
saveas(h, 'Q2_1/pictures/Q2_1_5.png','png');

%Q2_1_6
x8f=x32f(1:4:length(x32f));
audiowrite('Q2_1/sounds/x8f.wav',x8f,Fs/4)
h=figure (5);
plot(x8f);
ylim([-1.3 1.3])
xlabel('Time');
ylabel('Amplitude');
saveas(h, 'Q2_1/pictures/Q2_1_6_1.png','png');

h=figure (6);
Y = fft(x8f)/length(x8f);
size(Y)
plot(abs(Y));
xlabel('Frequency');
xlim([0 Fs])
ylim([ 0 0.008]);
saveas(h, 'Q2_1/pictures/Q2_1_6_2.png','png');



%Q2_1_7
%2 file ba onvan haye x8.wav va x8f.wav zakhire shode ast.

%Q2_1_8
x8f32(4*(1:length(x8f)))=x8f(1:length(x8f));
audiowrite('Q2_1/sounds/x8f32.wav',x8f32,32000)
h=figure (20);
plot(x8f32);
ylim([-1.3 1.3]);
xlabel('Time');
ylabel('Amplitude');
saveas(h, 'Q2_1/pictures/Q2_1_8.png','png');

h=figure (21);
hold on
plot(x8f32);
plot(x32);
legend('original signal','upsampling from downsampling orginal signal')
ylim([-1.3 1.3]);
xlabel('Time');
ylabel('Amplitude');
saveas(h, 'Q2_1/pictures/Q2_1_8_1.png','png');

%Q2_1_9
x8f32f = filter(f , 1 , x8f32);
h=figure (7);
plot(x8f32f);
ylim([-1.3 1.3])
xlabel('Time');
ylabel('Amplitude');
saveas(h, 'Q2_1/pictures/Q2_1_9_1.png','png');
h=figure (8);
Y = fft(x8f32f)/length(x8f32f);
plot(abs(Y));
xlabel('Frequency');
xlim([0 Fs])
ylim([ 0 0.008]);
saveas(h, 'Q2_1/pictures/Q2_1_9_2.png','png');
audiowrite('Q2_1/sounds/x8f32f.wav',x8f32f , 32000)

%Q2_1_10
Acic =[-1,1];
Bcic =[1 0 0 0 0 0 0 0 -1]/8;
freqz(Bcic,Acic,32000)

%Q2_1_11
x8f32cic = filter(Bcic,Acic,x8f32);
x8f32cic = x8f32cic *4;
audiowrite('Q2_1/sounds/x8f32cic.wav',x8f32cic , 32000)
h=figure (9);
plot(x8f32cic);
ylim([-1.3 1.3])
xlabel('Time');
ylabel('Amplitude');
saveas(h, 'Q2_1/pictures/Q2_1_11_1.png','png');
h=figure (10);
Y = fft(x8f32cic)/length(x8f32cic);
plot(abs(Y));
xlabel('Frequency');
xlim([0 Fs])
ylim([ 0 0.008]);
saveas(h, 'Q2_1/pictures/Q2_1_11_2.png','png');




