dataDir= './data/wallpapers/';
checkpointDir = 'modelCheckpoints';

rng(1) % For reproducibility
Symmetry_Groups = {'P1', 'P2', 'PM' ,'PG', 'CM', 'PMM', 'PMG', 'PGG', 'CMM',...
    'P4', 'P4M', 'P4G', 'P3', 'P3M1', 'P31M', 'P6', 'P6M'};

train_folder = 'train';
test_folder  = 'test';

train_all = imageDatastore(fullfile(dataDir,train_folder),'IncludeSubfolders',true,'LabelSource',...
    'foldernames');
train_all.Labels = reordercats(train_all.Labels,Symmetry_Groups);
test = imageDatastore(fullfile(dataDir,test_folder),'IncludeSubfolders',true,'LabelSource',...
    'foldernames');
test.Labels = reordercats(test.Labels,Symmetry_Groups);



%Augmentation of Class 1
for j=1:1000
    for k=1:5
            
    %Translating by randomly generated parameter
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('CM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CM', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    %Scaling of original image
    im2=imresize(im,0.5);
    baseFileName = sprintf('CM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CM', baseFileName);
    imwrite(im2,fullFileName,'png');

    
    %Rotation by a randomly generated angle
    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('CM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CM', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    %Reflection of original image
    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('CM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CM', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    %Combination of translation followed by rotation
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('CM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CM', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 2
for j=1001:2000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('CMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CMM', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('CMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CMM', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('CMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CMM', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('CMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CMM', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('CMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\CMM', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 3
for j=2001:3000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P1', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P1', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P1', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P1', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P1', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 4
for j=3001:4000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P2_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P2', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P2_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P2', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P2_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P2', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P2_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P2', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P2_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P2', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 5
for j=4001:5000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P3_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P3_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P3_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P3_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P3_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 6
for j=5001:6000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P31M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P31M', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P31M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P31M', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P31M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P31M', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P31M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P31M', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P31M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P31M', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 7
for j=6001:7000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P3M1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3M1', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P3M1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3M1', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P3M1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3M1', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P3M1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3M1', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P3M1_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P3M1', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 8
for j=7001:8000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P4_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P4_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P4_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P4_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P4_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 9
for j=8001:9000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P4G_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4G', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P4G_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4G', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P4G_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4G', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P4G_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4G', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P4G_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4G', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 10
for j=9001:10000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P4M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4M', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P4M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4M', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P4M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4M', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P4M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4M', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P4M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P4M', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 11
for j=10001:11000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P6_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P6_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P6_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P6_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P6_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 12
for j=11001:12000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('P6M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6M', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('P6M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6M', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('P6M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6M', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('P6M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6M', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P6M_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\P6M', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 13
for j=12001:13000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('PG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PG', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('PG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PG', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('PG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PG', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('PG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PG', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PG', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 14
for j=13001:14000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('PGG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PGG', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('PGG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PGG', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('PGG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PGG', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('PGG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PGG', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PGG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PGG', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 15
for j=14001:15000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('PM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PM', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('PM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PM', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('PM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PM', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('PM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PM', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PM', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 16
for j=15001:16000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('PMG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMG', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('PMG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMG', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('PMG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMG', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('PMG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMG', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PMG_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMG', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

%Augmentation of Class 17
for j=16001:17000
    for k=1:5
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    im_tc = imcrop(im_t, [64 64 127 127]);
    baseFileName = sprintf('PMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMM', baseFileName);
    imwrite(im_tc,fullFileName,'png');

    im2=imresize(im,0.5);
    baseFileName = sprintf('PMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMM', baseFileName);
    imwrite(im2,fullFileName,'png');

    r(j)=randi([0 360]);
    im_r=imrotate(im,r(j),'crop');
    im_rc = imcrop(im_r, [64 64 127 127]);
    baseFileName = sprintf('PMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMM', baseFileName);
    imwrite(im_rc,fullFileName,'png');

    im_ref=flip(im);
    im_refc = imcrop(im_ref, [64 64 127 127]);
    baseFileName = sprintf('PMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMM', baseFileName);
    imwrite(im_refc,fullFileName,'png');

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PMM_%d_%d.png',j,k);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\train_aug\PMM', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    
end

% Histogram of Augmentation Parameters
figure(1)
hist(n);
title('Histogram of Translation Parameter');

figure(2)
hist(r);
title('Histogram of Rotation Angle');