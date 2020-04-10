clear all
       
       % Input the data 
      data=input('Enter the data set to be classified');
      [train_featureVector, train_labels, test_featureVector, test_labels ] =  loadDataset(data);
      
      %Convert the training and test labels to type double       
      Train_labels=double(train_labels);
      Test_labels=double(test_labels);
      
      %Learning the Fisher Projection weights
      w=fisherProjection(train_featureVector,train_labels);
      
      %Projecting training and test data using Fisher weights
      trainProjected= train_featureVector*w;
      testProjected=test_featureVector*w;
      
      %Classifying the project test data using kNN classifier
      y=knnClassify(trainProjected,testProjected,Train_labels);
      
      % Evaluating the performance of classifier
      test_ConfMat = confusionmat(Test_labels,y')
      test_ClassMat = test_ConfMat./(meshgrid(countcats(test_labels))')
      test_acc = mean(diag(test_ClassMat))
      test_std = std(diag(test_ClassMat))

       