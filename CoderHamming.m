function bitsp=CoderHamming(bits)
% Codificador de código Hamming H(7,4)
% bitsp=CoderHamming(bits)
%
% Input:  bits - bits de informacao [m7 m6 m5 m3] 
% Output: bitsp - palavras de código[m7 m6 m5 p4 m3 p2 p1]
% 
% Exemplo 1 - bits=[1 0 0 1] bitsp=[1 0 0 1 1 0 0]
% Exemplo 2 - bits=[0 0 0 0] bitsp=[0 0 0 0 0 0 0]

p1=mod(bits(1)+bits(3)+bits(4), 2);
p2=mod(bits(1)+bits(2)+bits(4), 2);
p4=mod(bits(1)+bits(2)+bits(3), 2);
bitsp=[bits(1:3) p4 bits(4) p2 p1];