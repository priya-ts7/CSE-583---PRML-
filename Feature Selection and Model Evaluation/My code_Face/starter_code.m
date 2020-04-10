%Read the data set
FeatureMatOD=dlmread('ODFeatureMat.txt');
FeatureMatHD=dlmread('HDFeatureMat.txt');
FeatureMat=[FeatureMatOD FeatureMatHD(:,2:end)];

% Perform filter operation 20 times
for i=1:100
   [TrainMat, LabelTrain, TestMat, LabelTest]= randomDivideMulti(FeatureMat);
    topfeatures{i}=rankingfeatures(TrainMat,LabelTrain);
end

%Plot the top 1% features selected through 20 iterations
TopFeatures=countfeature(topfeatures,TrainMat);
plotFeat(TopFeatures);

TOPFeatures=TopFeatures(:,1);

%Perform Forward Selection 100 times
for i=1:100
   [TrainMat, LabelTrain, TestMat, LabelTest]= randomDivideMulti(FeatureMat);
    forwardSelected{i}=featureselect(TrainMat,LabelTrain,TOPFeatures,TestMat,LabelTest);
end

%Plot the top 10% features selected by wrapper through 100 iterations
SelectedFeatures=FinalFeatures(forwardSelected);
Oneperc=SelectedFeatures(1:16,1);
figure(2)
histogram(Oneperc);

%Train and Test the classifier using features selected by wrapper
Train=TrainMat(:,[TOPFeatures]);
Test=TestMat(:,[TOPFeatures]);

MDL=fitcknn(Train(:,[SelectedFeatures]),LabelTrain);
label = predict(MDL,Test(:,[SelectedFeatures]));
figure(3)
plotconfusion(LabelTest',label');
loss_training=loss(MDL,Train(:,[SelectedFeatures]),LabelTrain)
loss_test=loss(MDL,Test(:,[SelectedFeatures]),LabelTest)

