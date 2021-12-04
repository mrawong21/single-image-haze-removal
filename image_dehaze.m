clear all;


%% ��ȡ�����ļ���ͼƬ��Ԥ����
imgpath=('E:/ѧϰ/�Ķ�����/���׷���/ȥ��/ʵ��/DCP/Dataset/');
imgDir1=dir('./Dataset/*.jpg');
imgDir2=dir('./Dataset/*.jpeg');%��������jpg��ʽ�ļ�
imgDir=[imgDir1;imgDir2] ;%�ṹ��ĺϲ�


%% ��ȡͼƬ,ȥ���洢
for i=1:length(imgDir) 
    img=imread(strcat(imgpath,imgDir(i).name));
    
    filename=imgDir(i).name;
    im=im2double(img);%��ȡÿ��ͼƬ
    dehaze_image=dehaze(im); %����dehazeȥ����
    
   %�洢
   imwrite(dehaze_image, fullfile('Results/dehaze',filename));
   
   dehaze_image=uint8(dehaze_image*255);
   new_image=histeq_C(dehaze_image);%%ֱ��ͼ���⻯��ǿ
   imwrite(new_image, fullfile('Results/dehaze+he',filename));
end

