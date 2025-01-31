function bits=DecoderHamming(bitsp)
% Descodificador de codigo Hamming H(7,4)
% bits=DecoderHamming(bitsp)
%
% Input:  bitsp - bits para deteção de erros [m7 m6 m5 p4 m3 p2 p1] 
% Output: Output: bitsp - bits corrigidos[m7 m6 m5 m3]
% 
% Exemplo 1 - bitsp=[1 0 0 1 1 0 0] bits=[1 0 0 1]
% Exemplo 2 - bitsp=[1 0 0 0 0 0 0] bits=[0 0 0 0]

p1=mod(bitsp(1)+bitsp(3)+bitsp(5), 2);
p2=mod(bitsp(1)+bitsp(2)+bitsp(5), 2);
p4=mod(bitsp(1)+bitsp(2)+bitsp(3), 2);
sindromeb=[xor(p1, bitsp(7)) xor(p2, bitsp(6)) xor(p4, bitsp(4))];
sindrome=bi2de(sindromeb);
if(sindrome)
    bitsp(8-sindrome)=~bitsp(8-sindrome);
end
bits=[bitsp(1:3) bitsp(5)];

