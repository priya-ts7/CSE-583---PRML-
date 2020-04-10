function FeatureSelect= featureselect_eeg(TrainMat,LabelTrain,topfeatures,TestMat,LabelTest)
Train=TrainMat(:,[topfeatures]);
Test=TestMat(:,[topfeatures]);
[ns nf]=size(Train);

FeatureSelect=[1];
tempacc=0;

for k=1:10
    for i=1:nf
    mdl=fitcknn(Train(:,[FeatureSelect i]),LabelTrain);
    f_loss(i)=loss(mdl,Test(:,[FeatureSelect i]),LabelTest);
    acc(i)=1-f_loss(i);
    j=find(acc == max(acc(:)));
    end
    
    if(tempacc<max(acc(:)))
    FeatureSelect=[FeatureSelect j];
    tempacc=max(acc(:));

    end
end
end


    





