function [vd, vq]=tabelas(V, R, flag)
% Cria tabelas de decisao e quantificacao
% [vd, vq]=tabelas(V, R, flag)
%
% Input:  V - Valor maximo de quantificacao
%         R - numero de bits de codificacao
%         flag - tipo de quantificador:
%                mt - midtread PCM
%                mr - midrise PCM
%                dpcm_mr - midrise DPCM
%                dpcm_mt - midtread DPCM
% Output: vd - tabela de decisão
%         vq - tabela de quantificacao
% 
% Exemplo 1 - V=1 R=2; flag=mt; vd=[-0.25 0.25 0.75]; vq=[-0.5 0.0 0.5 1.0]
% Exemplo 2 - V=1 R=2; flag=mr; vd=[-0.5 0.0 0.5]; vq=[-0.75 -0.25 0.25 0.75]
% Exemplo 3 - V=1 R=2; flag=dpcm_mt; vd=[-0.5 0.25 0.75]; vq=[-1.0 0.0 0.5 1.0]
% Exemplo 4 - V=1 R=2; flag=dpcm_mr; vd=[-0.6667 0.0 0.6667]; vq=[-1.0   -0.3333 0.3333 1.0]

deltaq=2*V/2^R;

switch flag
    case 'mt'
        vd=[-V+1.5*deltaq:deltaq:V-deltaq/2];
        vq=[-V+deltaq:deltaq:V];
    case 'mr'
        vd=[-V+deltaq:deltaq:V-deltaq];
        vq=[-V+deltaq/2:deltaq:V-deltaq/2];
    case 'dpcm_mt'
        deltaq=2*V/(2^R-2);
        vq=[-V:deltaq:0];
        vd=[-V+deltaq/2:deltaq:-deltaq/2];
        deltaq=2*V/(2^R);
        vq=[vq deltaq:deltaq:V];
        vd=[vd deltaq/2:deltaq:V-deltaq/2];
    case 'dpcm_mr'
        deltaq=2*V/(2^R-1);
        vd=[-V+deltaq/2:deltaq:V-deltaq/2];
        vq=[-V:deltaq:V];
    otherwise
        disp('flag nao conhecida!');
end
