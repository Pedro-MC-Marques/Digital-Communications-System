function [bits, mp]=CoderDPCM(m, mp, vd, vq, a1)
% Codificador DPCM 1� ordem left-msb
% [bits, mp]=CoderDPCM(m, mp, vd, vq, a1)
% 
% Input:  m - Uma (e s� uma) amostra do sinal de entrada
%         mp - Valor predito
%         vd - Valores de decis�o
%         vq - Valores de quantifica��o
%         a1 - coeficiente de predi��o
% Output: bits - C�digo DPCM left-msb
%         mp - Pr�ximo valor predito

R=log2(length(vd)+1);
e=m-mp;
bits=CoderPCM(e, vd);
eq=DecoderPCM(bits, vq);
mq=eq+mp;
mp=a1*mq;


