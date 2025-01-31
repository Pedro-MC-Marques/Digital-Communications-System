function [mq, mp]=DecoderDPCM(bits, mp, vq, a1)
% Descodificador DPCM 1� ordem left-msb
% [mq, mp]=DecoderDPCM(bits, mp, vq, a1)
% 
% Input:  bits - C�digo DPCM left-msb (Uma e s� uma amostra)
%         mp - Valor predito
%         vq - Valores de quantifica��o
%         a1 - coeficiente de predi��o
% Output: mq - Amostra quantificada
%         mp - Pr�ximo valor predito

eq=DecoderPCM(bits, vq);
mq=eq+mp;
mp=a1*mq;


