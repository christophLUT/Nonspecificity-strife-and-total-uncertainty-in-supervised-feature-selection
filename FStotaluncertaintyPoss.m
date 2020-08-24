function [ranking,I]=FStotaluncertaintyPoss(data,v,c,p)
% Function to calculate total uncertainty values according to possibility
% theory for supervised feature selection in the context of classification.
%
% Inputs:
%   data: data matrix (observations = rows, variabels and class label =
%   colums)
%   as columns
%   v: column indices of feature variables
%   c: column index of the class labels
%   p: parameter for the similarity measure (standard parameter value: 1)
% Output:
% ranking: The ranked indices of the features (e.g. 3,1,2 --> feature 3
% ranked first (most relevant feature), feature 1 is the second most relevant feature, feature 2 is
% ranked third)
% I: information transmission values (total uncertainty values for each feature)

%% Calculation
%Step 1: Normalization to unit interval:

[data2, lc, cs]= init_data_new(data,v,c); %### changed

l=max(data2(:,end));     % #-classes
m=size(data2,1);         % #-samples
t=size(data2,2)-1;       % #-features

%Step 2: Computation of mean vectors from class samples:

% forming idealvec using arithmetic mean
idealvec=zeros(l,t);
for k=1:l
    idealvec_s(k,:)=mean(data2(find(data2(:,end)==k),1:t));
end
% sample data
datalearn_s=data2(:,1:t);

%Step 3: Computing similarities between mean vectors and samples:
%First similarities between samples within class k and ideal vector:
s1=zeros(max(lc),length(v),l);
for k=1:l % classes
    for i=1:lc(k) % samples in class
        s1(i,v,k)=simi(datalearn_s(cs(k)-1+i,v),idealvec_s(k,:),p);
    end
end

ns1=zeros(t,l);
nsf1=zeros(t,l);
I1=zeros(t,l);

%Next similarities between all samples and ideal vector:
s1f=zeros(sum(lc),length(v),l);
for k=1:l
    for i=1:(sum(lc))
        s1f(i,v,k)=simi(datalearn_s(i,v),idealvec_s(k,:),p);
    end
end

%Step 4: Computing nonspecificity for each feature
for k=1:l % classes
    for i=1:t % features
        ns1(i,k)=totalUncertaintyPoss(s1(1:lc(k),i,k));
        nsf1(i,k)=totalUncertaintyPoss(s1f(:,i,k));
    end
end

%Step 5: Computing the amount of reduced uncertainty for each feature:
for k=1:l % classes
    for i=1:t % features
        I1(i,k)=nsf1(i,k)-ns1(i,k);
        %I1(i,k)=nsf1(i,k)/sum(lc)-ns1(i,k)/lc(k);  % standardized
        %I1(i,k)=ns1(i,k)/lc(k)-nsf1(i,k)/sum(lc); % old
    end
end


%I1
I=sum(I1,2); %Amount of reduced uncertainty for each feature

%Step 6: Feature Ranking (and Removal of features with lowest uncertainty reduction)
[~, ranking]=sort(I,'descend');


