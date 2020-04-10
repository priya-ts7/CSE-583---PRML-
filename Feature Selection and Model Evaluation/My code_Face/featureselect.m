function FeatureSelect= featureselect(TrainMat,LabelTrain,topfeatures,TestMat,LabelTest)
Train=TrainMat(:,[topfeatures]);
Test=TestMat(:,[topfeatures]);
[ns nf]=size(Train);

FeatureSelect=[1];
tempacc=0;

for k=1:5
    for i=1:nf
    mdl=fitcknn(Train(:,[FeatureSelect i]),LabelTrain);
    f_loss(i)=loss(mdl,Test(:,[FeatureSelect i]),LabelTest);
    acc(i)=1-f_loss(i);
    end
 j=find(acc == max(acc(:)));
    if(tempacc<max(acc(:)))
    FeatureSelect=[FeatureSelect j];
    tempacc=max(acc(:));
    end
end


MDL=fitcknn(Train(:,[FeatureSelect]),LabelTrain);
loss_c=loss(MDL,Test(:,[FeatureSelect]),LabelTest);
end


    





