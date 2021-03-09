% This filter is a butterworth low pass filter.

'pkg load signal'; % Load function Butter

fc = 200; % Cut-off frequency (Hz)
fs = 1000; % Sampling rate (Hz)
order = 5; % Filter order
[B,A] = butter(order,2*fc/fs); % [0:pi] maps to [0:1] here
[sos,g] = tf2sos(B,A);

% Compute and display the amplitude response
Bs = sos(:,1:3); % Section numerator polynomials
As = sos(:,4:6); % Section denominator polynomials
[nsec,temp] = size(sos);
nsamps = 256; % Number of impulse-response samples
% Note use of input scale-factor g here:
x = g*[1,zeros(1,nsamps-1)]; % SCALED impulse signal
for i=1:nsec
  x = filter(Bs(i,:),As(i,:),x); % Series sections
end
%
%plot(x); % Plot impulse response to make sure
          % it has decayed to zero (numerically)
%
% Plot amplitude response
% (in Octave - Matlab slightly different):
figure(2);
X=fft(x); % sampled frequency response
f = [0:nsamps-1]*fs/nsamps; grid('on');
axis([0 fs/2 -100 5]);
plot(f(1:nsamps/2),20*log10(X(1:nsamps/2)));