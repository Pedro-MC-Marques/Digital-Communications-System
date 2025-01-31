clc
close all
clear all

pkg load communications

#############################
##### VARIAVEIS INICIAS #####
#############################

### SINAL DE REFERENCIA ###
mmax = 1;
fm = 920;
fase = -(pi/2);
fs = 8000;
T = 4;

### VARIAVEIS TABELAS ###
V = mmax;
R =4;
flag = 'dpcm_mt';

#### VARIAVEIS CANAL ###
A = 1;
Tb = 4;

AtdB = 0;
PrdB = 0;

### VARIAVEIS C. ERROS ###
#controlo = input("Contrlo de Erros? (Y/N):", "s");
controlo = 'Y';

############################
##### CALCULOS INICIAS #####
############################

### GERADOR DE SINAL ####
#m = oscilador(mmax, fm, fase, fs, T);  % criacao de um sinal
[m, fs] = audioread ('joa_nor.wav');   % import de um ficheiro audio

### C.A. DPCM ###
P = mean(m.*m);
r1=mean(m(2:end).*m(1:end-1))/P;
#a1 = 0;
#a1 = 1;
a1 = r1;

gain = (1/(1+a1^2-2*a1*r1));
gain_db = 10 * log10(gain);
V1 = V/sqrt(gain);


### TABELAS ###
[vd,vq] = tabelas (V1, R, flag);

### C.A. CODIGO CANAL ###
C =  sqrt(1/Tb);

Pr = 10^(PrdB/10);
Att = 10^(AtdB/20);
Ar =  A/Att;
N0 = 2* Pr;
Eb = Ar*Ar*Tb;

X = Eb/N0

y1 = Ar*C*Tb;
y0 = - y1;

lambda =  ((y1+y0)/2);
Aeq = C*C*Tb;
Prn = Aeq * Pr;
c = Manchester([1],C,Tb);

### C.A. CONTROLO ERROS ###
Rc = 4/7; %Razao de codigo para Hamming(7,4)


#############################
######## CODIFICADOR ########
#############################

mpT=0;
mpR = 0;
mq = zeros(size(m));
erros = 0;
erros_linha = 0;
rep = 0;
for n = 1:length(m)
  [bit_t, mpT] = CoderDPCM(m(n), mpT, vd, vq, a1);

  if (controlo == 'Y')
    bit_tc = CoderHamming(bit_t);
  else
    bit_tc = bit_t;
  end

  CLt = Manchester(bit_tc, A, Tb);
  CLr = CanalAWGN(CLt, AtdB, PrdB);
  bit_rc = RO(CLr, c, lambda);

  if (controlo == 'Y')
    bit_r = DecoderHamming(bit_rc);
    erros = erros + sum(xor(bit_tc, bit_rc));
  else
    bit_r = bit_rc;
  end

  [mq(n), mpR] = DecoderDPCM(bit_r, mpR, vq, a1);
  erros_linha = erros_linha + sum(xor(bit_t, bit_r));
end



####################################
#### APRESENTACAO DE RESULTADOS ####
####################################

### SNR CODIFICADOR ###
SNRr = SNRreal(m, mq)
P = mean(m.*m);
SNRt = 6.02 * R + 10 * log10(3 * P/V^2) + gain_db

### SNR CANAL ###
#SNRtc = 6.02 + 10 * log10 (3*P / V1 / V1)



if (controlo == 'Y')
  BERt = 0.5*erfc(sqrt(Eb/N0))
  BERr = erros / (length(m) * R * 1/Rc)

  BERt_linha = 9*BERt^2*((1-BERt)^5)
  BERr_linha = erros_linha / (length(m) * R)
else
  BERt = 0.5*erfc(sqrt(Eb/N0))
  BERr = erros_linha / (length(m) * R)
end
#####



















