% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Speech Communication                                                 
% %% PROGRAMMING HOMEWORK II
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Updated by Falk Schiffner  08.12.2016

%% Head
clear variables; close all; clc;
addpath src

%% Read the audio
audiofile = ('13ZZ637A.wav');
[audiodata, fs] = audioread(audiofile);

%% compute the spectrogram
timeofdata = size(audiodata,1) / fs;
samples_10ms = round(0.01 * size(audiodata,1) / timeofdata); %number of samples in 10ms
[spec,freqs,times] = spectrogram(audiodata, hann(2*samples_10ms),samples_10ms, [], fs);

%% plot the spectrogram of audiofile
figure('Name',['Spectrogram of "',audiofile '"'])
imagesc(times,freqs,20*log(abs(spec)));
set(gca,'YDir', 'normal')
xlabel('Time [s]')
ylabel('Frequency [Hz]')
colorbar
title(['Spectrogram of "',audiofile '"'])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% E1 Computation of equally spaced points on the mel-scale
% call the function melfreqs
% assuming k=24l
k=24;
edges = melfreqs(min(freqs), max(freqs), k);
%% E2 Computation of the mids of the triangular filters
% call the function computeMids
mids = computeMids(freqs,edges);
%% E3 Computation of the mel-filter bank
% call the function computeFilter
filter = computeFilter(mids,freqs);

%removing dummy values
filter([1 size(filter,1)],:)=[];

%subplot(1,24,1)
figure(2);
title('Triangular filters');
xlabel('Frequency (Hz) (Filter Banks)');
ylabel('Weight');
hold on;
%Ploting all the filters except first and last one as they contain dummy
%values
% x axis values
x= linspace(0, max(freqs), size(filter{1},2));

for i = 1: size(filter,1)
    plot(x, filter{i});
end
hold off;
%% E4 Computation of the mel-filtered spectrum
% call the function melFilter
melSpec = melFilter(spec, filter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot of the mel-filtered spectrum
figure('Name',['mel-filtered Spectrogram of "',audiofile '"'])
imagesc(times, freqs, melSpec);
set(gca,'YDir', 'normal')
xlabel('Time [s]')
ylabel('Frequency [Hz]')
colorbar
title(['mel-filtered Spectrogram of "',audiofile '"'])


%% E O F







