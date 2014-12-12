close all;
%set parameters ---------------------------------
N=500; % amount of nodes in network
uThreshold=0.262; % utility threshold. very sensitive!

alpha=0.3; %define personal utility weighting parameter
beta=0.6; %define neighbouring utility weighting parameter
gamma=0.1; %define whole network utility weighting parameter
seed_count = 1;% percentage or amount seed nodes
max_iter=30; %maximum of utility updates before abortion

seed_char_list = zeros(N,18); %prepare data "recording"
% adj = scalefree(N); %create scalefree network
adj = csvread('data/adj_(3-6-1)_th-0.262_suc-0.104_08-Dec-2014 17-34-20.csv');
 
% run the simulation -----------------------------------
w = waitbar(0,'computing...');
% get node parameters just once 
x=seed_param_eigenc(adj);
degree=sum(adj,2);
lc=seed_param_localc(adj, degree, N);
BC=betweenness_bin(adj);

%assign random values to each node from rand distribution 
%perspref = zeros(N,1)+0.5; %optional with no randomization in perspref
perspref = csvread('data/perspref_(3-6-1)_th-0.262_suc-0.104_08-Dec-2014 17-34-20.csv');

figure
for j=1:N
    nodes = zeros(N,1);    
    seed = j; %lets check each node(j) as a seed
    nodes(seed) = 1; % set seed nodes to 1
    
    neighs = find(adj(seed,:)); %get neighbouring nodes of seed

    vars = ones(max_iter,1); %prepare innovation progress variable
    i=1;
    while true
        vars(i)=mean(nodes); %update innovation diffusion progress
        if mean(nodes) > 0.98 || i>max_iter
            seed_char_list(j,5) = mean(nodes);
            break
        end
        utility = updateUtility(nodes,adj,perspref,alpha,beta,gamma);
        nodes((utility>uThreshold))=1;
        i=i+1;
    end
    
    %Seed Characteristics--------------------------
%   store eigenvector centrality values
    seed_char_list(j,1) = abs(x(seed));
    seed_char_list(j,7) = mean(abs(x(neighs)));
    seed_char_list(j,14) = max(abs(x(neighs)));
    
%   store degree values
    seed_char_list(j,2)=degree(seed);
    seed_char_list(j,8)=mean(degree(neighs));
    seed_char_list(j,15)=max(degree(neighs));
   
%   store local clustering values
    seed_char_list(j,3) = lc(seed);
    seed_char_list(j,9) = mean(lc(neighs));
    seed_char_list(j,16) = max(lc(neighs));
    
%   store betweenness centrality values
    seed_char_list(j,4) = BC(seed);
    seed_char_list(j,10) = mean(BC(neighs));
    seed_char_list(j,17) = max(BC(neighs));
    
    %record personal preference (optional)
    seed_char_list(j,6)= perspref(seed);
    seed_char_list(j,11)= mean(perspref(neighs));
    seed_char_list(j,18)= max(perspref(neighs));
    
    %set binary successvariable and get speed (no of iteration when
    %more then 50% of nodes have state 1
    if  mean(nodes)>0.98; seed_char_list(j,12) = 1; else seed_char_list(j,12) = 0;end
    if  mean(nodes)>0.98; seed_char_list(j,13) = find(vars>0.5,1,'first');end

    %Plot seed performance
    hold on
    plot(1:max_iter,vars(1:max_iter),'red')
    xlabel('No of utility updates','FontSize',15)
    ylabel('Success ratio','FontSize',15)
    waitbar(j/N)
    % print success ratio every 10th iteration
    if mod(j,10)==0;
        sum(seed_char_list(:,12))/j
    end
end

hold off;
figure;
%plot different variables
sorted_seed_char_list = sortrows(seed_char_list, 5);
plot(sorted_seed_char_list(:,5), sorted_seed_char_list(:,1), '.','MarkerEdgeColor','green','MarkerSize',18);
xlabel('Number of nodes affected (Normalized)','FontSize',15)
ylabel('EigenVector centrality mean','FontSize',15)
figure;
plot(sorted_seed_char_list(:,5), sorted_seed_char_list(:,2), '.','MarkerEdgeColor','magenta','MarkerSize',18);
xlabel('Number of nodes affected (Normalized)','FontSize',15)
ylabel('Degree mean','FontSize',15)
figure;
plot(sorted_seed_char_list(:,5), sorted_seed_char_list(:,3), '.','MarkerEdgeColor','red','MarkerSize',18);
xlabel('Number of nodes affected (Normalized)','FontSize',15)
ylabel('Local clustering mean')
figure;
plot(sorted_seed_char_list(:,5), sorted_seed_char_list(:,4), '.','MarkerEdgeColor','blue','MarkerSize',18);
xlabel('Number of nodes affected (Normalized)','FontSize',15)
ylabel('Betweenness centrality mean', 'FontSize', 15)


degree_unique=unique(degree); %degree distribution plot
degree_unique_norm=normc(histc(degree(:),degree_unique));
figure
plot(degree_unique, degree_unique_norm,'magenta');
xlabel('k');
ylabel('P(k)')



%create table with headers
t = table(seed_char_list(:,1),seed_char_list(:,2),seed_char_list(:,3),seed_char_list(:,4),...
          seed_char_list(:,5),seed_char_list(:,6),seed_char_list(:,7),seed_char_list(:,8),...
          seed_char_list(:,9),seed_char_list(:,10),seed_char_list(:,11),seed_char_list(:,12),...
          seed_char_list(:,13),seed_char_list(:,14),seed_char_list(:,15),seed_char_list(:,16),...
          seed_char_list(:,17),seed_char_list(:,18));
colnames = {'seed_eigenc','seed_degree','seed_localc', ...
    'seed_betweenness','inno_pen','seed_perspref','neighs_eigenc',...
    'neighs_degree','neighs_localc','neighs_betweenness','neighs_perspref','success','speed',...
    'neighsmax_eigenc','neighsmax_degree','neighsmax_localc','neighsmax_betweenness','neighsmax_perspref'};
t.Properties.VariableNames = colnames;

%create filenames
filestamp = strcat('(',num2str(alpha*10),'-',num2str(beta*10),'-',num2str(gamma*10),...
    ')_th-',num2str(uThreshold),'_suc-',num2str(mean(seed_char_list(:,12))),'_',strrep(datestr(now),':','-'));
rfilename = strcat('data/results_',filestamp,'.csv');
afilename = strcat('data/adj_',filestamp,'.csv');
pfilename = strcat('data/perspref_',filestamp,'.csv');

%write csvs
writetable(t,rfilename,'writevariablenames',1);

%unbreak if you want to save perspref and acj data to csv
break
csvwrite(afilename,adj);
csvwrite(pfilename,perspref);