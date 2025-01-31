function CLr=CanalAWGN(CLt, AtdB, PrdB)
% Canal AWGN com atenuacao e ruido aditivo, branco e gaussiano 
% CLr=CanalAWGN(CLt, AtdB, PrdB)
% 
% Input:  CLt - Sinal de entrada
%         AtdB - Atenuacao em Decibeis
%         PrdB - Potencia do ruido em dBW
% Output: CLr Sinal de saida com atenuacao e ruido branco e gaussiano

Att=10^(AtdB/10);
Pr=10^(PrdB/10);
CLr=CLt/sqrt(Att)+sqrt(Pr)*randn(size(CLt));