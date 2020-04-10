
function topfeatures= rankingfeatures(TrainMat,LabelTrain)
 for i=1:size(TrainMat,2)
V_f(i)=var(TrainMat(:,i));
 end

 for i=1:size(LabelTrain,1)
     if (LabelTrain(i,1)==0)
         F_0(i,:)=TrainMat(i,:);
     end
 end
 
 n0=size(F_0,1);
 F_1=TrainMat(n0+1:end,:);
 
 for i=1:size(F_0,2)
     mean_0(i)=mean(F_0(:,i));
     mean_1(i)=mean(F_1(:,i));
 end
 
 for i=1:size(F_0,2)
     var_0(i)=var(F_0(:,i));
     var_1(i)=var(F_1(:,i));
 end
 
 for i=1:size(TrainMat,2)
     avr(i)=(V_f(i)/(0.5*((var_0(i)+var_1(i))/abs(mean_0(i)-mean_1(i)))));
 end
 

 [avr, I]=sort(avr,'descend');
 I=I';
 avr=avr';
 no_feature=round(0.01*size(TrainMat,2));
 topfeatures=[I(1:no_feature) avr(1:no_feature)];
end
