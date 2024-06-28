%EXPT7 : PREEMPHASIS AND DEEMPHASIS

num_samples = 2^13; % no. of samples
fs=5000; % sampling frequency
Ts=1/fs; %Time range in terms of sampling frequency
fm1=20; %Message signal frequency 1
fm2=30; %Message signal frequency 2
fc=200; %carrier frequency
t=(0:num_samples-1)*Ts;
f=(-num_samples/2:num_samples/2-1)*fs/num_samples;

f_cutoff_pe=10;
Wn_pe=f_cutoff_pe/(fs/2);
[b_pe,a_pe]=butter(1,Wn_pe); %returns the transfer function coefficients of an 1st order lowpass digital Butterworth filter with normalized cutoff frequency Wn_pe

mt=sin(2*pi*fm1*t); %Modulating signal
figure(1);
subplot(211);
plot(t,mt);
axis([0 .6 min(mt)-1 max(mt)+1]);
grid on;title('Modulating Signal (Time Domain)');

Mf=fftshift(abs(fft(mt))); %rearranges a Fourier transform by shifting the zero-frequency component to the center of the array
subplot(212);
plot(f,Mf);
grid on;axis([-50 50 0 max(Mf)+100]);
title('Modulating Signal (Frequency Domain)');

[H_pe,W]=freqz(a_pe,b_pe); %Returns a_pe complex frequency response for digital filter b_pe
figure(2);
subplot(211);
semilogx(W*pi*(fs/2),abs(H_pe),'m','linewidth',2) %Plots x and y coordinates using log scale on the values mentioned
xlabel('frequency');
ylabel('Amplitude');
axis([0 fs/2 0 50]);
grid on;
title('Pre-emphasisFilter Magnitude Response');

[H_de,W]=freqz(b_pe,a_pe); %Returns a_pe complex frequency response for digital filter b_pe
subplot(212);
semilogx(W*pi*(fs/2),abs(H_de),'m','linewidth',2); %Plots x and y coordinates using log scale on the values mentioned
axis([0 fs/2 0 1]);
grid on;
xlabel('frequency');
ylabel('Amplitude');
title('De-emphasis Filter Magnitude Response');