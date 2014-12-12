function utility = updateUtility( nodes, edges, perspref, alpha, beta, gamma )
%utility = updateUtility( nodes, edges, perspref, alpha, beta, gamma )
%
%   updates the utility values for each node if node is 0
utility = zeros(length(nodes),1);
netw = mean(nodes); %network utility is for each updating the same for every node

for i = 1:length(nodes)
    if nodes(i)==1
        continue
    else
        neigh = mean(nodes(edges(:,i)==1)); % get mean of neighboring nodes
        utility(i) = alpha*perspref(i)+beta*neigh+gamma*netw;
    end
end
