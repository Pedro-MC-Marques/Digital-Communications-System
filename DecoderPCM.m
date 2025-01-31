function mq=DecoderPCM(bits, vq)
% Descodificador PCM left-msb
% mq=DecoderPCM(bits, vq)
% 
% Input:  bits - Código PCM left-msb
%         vq - Valores de quantificação
% Output: mq - Amostras quantificadas
%
% Exemplo - bits = [1 1 1]
%                  [1 1 0]
%                  [0 1 0]
% vq = [-0.8750 -0.6250 -0.3750 -0.1250 0.1250 0.3750 0.6250 0.8750]
% mq = [0.8750 0.6250 -0.3750] 

ind=bi2de(bits, 'left-msb');
mq=vq(ind+1);
