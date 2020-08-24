function h=nonspecificityPoss(S)

% Order the similarity values from largest to smallest
S=sort(S,'descend');

[n,m]=size(S);

% Calculate (r_i - r_i+1) for 2:n 
S_new=minus(S(2:n-1,:),S(3:n,:));


% Vector multiplication of the vector of (r_i - r_i+1) and vector log2(2:n)
h=zeros(m,1);
for i=1:m
h(i)=S_new(:,i)'*log2(2:n-1)';
end

end
