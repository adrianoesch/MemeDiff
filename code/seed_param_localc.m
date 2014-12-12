% calculates the local clustering coefficient lc
% follows http://svn.camrdale.org/school/matlab/clustering.m
function lc=seed_param_localc(adj, degree, N)

np3=sum(adj^3.*eye(N),2); % number of paths 3 which return to every node i = number of 1-hop edges between neighbors
lc=2*np3./(degree.*(degree-1));
