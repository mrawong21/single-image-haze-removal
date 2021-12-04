clear all;


%% 读取数据文件夹图片的预处理
imgpath=('E:/学习/阅读文献/文献分类/去雾/实验/DCP/Dataset/');
imgDir1=dir('./Dataset/*.jpg');
imgDir2=dir('./Dataset/*.jpeg');%遍历所有jpg格式文件
imgDir=[imgDir1;imgDir2] ;%结构体的合并


%% 读取图片,去雾，存储
for i=1:length(imgDir) 
    img=imread(strcat(imgpath,imgDir(i).name));
    
    filename=imgDir(i).name;
    im=im2double(img);%读取每张图片
    dehaze_image=dehaze(im); %调用dehaze去雾函数
    
   %存储
   imwrite(dehaze_image, fullfile('Results/dehaze',filename));
   
   dehaze_image=uint8(dehaze_image*255);
   new_image=histeq_C(dehaze_image);%%直方图均衡化加强
   imwrite(new_image, fullfile('Results/dehaze+he',filename));
end

