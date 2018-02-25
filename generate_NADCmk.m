function [ DC,mk ] = generate_NADCmk(i1,imgblocks,points)
% GERATE_NADCmk __abstract
% 'i1' represents the numbers of the points, 
% 'imgblocks' represents the pixels of the whole img.
% 'points' represents which are the usable Harris corners.

% generate points'neighborhood
NA=cell(i1,1);
for k=1:i1
    NA{k}=imgblocks(points(k,1)-16:points(k,1)+16,points(k,2)-16:points(k,2)+16);
end
% generate the DCT of points'neighborhood
NAdct=cell(i1,1);
for k=1:i1
    NAdct{k}=dct2(NA{k});
end
% generate mk and DC of every points'neighborhood
mk=zeros(i1,1);
DC=zeros(i1,1);
for k=1:i1
    DC(k)=NAdct{k}(1,1);
    mk(k)=mean(NAdct{k}(:));
end
end