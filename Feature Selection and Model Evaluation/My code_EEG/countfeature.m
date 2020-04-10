function TOPFEATURES=countfeature(topfeatures,TrainMat)
for i=1:20
    TopFeatures{i}=topfeatures{i}(:,1);
    vr{i}=topfeatures{i}(:,2);
end

vr=cell2mat(vr);
warning('off' ,'all');

for i=1:size(TrainMat,2)
    nr_in_cell = cellfun(@(x) find(x==i), topfeatures, 'Uni',0);
    total_occurrences(i) = numel([nr_in_cell{:}]);
end
[Total_selections R]=sort(total_occurrences,'descend');
R=R';

no_feature=round(0.01*size(TrainMat,2));

TOPFEATURES=[R(1:no_feature) vr(1:no_feature,1)];
end
