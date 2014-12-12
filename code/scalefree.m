%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Code adopted from %%%
%%% Modeling and Simulating Social Systems with MATLAB %%%
%%% http://www.soms.ethz.ch/teaching/MatlabFall2012 %%%
%%% Authors: Stefan Brugger and Cristoph Schwirzer, 2011 %%%
%https://github.com/maybmdz/NetworkBased-Modeling-for-the-Spread-of-Scientific-Ideas/blob/master/doc/latex/scalefree.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Afull = scalefree(N)
% Use the Barabasi-Albert model to generate a scale free graph of size n (as
% described in Albert-Laszlo Barabasi & Reka Albert: "Emergence of scaling
% in random networks")
%
% INPUT
% N: [1]: number of nodes
% m0: [1]: number of initially placed nodes
% m: [1]: number of nodes a new added node is connected to, 1 <= m < m0
%
% OUPUT
% A: [n n] sparse symmetric adjacency matrix representing the generated graph
% Start with a graph of size m0 and add edges to this graph. Each of these m0
% nodes is connected to at least m nodes.
N=500;
m0=20;
m=5;
B = zeros(m0, m0);
for i = 1:m0
neighbors = randsample(m0-1, m);
neighbors = neighbors + (neighbors>=i);
B(i,neighbors) = 1;
B(neighbors,i) = 1;
end
% Create a vector of edges added so far, i.e. nodes edge(2*i) and edge(2*i-1),
% 1 <= i <= nEdges, are connected by an edge.
[rows, columns] = find(triu(B));
nEdges = size(rows, 1);
edges = reshape([rows';columns'], 2*nEdges, 1);
edges = [edges; zeros(2*(N-m0)*m,1)];
% Add nodes m0+1:n, one at a time. Each node is connected to m existing nodes,
% where each of the existing nodes is chosen with a probability that is
% proportional to the number of nodes it is already connected to.
used = zeros(N, 1); % is a node already used in a timestep?
for i = m0+1:N
neighbors = zeros(1, m);
for j=1:m
k = edges(randi(2*nEdges));
while used(k)
k = edges(randi(2*nEdges));
end
used(k) = 1;
neighbors(j) = k;
end
used(neighbors) = 0;
edges(2*nEdges+1:2*nEdges+2*m) = reshape([repmat(i, 1, m); neighbors], ...
1, 2*m);
nEdges = nEdges+m;
end
% finally construct a symmetric adjacency matrix using the vector of edges
edges = edges(1:2*nEdges);
first = edges(1:2:end);
second = edges(2:2:end);
A = sparse([first;second], [second;first], ones(2*nEdges, 1), N, N);
Afull=full(A);
end % scale_free(...)