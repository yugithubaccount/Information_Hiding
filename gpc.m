% mygpc.m
% ����GPC����
function r=gpc(img)
[m,n] =size(img);
A=1.5:2:255.5;
B=0.5:2:254.5;
img = img';
% ��ʼ������
n0=0;n1=0;
vec=[];
r=0;
for i=1:1:m*n-1
    a=img(i);b=img(i+1);
    x=min(a,b);y=max(a,b);
    if x~=y
        x=double(x);
        y=double(y);
        vec=x:0.5:y;% ��������
        res0=sum(ismember(vec,A));%�󴩹�����λƽ��
        res1=sum(ismember(vec,B));
        n0=n0+res0;n1=n1+res1; % ����  
    end
end
r=n1/n0;
end