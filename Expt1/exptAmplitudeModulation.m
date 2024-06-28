%EXPT 1 : AMPLITUDE MODULATION

fc = 1000; %carrier frequency
fm = 20; %message signal frequency
fs = 8000; %sampling frequency
Am = 5; %Amplitude of message signal
Ac = 10; %Amplitude of carrier signal
T = 1/fs; %Time period
t = [0:T:0.1]; %Time range used in plotting signals
m = Am/Ac; %modulation index given as the ratio of message signal amplitude with carrier signal amplitude

%Carrier Signal
Sc = Ac*cos(2*pi*fc*t);
subplot(4,1,1); %Representation of plot at 1st row , 1st column out of 4 rows
plot(t,Sc); %Representing Carrier signal (Sc) wrt time at 1st row , 1st column
title('Carrier Signal')

%Message Signal
Sm = Am*cos(2*pi*fm*t);
subplot(4,1,2); %Representation of plot at 2nd row , 1st column out of 4 rows
plot(t,Sm); %Representing message signal (Sm) wrt time at 2nd row , 1st column
title('Message Signal')

%amplitude modulation
%AM = ammod(Sm,fc,fs);   
AM = Ac*(1+(m*cos(2*pi*fm*t).*cos(2*pi*fc*t)));
%AM = Ac*cos(2*pi*fc*t)+(Ac*m*Sm.*cos(2*pi*fc*t));
subplot(4,1,3); %Representation of plot at 3rd row , 1st column out of 4 rows
plot(t,AM); %Representing Amplitude Modulation signal (AM) wrt time at 3rd row , 1st column
title('Amplitude Modulation Signal')

%amplitude demodulation
DAM = (1+Sm).*cos(2*pi*fc*t).*cos(2*pi*fc*t);
subplot(4,1,4); %Representation of plot at 4th row , 1st column out of 4 rows
plot(t,DAM); %Representing Amplitude Demodulation signal (DAM) wrt time at 4th row , 1st column
title('Demodulated Signal')
