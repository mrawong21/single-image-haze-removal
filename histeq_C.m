function [J] = histeq_C(Im) 
[height,width,d]=size(Im);  %�������ͼ��ߴ�M��N��C��size������
for index_d=1:d
I = Im(:,:,index_d);
nbins = 256;
%����ͼ��F�ĻҶ�ֱ��ͼh��imhist������
%����ͨ������ѭ������ÿ�����ص�Ӷ��õ�ÿ���Ҷ�ֵ���ۼ����ص��������
hist_0 = imhist(I,nbins)';
%����ԭͼ�ĻҶȷֲ�����hs��hs=h/(M*N)        (i=0,1,��,255)��
hist_1 = hist_0/(height*width);
%����ԭͼ�Ҷȵ��ۼƷֲ�hp0��ʹ��cumsum������
hp_0 = cumsum(hist_1);
%hp1=hp0*255 ��hp1�������룬��hp1(1)=0
%hp_1 = round(hp_0*255);
hp_1 = hp_0*255;
hp_1(1)=0;

I0 = double(I);
%������ѭ������ͼ��F���������ص㣬���ÿһ�����ص�ĻҶ�ֵF(i,j)
for i=1:height
    for j=1:width
        Value=I0(i,j);
        NewValue = hp_1(Value+1);
        NewValue = round(NewValue);
        J(i,j,index_d)=NewValue;
    end
end
%����õ�����ͼ����������е�ĻҶ�ֵ��doubleת��Ϊuint8
J = uint8(J);  %ת��uint8����
end
