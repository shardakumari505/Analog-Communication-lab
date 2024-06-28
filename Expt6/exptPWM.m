%EXPT 6 : Pulse Width Modulation

fc=1000; %carrier frequency
fs=10000; %sampling frequency
f1=200;
t=0:1/fs:((5/f1)-(1/fs)); %Time range used in plotting signals

%Message Signal
Sm =0.4*cos(2*pi*f1*t)+0.5;
subplot(3,1,1);
plot(t,Sm);
title('Message signal');
xlabel('Time Period');
ylabel('Amplitude');

%modulation
PWM = modulate(Sm,fc,fs,'pwm');
subplot(3,1,2);
plot(PWM);
axis([0 300 -0.2 1.2]);
title('Pulse Width Modulation');
xlabel('Time Period');
ylabel('Amplitude');

%demodulation
DPWM = demod(PWM,fc,fs,'pwm');
subplot(3,1,3);
plot(t,DPWM);
title('Demodulated Signal');
xlabel('Time Period');
ylabel('Amplitude');