function m=oscilador(mmax, fm, fase, fs, T)
% Oscilador sinusoidal 
% m=oscilador(mmax, fm, fase, fs, T)
% 
% Input:  mmax - Amplitude
%         fm - Frequ�ncia
%         fase - Fase: 0 - cos ; -pi/2 - sin
%         fs - Frequ�ncia de amostragem
%         T - Dura��o do sinal
% Output: m - Sinal sinusoidal de sa�da

t=0:1/fs:T-1/fs;
m=mmax*cos(2*pi()*fm*t+fase);
