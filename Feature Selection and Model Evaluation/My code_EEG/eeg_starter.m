clear all;
close all;
clc;

%Read the data set
load('eeg_data.mat')

% Reassigning Class Labels
labels(labels==1)=0;
labels(labels==6)=1;
labels(labels==10)=2;

%Cleaning the data set
row_zeros=any(eeg_data,2);
k=zeros();
for i=1:size(row_zeros,1)
    if (row_zeros(i,1)==0)
        k=[k i];
    end
end
K=k(2:end)';
eeg_data(K,:)=[];
labels(K,:)=[];

% Perform filter operation 20 times
for i=1:20
   [TrainMat, LabelTrain, TestMat, LabelTest]= randomDivideMulti([labels,eeg_data]);
    topfeatures{i}=rankingfeatures_eeg(TrainMat,LabelTrain);
end


%Plot the top 1% features selected through 20 iterations
TopFeatures=countfeature(topfeatures,TrainMat);
 plotFeat(TopFeatures,feature_names,20);

TOPFeatures=TopFeatures(:,1);

%Perform Forward Selection 20 times
for i=1:20
   [TrainMat, LabelTrain, TestMat, LabelTest]= randomDivideMulti([labels,eeg_data]);
    forwardSelected{i}=featureselect_eeg(TrainMat,LabelTrain,TOPFeatures,TestMat,LabelTest);
end

%Plot the top 10% features selected by wrapper through 20 iterations
SelectedFeatures=FinalFeatures(forwardSelected);
Oneperc=SelectedFeatures(1:16,1);
figure(3)
histogram(Oneperc);

%Train and Test the classifier using features selected by wrapper
Train=TrainMat(:,[TOPFeatures]);
Test=TestMat(:,[TOPFeatures]);

MDL=fitcknn(Train(:,[SelectedFeatures]),LabelTrain);
loss_c=loss(MDL,Test(:,[SelectedFeatures]),LabelTest);
label = predict(MDL,Test(:,[SelectedFeatures]));
figure(4)
plotconfusion(LabelTest',label');

 
 