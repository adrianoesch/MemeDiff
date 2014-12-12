list=(1:N)';
seed_ranking=[list seedlist_sum degree lc]; %1) seed number 2)sum over all iterations 3) degree 4) local clustering
% seed_ranking=sortrows(seed_ranking,-2); %rank the seeds from teh best to the worst performing

% seed_top10=seed_ranking(1:N/10,:); %select the best 10% seeds