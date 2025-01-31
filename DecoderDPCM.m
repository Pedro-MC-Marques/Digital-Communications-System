function [mq, mp]=DecoderDPCM(bits, mp, vq, a1)
% Descodificador DPCM 1ª ordem left-msb
% [mq, mp]=DecoderDPCM(bits, mp, vq, a1)
% 
% Input:  bits - Código DPCM left-msb (Uma e só uma amostra)
%         mp - Valor predito
%         vq - Valores de quantificação
%         a1 - coeficiente de predição
% Output: mq - Amostra quantificada
%         mp - Próximo valor predito

eq=DecoderPCM(bits, vq);
mq=eq+mp;
mp=a1*mq;


