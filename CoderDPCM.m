function [bits, mp]=CoderDPCM(m, mp, vd, vq, a1)
% Codificador DPCM 1ª ordem left-msb
% [bits, mp]=CoderDPCM(m, mp, vd, vq, a1)
% 
% Input:  m - Uma (e só uma) amostra do sinal de entrada
%         mp - Valor predito
%         vd - Valores de decisão
%         vq - Valores de quantificação
%         a1 - coeficiente de predição
% Output: bits - Código DPCM left-msb
%         mp - Próximo valor predito

R=log2(length(vd)+1);
e=m-mp;
bits=CoderPCM(e, vd);
eq=DecoderPCM(bits, vq);
mq=eq+mp;
mp=a1*mq;


