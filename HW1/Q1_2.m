Fc = 25;
theta = pi/6;

Fs = 330;                                    
Ts = 1/Fs; 
t = 0:Ts:3;
F = cos(2*pi*Fc*t + theta);


NFFT = 2^nextpow2(Fs*3);
Y = fft(F , NFFT)/(Fs*3);
f = Fs/2*linspace(0,1,NFFT/2+1);

subplot(311)
plot(f, 2*abs(Y(1:NFFT/2+1)));
title('Fs=330')
grid


Fc = 25;
theta = pi/6;

Fs = 500;                                    
Ts = 1/Fs; 
t = 0:Ts:3;
F = cos(2*pi*Fc*t + theta);


NFFT = 2^nextpow2(Fs*3);
Y = fft(F , NFFT)/(Fs*3);
f = Fs/2*linspace(0,1,NFFT/2+1);

subplot(312)
plot(f, 2*abs(Y(1:NFFT/2+1)));
title('Fs=500')
grid


Fc = 25;
theta = pi/6;

Fs = 78.5;                                    
Ts = 1/Fs; 
t = 0:Ts:3;
F = cos(2*pi*Fc*t + theta);


NFFT = 2^nextpow2(Fs*3);
Y = fft(F , NFFT)/(Fs*3);
f = Fs/2*linspace(0,1,NFFT/2+1);

subplot(313)
plot(f, 2*abs(Y(1:NFFT/2+1)));
title('Fs=78.5')
grid