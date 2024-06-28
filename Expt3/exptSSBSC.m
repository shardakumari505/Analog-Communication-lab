%EXPT 3 : SSBSC Signal

fc = 50; %carrier frequency
fm = 20; %message signal frequency
fs = 8000; %sampling frequency
Am = 1; %Amplitude of message signal
Ac = 1; %Amplitude of carrier signal
T = 1/fs; %Time period
t = [0:T/999:0.5]; %Time range used in plotting signals
m = Am/Ac; %modulation index given as the ratio of message signal amplitude with carrier signal amplitude

%Message Signal
Sm = Am*cos(2*pi*fm*t);
subplot(6,1,1)
plot(t, Sm, 'r');
grid();
title('Message signal');

%Carrier Signal
Sc = Ac*cos(2*pi*fc*t);
subplot(6,1,2)
plot(t, Sc, 'g');
grid();
title('Carrier signal');

%SSBSC Signal with upper sideband
ssb_us = ((Am*Ac).*cos(2*pi*(fc+fm).*t));
subplot(6,1,3)
plot(t, ssb_us, 'k');
grid();
title('SSBSC Signal with upper sideband');

%SSBSC Signal with lower sideband
ssb_ls = ((Am*Ac).*cos(2*pi*(fc-fm).*t));
subplot(6,1,4)
plot(t, ssb_ls, 'm');
grid();
title('SSBSC Signal with lower sideband');

%SSBSC demodulating Signal
ssb_dm = (Am*Ac*Ac).*(cos(2*pi*fm*t)); %Demodulating signal for both (upper sideband as well as lower sideband) is same
subplot(6,1,5)
plot(t, ssb_dm, 'b');
grid();
title('SSBSC demodulating Signal');

%Comparison of original and demodulated signal
subplot(6,1,6)
plot(t,Sm,'r',t,ssb_dm,'b--');
grid();
title('Comparison of message signal and demodulated signal');