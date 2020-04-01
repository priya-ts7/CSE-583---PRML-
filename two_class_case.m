data='wine';
[train_featureVector, train_labels, test_featureVector, test_labels ] =  loadDataset(data);

%Obtaing the data and labels for first 2 classes
train_fv=train_featureVector(1:66,:);
Train_labels=double(train_labels(1:66,:));
test_fv=test_featureVector(1:64,:);
Test_labels=test_labels(1:64,:);
Test_Labels=double(Test_labels);

%Counting the number of classes
k=length(unique(Train_labels));
TRAINLABELS=full(ind2vec(Train_labels',k));

%%%Performing LDF classification on the 2 class data
Y=learnDiscriminant(train_fv,TRAINLABELS');
test_Pred=classify_ldf(Y,test_fv);

TESTLABELS=full(ind2vec(Test_Labels',k));
 
%Calculating Performance metric for LDF method
  test_ConfMat = confusionmat(Test_Labels,test_Pred)
  t=countcats(Test_labels);
  test_ClassMat = test_ConfMat(1:2,1:2)./(meshgrid(t(1:2)'))
  test_acc = mean(diag(test_ClassMat))
  test_std = std(diag(test_ClassMat))
  
%%% Performing Fisher Projection on 2 class data
  w=fisherProjection(train_fv,Train_labels);
  
  trainProjected= train_fv*w;
  testProjected=test_fv*w;
     
  %Calculating Performance metric for Fisher method
  y=knnClassify(trainProjected,testProjected,Train_labels);
  test_ConfMat = confusionmat(Test_Labels,y)
  t=countcats(Test_labels);
  test_ClassMat = test_ConfMat(1:2,1:2)./(meshgrid(t(1:2)'))
  test_acc = mean(diag(test_ClassMat))
  test_std = std(diag(test_ClassMat))

       