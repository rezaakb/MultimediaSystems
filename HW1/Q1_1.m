Fc = 25;
theta = pi/6;


Fs = 330;                                    
Ts = 1/Fs; 
t = 0:Ts:3;
f = cos(2*pi*Fc*t + theta);
subplot(411)
plot(t,f);
title('Fs = 330');


Fs = 50000;                                 
Ts = 1/Fs; 
t = 0:Ts:3;
f = cos(2*pi*Fc*t + theta);
subplot(412)
plot(t,f);
title('Fs = 50000');



Fs = 78.5
Ts = 1/Fs; 
t = 0:Ts:3;
f = cos(2*pi*Fc*t + theta);
subplot(413)
plot(t,f);
title('Fs = 78.5');



Fs = 30;                                 
Ts = 1/Fs; 
t = 0:Ts:3;
f = cos(2*pi*Fc*t + theta);
subplot(414)
plot(t,f);
title('Fs = 30');

