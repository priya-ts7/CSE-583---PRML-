function [y]=knnClassify(trainProjected,testProjected,Train_labels)
       
        % Size of Projected test and training data
       [n1 f1]=size(trainProjected);
       [n2 f2]=size(testProjected);
       
       %Calculating the Euclidian distance between the test sample and the
       %training data
       %Choosing the first 9 nearest distances to test sample 
       dist=zeros();
       nearestNeighbor=zeros(n2,9);
       for i=1:n2
          dist=sum((repmat(testProjected(i,:),n1,1)-trainProjected).^2,2);
          [sorted_dist, nearest]=sort(dist,'ascend');
          nearestNeighbor(i,:)=nearest(1:9);
       end
      
       %Finding the labels of the nearest training data points
         testPredict=zeros();
       for i=1:n2
           for j=1:9
             testPredict(i,j) = Train_labels(nearestNeighbor(i, j));
           end
       end
       
       %Assigning the test label as the most frequented training label
       %among the nearest neighbors
        for i=1:length(testPredict)
            y(i) = mode(testPredict(i,:),2);
        end
end
