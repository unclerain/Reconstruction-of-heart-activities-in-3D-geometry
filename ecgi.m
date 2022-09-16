close all; clear; clc; % addpath(genpath(pwd));
%---data 5:cond(A)=e+6----------
A = cell2mat(struct2cell(load('/Users/yushu/Documents/transferMatrix_centricSphere.mat')));
X = cell2mat(struct2cell(load('/Users/yushu/Documents/p_innerSphere.mat')));
% %X = X(:,1:end);
%---data 4:cond(A)=e+12--------------------
% A = cell2mat(struct2cell(load('/Users/wdan/Documents/0ECGI/ED/matrix/A.mat')));
% R = cell2mat(struct2cell(load('/Users/wdan/Documents/0ECGI/ED/matrix/R1.mat')));
% Z1 = cell2mat(struct2cell(load('/Users/wdan/Documents/0ECGI/ED/potential/Run0016-cs.mat')));
% Z1 = Z1.potvals;
% Z2 = cell2mat(struct2cell(load('/Users/wdan/Documents/0ECGI/ED/potential/Run0016-cs.mat')));
% Z2 = Z2.potvals;
% Z3 = cell2mat(struct2cell(load('/Users/wdan/Documents/0ECGI/ED/potential/Run0016-cs.mat')));
% Z3 = Z3.potvals;
% X = R*[Z1 Z2 Z3];
%% 实验1:模拟数据，无噪声，稀疏时表现较好；但有噪声时，表现差
% [M,N] = size(A); x = zeros(N,1); k = randperm(N); P = 20;
% x(k(1:P)) = 1; y = A*x; yn = y;
% fprintf('Processing......cond(A) = %d,  noise/signal = %d \n',cond(A),norm(yn-y)/norm(y));
% ecgiinverse(A,yn,x,eye(N));
%% 实验2:真实数据，噪声小，稀疏时表现较好
A = -A;
[M,N] = size(X); k = randperm(N); P = 1;
x = X(:,k(1:P))*randn(P,1); 
y = A*x; itrmax = 5;
for i = 1:itrmax
    %snr = 20+10*i; yn = awgn(y,snr); % no noise or add noise awgn(y,10)
    yn = y+randn(size(y))*0.01*i;
    fprintf('Processing......\nSparsity = %d/%d,  cond(A) = %d,  SNR = %d \n',...
        P,N,cond(A),10*log10(norm(y)/norm(yn-y)));
    xe = ecgiinverse(A,yn,x,X(:,k(P+1:end)));
    
    if i == 1
        XE = zeros(M,size(xe,2)+1,itrmax);
    end
    XE(:,:,i) = [x xe];
    %---Lasso---------------------------------
% [xl,FitInfo] = lasso(A,yn,'CV',10);
% bestvalue = find(FitInfo.Lambda == FitInfo.LambdaMinMSE);
% XE(:,:,i) = [x xe xl(:,bestvalue)];
% fprintf('LASSO RE = %d\n',norm(x-xl(:,bestvalue))/norm(x));
end
close all; replot(XE);
ccplot(XE);
%% data 2
A2 = cell2mat(struct2cell(load('/Users/yushu/Documents/0ECGI/nonNegative_TMP/forward_matrix.mat')));
y2 = cell2mat(struct2cell(load('/Users/yushu/Documents/0ECGI/nonNegative_TMP/ECG.mat')));
x2 = cell2mat(struct2cell(load('/Users/yushu/Documents/0ECGI/nonNegative_TMP/true_Tmp.mat')));
% A2,y2,x2这一组数据不匹配？