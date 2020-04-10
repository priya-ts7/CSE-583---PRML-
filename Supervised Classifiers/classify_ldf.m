function [yPred y_test] = classify_ldf (W, test_fv)

[n f]=size(test_fv);

% Concatenating the feature vector with a cloumn of 1s
 B=ones(1,n);
 x1=vertcat(B ,test_fv');
 
% Calculating the discriminant function
 y_test=(x1'*W);

% Assigning the test samples to corresponding class
for i=1:n
           maxi=max(y_test(i, :));
           yPred(i)=find(y_test(i, :)==maxi);
           
end
end



  

      