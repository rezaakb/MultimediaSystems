playsong(100)
playsong(500)
playsong(1000)
playsong(5000)
playsong(11500)
playsong(13500)


function playsong(frequency)
Fplay= 12500;
frequency
f=setFs(frequency);
audio = audioplayer( f, Fplay );
filename= ['Q1_4/Fs=' num2str(frequency) '.wav'];
audiowrite(filename,f,Fplay);

play(audio);
disp('After audio is played please press any key to continue...');
pause;
end

function f=setFs(Fs)
Fc = 25;
theta = pi/6;
Ts = 1/Fs; 
t = 0:Ts:3;
h1= figure;
f = cos(2*pi*Fc*t + theta);
plot(t,f)
title(['Fs=' num2str(Fs)])
print(h1,'-dpng',['Q1_4/Fs=' num2str(Fs) '.png'])
end
