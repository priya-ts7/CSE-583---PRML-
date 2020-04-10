clear all

function [w] = fisherProjection(train_featureVector, train_labels)
      
        %Finding the number of classes in data
        Train_labels=double(train_labels);
        k=length(unique(Train_labels));
       
        %Finding the number of instances of each class
        N=zeros();
        for i=1:k
          
                N(i,1)=sum(Train_labels==i);
                
        end
        
        
      % Finding the mean associated with each class from training data
        for j=1:k
            train_class{j,1}=(train_featureVector(Train_labels(:,1)==j,:));
            mean_class{j,1}=mean(train_class{j,1});  
            n(j)=size(train_class{j,1},1);
        end
        
       % Finding the mean of the entire training data
        mean_data=mean(train_featureVector);
        
        %Estimating the within class variance
        s_w=zeros();
        for c=1:k
            Mean_Class{c,1}=repmat(mean_class{c,:},n(c),1);
            s_k(:,:)=((train_class{c,1}-Mean_Class{c,1})'*(train_class{c,1}-Mean_Class{c,1}));
            s_w=s_w+(s_k);
        end
        
        % Estimating the between class varainace
        s_b=zeros();
        for c=1:k
            s_b=s_b+(N(c)*(mean_class{c,1}-mean_data)'*(mean_class{c,1}-mean_data));
        end
        
        %Computing the weights associated with Fisher Projection 
        W=[];
        [ev1 ev2] = eig((s_w)\(s_b)); 
        [value, order] = sort(diag(ev2),'descend');
 
        for i=1:k-1
            W=[W ev1(:,order(i))];
        end
end

 
 
 