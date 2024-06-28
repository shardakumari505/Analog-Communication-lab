%EXPT 5 : Pulse Amplitude Modulation

fc= 100; %carrier frequency
fm= fc/10; %message signal frequency
fs= 100*fc; %sampling frequency
t=0:1/fs:4/fm; %Time range used in plotting signals

%Message Signal
Sm = cos(2*pi*fm*t);
subplot(4,1,1);
plot(t,Sm);
title('Message Signal');
xlabel('Time Period');
ylabel('Amplitude');

%Carrier Signal
Sc= 0.5*square(2*pi*fc*t)+0.5;
subplot(4,1,2);
plot(t,Sc);
title('Carrier Signal')
xlabel('Time Period');
ylabel('Amplitude');
ylim([-1 1]);

%Pulse Amplitude Modulation Signal
PAM = Sm.*Sc;
subplot(4,1,3);
plot(t,PAM);
title('PAM Modulated signal')
xlabel('Time Period');
ylabel('Amplitude');

%Demodulation
de = Sm.*Sc;
filter = fir1(200,fm/fs,'low');
DPAM = conv(filter,de);
t1 = 0:1/(length(DPAM)-1):1;
subplot(4,1,4);
plot(t1,DPAM);
title('PAM Demodulated signal')
xlabel('Time Period');
ylabel('Amplitude');