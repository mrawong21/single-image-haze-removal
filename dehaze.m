function D=dehaze(im)
Jdark=mydarkchannel(im);
A=myatmlight(im,Jdark);
t=mytransmission(im,A);
D=recover(im,A,t);
