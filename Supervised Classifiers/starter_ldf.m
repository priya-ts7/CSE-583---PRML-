clear all

          %Input the data
           data=input('Enter the data set to be classified');

           [train_featureVector, train_labels, test_featureVector, test_labels ] =  loadDataset(data);

          %Creating a target matrix of N X K dimension for training data 
           Train_labels=double(train_labels);
           k=length(unique(Train_labels));
           TRAINLABELS=full(ind2vec(Train_labels',k));

        %Learning the discriminant function
          Y=learnDiscriminant(train_featureVector,TRAINLABELS');
          
         %Classifying the train and test data
          [train_Pred disc1]=classify_ldf(Y,train_featureVector);
          [test_Pred disc2]=classify_ldf(Y,test_featureVector);

         %Creating a target matrix of N X K dimension for test data
          Test_labels=double(test_labels);
          TESTLABELS=full(ind2vec(Test_labels',k));
      
       
        %Create confusion matrix
        train_ConfMat = confusionmat(Train_labels,train_Pred')
        % Create classification matrix (rows should sum to 1)
        train_ClassMat = train_ConfMat./(meshgrid(countcats(train_labels))')
        % mean group accuracy and std
        train_acc = mean(diag(train_ClassMat))
        train_std = std(diag(train_ClassMat))


        % Create confusion matrix
        test_ConfMat = confusionmat(Test_labels,test_Pred')
        % Create classification matrix (rows should sum to 1)
        test_ClassMat = test_ConfMat./(meshgrid(countcats(test_labels))')
        % mean group accuracy and std
        test_acc = mean(diag(test_ClassMat))
        test_std = std(diag(test_ClassMat))
        
      % visualizeBoundaries(disc1,train_featureVector,train_labels,1,7);

