function alpha = infoguess(I)
sz=size(I);% ����ά��
% ������Ϣ��
for k=1:1:11
    rt =(k-1)/10; % ��д��   
    row=round(sz(1)*rt);% ��
    col=round(sz(2)*rt);% ��
    msg=randsrc(row,col,[0 1;0.5 0.5]);%���������Ϣ
    stg=I;% stg ��ʾ��дͼ��
    if row~=0
        stg(1:row,1:col)=bitset(stg(1:row,1:col),1,msg);% ������
    end
    n=sum(hist(stg,[0:255]),2);% ��Ƶ��
    % ����Ҷ�ֱ��ͼ
    %n1=n2=n3=[]
    n1=n([1:2:255-1]);% ��0 2 4 ... 254
    n2=n([2:2:255]);% ��1 3 5 ...255
    n3=n([3:2:255-1]);%2 4 6... 254
    %% ����F1��F2
     F1(k)=sum(abs(n2-n1)');
     F2(k)=sum(abs(n3-n2(1:end-1))');
end
x=[0:1:10];
x=x/10;
X=[ones(11,1) x']; 
Y1 = F1';
Y2 = F2';
% ���ع�
[b,bint,r,rint,stats]=regress(Y1,X);
[b1,bint1,r1,rint1,stats1]=regress(Y2,X);
%x1=linspace(min(x),max(x));
% figure;
a = b(2);inte = b(1);% ϵ���ͽؾ�
a1 = b1(2);inte1 = b1(1);
a2 = a-a1;inte2 = b(1)-b1(1);
[res_x] = roots([a2,inte2]); %��ⷽ����
alpha=(abs(res_x))/(1+abs(res_x));
end