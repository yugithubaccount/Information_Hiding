function p=chi(x)
% x ��һ��ͼ��
% ��⿨�������ĺ���
n=sum(hist(x,[0:255]),2);% ���������,hist��Ƶ��,�õ�����һ��������
h2i=n([1:2:255]);% ȡ����
h2is=(h2i+n([2:2:256]))/2;
filter=(h2is~=0);   % ������
k=sum(filter);      % ͳ�Ʋ���0��
idx=zeros(1,k);     % ��������
for i=1:128
    if filter(i)==1
        idx(sum(filter(1:i)))=i;% ���㵱ǰ�ж���1
    end
end
r=sum(((h2i(idx)-h2is(idx)).^2)./(h2is(idx)));
p=1-chi2cdf(r,k-1);% �������
end