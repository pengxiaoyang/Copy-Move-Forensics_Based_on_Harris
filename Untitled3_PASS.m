a=size(Mf);
Mr=Mf;
B=zeros(1,a(1));
for i=1:a(1)
    B(i)=sqrt((Mr(i,1)-Mr(i,3))^2+(Mr(i,2)-Mr(i,4))^2);% Generate the Edu of every point-parts in Mf
end

A=tabulate(B(:)); % Value Count Percent

b=size(A);
for i=1:b(1)
    if A(i,2)<=768*1024*0.0001
        C(i)=inf;
    else
        C(i)=1;
    end
end

D=[A(:,1),C(1,:)'];

% Remove the elments of Mf using B
k=0;
for i=1:a(1)
    t=find(D(:,1)==B(i));
    i1=i-k;
    if D(t,2)==inf
        Mr(i1,:)=[];
        k=k+1;
    end
end

