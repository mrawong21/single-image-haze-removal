function T = mytransmission(im,A)
w=0.95;
im2=zeros(size(im));
for cindex=1:3
    im2(:,:,cindex)=im(:,:,cindex)./A(cindex);
end
T=1-w*mydarkchannel(im2);
