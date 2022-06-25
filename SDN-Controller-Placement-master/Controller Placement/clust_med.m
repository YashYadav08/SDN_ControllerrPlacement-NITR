function [idx]=clust_med(data,k,n)
%This function is used for data clustering using k-medoids algorithm
idx=zeros(n,k);
for i=1:k
idx(:,i)= kmedoids(data,i,'Distance',@lldistkm);
end
end