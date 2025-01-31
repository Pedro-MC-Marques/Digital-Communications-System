function m=oscilador(mmax, fm, fase, fs, T)
% Oscilador sinusoidal 
% m=oscilador(mmax, fm, fase, fs, T)
% 
% Input:  mmax - Amplitude
%         fm - Frequência
%         fase - Fase: 0 - cos ; -pi/2 - sin
%         fs - Frequência de amostragem
%         T - Duração do sinal
% Output: m - Sinal sinusoidal de saída

t=0:1/fs:T-1/fs;
m=mmax*cos(2*pi()*fm*t+fase);
