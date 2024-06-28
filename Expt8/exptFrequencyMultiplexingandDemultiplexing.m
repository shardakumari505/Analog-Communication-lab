%EXPT8 : Frequency division Multiplexing and Demultiplexing

Fs = 100; % sampling freq
t = [0:2*Fs+1]'/Fs;

x1 = sin(2*pi*2*t); % signal 1 signal
figure;
subplot(4,1,1);
plot(x1);
title('signal 1');
xlabel('time');
ylabel('amplitude');

x2 = sin(2*pi*10*t); % signal 2 signal
subplot(4,1,2);
plot(x2);
title('signal 2');
xlabel('time');
ylabel('amplitude');

z1 = fft(x1); %Fourier transform of signal 1
z1=abs(z1); %Returns absolute value of fourier transform of signal 1
subplot(4,1,3);
plot(z1);
title('Spectrum of signal 1');
xlabel('freqency');
ylabel('magnitude');

z2 = fft(x2); %Fourier transform of signal 2
z2=abs(z2); %Returns absolute value of fourier transform of signal 2
subplot(4,1,4);
plot(z2);
title('Spectrum of signal 2');
xlabel('freqency')
ylabel('magnitude');

% freqency multiplexing
z=z1+z2;
figure;
plot(z);
title('frequency multiplexed signals');
figure;

% freqency demultiplexing
f1=[ones(10,1); %Returns a 10 by 1 array of ones
zeros(182,1);
ones(10,1)]; %applying filter for signal 1
dz1=z.*f1;
d1 = ifft(dz1); %Inverse transform of each column of ones matrix
subplot(2,1,1)
plot(t*100,d1);
title('Demultiplexed signal 1');
xlabel('time');
ylabel('amplitude');

f2=[zeros(10,1); %Returns a 10 by 1 array of ones
ones(182,1);
zeros(10,1)];% applying filter for signal 2
dz2=z.*f2;
d2 = ifft(dz2); %Inverse transform of each column of ones matrix
subplot(2,1,2)
plot(t*100,d2);
title('Demultiplexed signal 2');
xlabel('time');
ylabel('amplitude');