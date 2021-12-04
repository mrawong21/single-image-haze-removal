function J=recover(im,A,t)
t0= 0.1;
t_r=max(t,t0);
J = zeros(size(im));
for ind=1:3
    J(:,:,ind)=A(ind)+(im(:,:,ind)-A(ind))./t_r;
end
