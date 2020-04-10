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
    
    %Translation by randomly generated parameter followed by rotation
    im=readimage(test,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('CM_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\CM', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
   

for j=1001:2000
    im=readimage(test,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('CMM_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\CMM', baseFileName);
    imwrite(im_trc,fullFileName,'png');
end

for j=2001:3000
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P1_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P1', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end


for j=3001:4000
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P2_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P2', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=4001:5000
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P3_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P3', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    

for j=5001:6000

    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P31M_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P31M', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=6001:7000
  
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
   
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P3M1_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P3M1', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=7001:8000
   
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P4_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P4', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=8001:9000
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P4G_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P4G', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=9001:10000

    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P4M_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P4M', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=10001:11000
 
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
   
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P6_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P6', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    

for j=11001:12000

    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('P6M_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\P6M', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=12001:13000
 
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PG_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\PG', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=13001:14000
 
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PGG_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\PGG', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=14001:15000

    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
    
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PM_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\PM', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=15001:16000

    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);
   
    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PMG_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\PMG', baseFileName);
    imwrite(im_trc,fullFileName,'png');
    end
    


for j=16001:17000
  
    im=readimage(train_all,j);
    n(j)=randi([1 10]);
    im_t=imtranslate(im, [n(j) n(j)]);

    im1=imrotate(im_t,30,'crop');
    im_trc = imcrop(im1, [64 64 127 127]);
    baseFileName = sprintf('PMM_%d.png',j);
    fullFileName = fullfile('C:\Users\pzt76\Documents\MATLAB\p4_startercode\data\wallpapers\test_aug\PMM', baseFileName);
    imwrite(im_trc,fullFileName,'png');
end

