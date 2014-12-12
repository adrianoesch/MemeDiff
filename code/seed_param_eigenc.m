function x=seed_param_eigenc(adj)

[V, D]=eig(adj); %V right eigenvector, D eigenvalues
[max_eig, ind]=max(diag(D));
x=V(:,ind);
