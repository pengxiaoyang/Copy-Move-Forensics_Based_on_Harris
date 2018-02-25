% a=5;%to demonstrate the break function of 'for'
% b=5;
% for j=1:10
%     b=b+1;
%     if b>9
%         break;
%     end
%     for i=1:10
%         a=a+1;
%         if a>10
%             break;
%         end
%     end
% end
% X=M1b(:,2);
% Y=M1b(:,1);
% figure;
% % subplot(1,2,1);
% imshow(pic);
% hold on
% plot(X,Y,'y+');
% X1=M1b(:,4);
% Y1=M1b(:,3);
% % subplot(1,2,2);
% % imshow(pic);
% % hold on
% plot(X1,Y1,'b.');
% hold off

X=Mr(:,2);
Y=Mr(:,1);
figure;
imshow(pic);
hold on
plot(X,Y,'g.');
X1=Mr(:,4);
Y1=Mr(:,3);
plot(X1,Y1,'r.');
hold off


% X=loc(:,1);
% Y=loc(:,2);
% figure;
% imshow(pic);
% hold on
% plot(X,Y,'r.');

