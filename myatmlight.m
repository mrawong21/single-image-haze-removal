function A=myatmlight(image,Jdark)

[m,n,~]=size(image);imsize=m*n;
num=floor(imsize/1000);

JdarkVec = reshape(Jdark,imsize,1); % ��ͨ�������ص�����
ImVec = reshape(image,imsize,3);  % ԭ����ͼ���ص�����

[~,index]=sort(JdarkVec);
index=index(imsize-num+1:end);
lightvec=zeros(num,1);max=lightvec(1);
for i=1:num
    lightvec(i)=ImVec(index(i),1)+ImVec(index(i),2)+ImVec(index(i),3);
    if max<lightvec(i)
        max=lightvec(i);
        cindex=index(i);
    end
end
 A=ImVec(cindex,:);





