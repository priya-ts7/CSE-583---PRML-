function [w] = learnDiscriminant (train_fv, target)
      
      % Number of samples and features in training data
       samples=size(train_fv,1);
       
        % Concatenating the feature vector with a column of 1s
        A=ones(1,samples);
        x=vertcat(A ,train_fv');
        xtilda=x';
        x_inv=pinv(xtilda);
        
        %Estimating the weight matrix
        w=zeros();
        w=(x_inv)*target;
        
end

        

        
   

       
       