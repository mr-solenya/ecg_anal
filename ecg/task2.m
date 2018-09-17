clc;
clear all;
close all;
load('124m.mat')% extracting data from the respective ECG data file
x2=val(1,:);
x2=(x2-1024)/200;
subplot(2,2,1);
title('ECG Signal');
plot(x2); % Plotting original ECG Signal
title('ECG Signal');
sampling_frequency=360;
mains_coeff=0.1;
time_step=1/sampling_frequency;
max_time=10;
t=time_step:time_step:max_time;
mains_signal=cos(2*pi*60*t);
dirty_signal=x2+mains_coeff*mains_signal; %High frquency Noise ECG Signal 
subplot(2,2,2);
plot(dirty_signal);% Plotting High frquency Noise ECG Signal
title('Dirty Signal');
mains_signal_1=cos(2*pi*0.1*t);
dirty_signal_1=x2+mains_coeff*mains_signal_1;%Low frquency ECG Noise Signal 
subplot(2,2,3);
plot(dirty_signal_1);
title('Dirty Signal_1');% Plotting Low frquency Noise ECG Signal
signal_freq=dirty_signal+dirty_signal_1;%Adding both high and low frequency 
subplot(2,2,4);
plot(signal_freq);%Plotting the Noisy ECG signal
title('Signal with Noise');

j=1;
for i=2:length(x2)-1
    if(x2(i)>x2(i-1) & x2(i)>x2(i+1) & x2(i)>0.5)
        k(j)=i;
        k1(j)=x2(i);
        j=j+1;
    end
end
j=j-1;
sprintf('Heart rate is')
length(k)*6 % Calculating the heart rate from the signal
figure(2);
plot(x2)
hold on
sprintf('R peak distance in seconds')
plot(k,k1,'ro'); %plotting the peaks in the signal
title('Peaks of the signal');
kdis=diff(k)% Calculating R-R peak distance
sprintf('Average R-R interval')
pk=sum(kdis)/(length(k)-1) % Average peak to peak distance

% Checking whether heart rate is normal or abnormal
if (length(k)*6>150)
    sprintf('Abnormal Heart Rate(Tachycardia)')
elseif (length(k)*6<60)
    sprintf('Abnormal Heart Rate(Bradycardia)')
else 
    sprintf('Normal Heart Rate')
end


% Report:

%Motive of this task is to analyse a given ECG signal and to determine 
%whether the given ECG signal is of a healthy person. Signal processing tool 
%is used to design a filter that can denoise any ECG signal and help in 
%analysing the ECG signal. Filter is designed for 360 samples at a time. 
%The original is taken and multiplied with a signal having high frequency 
%and same is done with signal having low frequency. This produces two noisy 
%ECG signals, after this they are added and a net noisy ECG signal is 
%produced. This signal is passed through the filter designed using signal 
%processing tool box and hence, we get back the original denoised ECG 
%signal. The data is exported to the workspace and then plotted so as to 
%realise the working of the filter. Then, heart rate of the given ECG is 
%calculated and checked whether it is normal or abnormal. Peak to peak, 
%i.e., individually  R-R distance is calculated  and after this average 
%distance is calculated.
