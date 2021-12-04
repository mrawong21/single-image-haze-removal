function Jdark =myDarkchannel(image)
% ∂¡»° ‰»Î≥ﬂ¥Á
[m,n,~]=size(image);
padsize=7;
patchsize=15;
Jdark = zeros(m,n);
im=padarray(image,[padsize,padsize],inf);

for i=1:m
    for j=1:n
        patch=im(i:i+patchsize-1,j:j+patchsize-1,:);
        Jdark(i,j)=min(patch(:));
    end
end







