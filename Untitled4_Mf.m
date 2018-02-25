M1c=Mf;
M1c(:,[1,2])=M1c(:,[2,1]);
M1c(:,[3,4])=M1c(:,[4,3]);

% M1c=M1;

figure;
imshow(pic);
hold on
X=[M1c(:,1);M1c(:,3)];
Y=[M1c(:,2);M1c(:,4)];
a=size(M1c);

k=0;%add
M=[];

for i=1:a(1)
    if X(i)>230 && X(i)<687 && Y(i)>630 && Y(i)<703
        line([X(i),X(i+a(1))],[Y(i),Y(i+a(1))]);
        Mt=[X(i),Y(i),X(i+a(1)),Y(i+a(1))];
        M=[M;Mt];
        k=k+1;
    end
end
hold off


%% For finding out the suitable mathcing regions
a=size(M);
Mr=M;
B=zeros(1,a(1));
for i=1:a(1)
    B(i)=sqrt((Mr(i,1)-Mr(i,3))^2+(Mr(i,2)+Mr(i,4))^2);
end

A=tabulate(B(:));
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
