function S=simi(x,y,p)
% Similairty calculation between an observation x and an observation y. p
% is a parameter for the similarity calculation.

S=(1-abs(x.^p-y.^p)).^(1/p);
