function h=strifePoss(S)

% Order the similarity values from largest to smallest
S=sort(S,'descend');

[n,m]=size(S);

% Calculate (r_i - r_i+1) for 2:n 
S_new=minus(S(2:n-1,:),S(3:n,:));


% Cumulative sum of r_j
temp=cumsum(S);

% Vector multiplication of the vector of (r_i - r_i+1) and vector of log2(i/sum of r_j for j=1 to i)
h=zeros(m,1);
for i=1:m
h(i)=S_new(:,i)'*log2((2:n-1)'./temp(2:end-1,i));
end
    
end
