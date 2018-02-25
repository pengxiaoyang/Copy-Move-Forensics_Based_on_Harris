function [ Mr ] = generate_Mr( Mf )
%GENERATE  __abstract
% Generate the Edu of every point-parts in Mf

a=size(Mf);
Mr=Mf;
B=zeros(1,a(1));
for i=1:a(1)
    B(i)=sqrt((Mr(i,1)-Mr(i,3))^2+(Mr(i,2)+Mr(i,4))^2);
end

A=tabulate(B(:)); % Value Count Percent

% t=max(A(:,3)); % Use the max frequency
% C=find(A==t);


b=size(A);
c=size(C);
for i=1:c(1)
    C(i)=C(i)-b(1)*2;  % The number of row you are on
end

% Then find the corresponding location of B, note the numbers, and then
% remove from Mr, finally, return the last Mr.
D=zeros(1,c(1));
for i=1:c(1)
    D(i)=A(C(i),1);
end

% d=size(D);
E=B;
for i=1:c(1)
    t=D(i);
    for j=1:a(1)
        if E(j)~=t
            E(j)=inf;
            Mr(j,:)=inf;
        end
    end
end

k=0;
for i=1:a(1)
    i1=i-k;
    if Mr(i1,1)==inf
        Mr(i1,:)=[];
        k=k+1;
    end
end

end