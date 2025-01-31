function bitsR=RO(CLr, c, lambda)
% Recetor otimo bin�rio (Polar, Unipolar) 
% bitsR=RO(CLr, c, lambda)
% 
% Input:  CLr - Codigo bin�rio (com ru�do)
%         c - Vetor de base para o filtro adaptado
%         lambda - Valor de comparacao
% Output: bitsR - bits descodificados

N=length(CLr)/length(c);
T=length(c);
bitsR=zeros(1, N);
i=1;
for n=1:N
    y=sum(CLr(i:i+T-1).*c);
    if(y>lambda)
        bitsR(n)=1;
    end
    i=i+T;
end
end
    
    