function bits=CoderPCM(m, vd)
% Codificador PCM left-msb
% bits=CoderPCM(m, vd)
% 
% Input:  m - Amostras do sinal de entrada
%         vd - Valores de decisão
% Output: bits - Código PCM
% 
% Exemplo: m=[1 0.504 -0.491]
% vd = [-0.7500 -0.5000 -0.2500 0 0.2500 0.5000 0.7500]
% bits = [1 1 1]
%        [1 1 0]
%        [0 1 0]

R=log2(length(vd)+1);
ind=quantiz(m, vd);
bits=de2bi(ind, R, 'left-msb');
