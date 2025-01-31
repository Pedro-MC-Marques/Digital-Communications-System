function SNRr=SNRreal(m, mq)
% Calcula a SNR real em Decibeis entre dois sinais
% SNRr=SNRreal(m, mq)

P=mean(m.*m);
q=m-mq;
N=mean(q.*q);
SNRr=10*log10(P/N);
