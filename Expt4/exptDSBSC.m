%EXPT 4 : DSBSC Signal

fc =50000; %carrier frequency
fm = 2000; %message signal frequency
fs = 800000; %sampling frequency
Am = 1; %Amplitude of message signal
Ac = 1; %Amplitude of carrier signal
T = 1/fs; %Time period
t = [0:T/999:0.001]; %Time range used in plotting signals
m = Am/Ac; %modulation index given as the ratio of message signal amplitude with carrier signal amplitude

%Message Signal
Sm = Am*cos(2*pi*fm*t);
subplot(5,1,1)
plot(t, Sm, 'r');
grid();
title('Message signal');

%Carrier Signal
Sc = Ac*cos(2*pi*fc*t);
subplot(5,1,2)
plot(t, Sc, 'g');
grid();
title('Carrier signal');

%DSBSC Signal
dssb = ((Am*Ac).*(cos(2*pi*fc.*t)).*(cos(2*pi*fm*t)));
subplot(5,1,3)
plot(t, dssb, 'm');
grid();
title('DSBSC Signal');

%DSBSC demodulating Signal
dssb_dm = ((Am*Ac*Ac)).*(cos(2*pi*fm*t));
subplot(5,1,4)
plot(t, dssb_dm, 'b');
grid();
title('SSBSC demodulating Signal');

%Comparison of original and demodulated signal
subplot(5,1,5)
plot(t,Sm,'r',t,dssb_dm,'b--');
grid();
title('Comparison of message signal and demodulated signal');