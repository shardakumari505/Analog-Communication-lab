%EXPT2 : FREQUENCY MODULATION

fc = 500; %carrier frequency
fm = 30; %message signal frequency
fs = 8000; %sampling frequency 
Am = 1;
Ac = 1;
t = [0:1/fs:0.1]'; %time range for plotting signals
x = sin(2*pi*fm*t); %Modulating signal assuming frequency as 10 since message frequency is not given
fDev = 50; %frequency deviation
%y = fmmod(x,fc,fs,fDev); %frequency modulation function
y = Ac*sin(2*pi*fc*t + sin(2*pi*fm*t));
z = fmdemod(y,fc,fs,fm); %frequency demodulation function

subplot(4,1,1); %Representation of plot at 1st row , 1st column out of 4 rows 
plot(t,x); %Representing Modulating signal (x) wrt time at 1st row , 1st column
xlabel('Time(s)');
ylabel('Amplitude');
title('Message Signal')

subplot(4,1,2); %Representation of plot at 2nd row , 1st column out of 4 rows 
plot(t,sin(2*pi*fc*t)); %Representing Carrier signal wrt time at 2nd row , 1st column
xlabel('Time(s)');
ylabel('Amplitude');
title('Carrier Signal');

subplot(4,1,3); %Representation of plot at 3rd row , 1st column out of 4 rows
plot(t,y); %Representing Frequency Modulation (y) wrt time at 3rd row , 1st column
xlabel('Time(s)');
ylabel('Amplitude');
title('Frequency Modulated Signal');

subplot(4,1,4); %Representation of plot at 4th row , 1st column out of 4 rows
plot(t,z); %Representing Frequency Demodulation (z) wrt time at 4th row , 1st column
xlabel('Time(s)');
ylabel('Amplitude');
title('Demodulated Signal');
ylim([-1 1]);