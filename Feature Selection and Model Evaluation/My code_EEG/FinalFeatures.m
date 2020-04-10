function SelectedFeatures=FinalFeatures(forwardSelected)

warning('off' ,'all');

for i=1:155
    nr_in_cell = cellfun(@(x) find(x==i), forwardSelected, 'Uni',0);
    total_occurrences(i) = numel([nr_in_cell{:}]);
end
[Total_selections R]=sort(total_occurrences,'descend');

SelectedFeatures=R';
end