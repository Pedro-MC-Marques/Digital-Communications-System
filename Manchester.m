function CLt=Manchester(bits, A, Tb)
% Gera um codigo Manchester funcao dos bits de entrada
% CLt=Manchester(bits, A, Tb)
% Inputs: bits - bits de entrada
%                A - Amplitude do codigo
%                Tb - Numero de pontos (par) por simbolo
% Output: CLt - Codigo Manchester

s1=A*[-ones(1, Tb/2) ones(1, Tb/2)];
CLt=[];
for i=1:length(bits)
    if bits(i)
        CLt=[CLt s1];
    else
        CLt=[CLt -s1];
    end
end
end
