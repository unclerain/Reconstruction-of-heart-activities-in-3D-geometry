close all; clear; clc; % addpath(genpath(pwd));
temp = input('Please input the database number:');
if temp == 1
%---data 5:cond(A)=e+6----------
A = cell2mat(struct2cell(load('/Users/yshu1/Documents/transferMatrix_1_3_concentricSphere.mat')));
X = cell2mat(struct2cell(load('/Users/yshu1/Documents/p22_innerSphere.mat')));

k = 300;
X1 = X(:,1:k); X2 = X1'*X1;
nx = sqrt(diag(X2)); B = nx*nx'; corr = abs(X2./B);

%correlation map
figure; xx = 1:k; yy = xx; pcolor(xx,yy,corr);
shading interp; colorbar; colormap(jet);
xlabel('Time index $t_{\scriptscriptstyle i}$','FontSize', 20,'interpreter','latex'); ylabel('Time index $t_{\scriptscriptstyle i}$','FontSize', 20,'interpreter','latex');
%xlabel('Time point','FontSize', 25); ylabel('Time point','FontSize', 20);
hold on;
%[cs,h] = contour(xx,yy,corr,[0.9 0.7],'w--'); %adding coontour line into plot
%[cs,h] = contour(xx,yy,co2);
%clabel(cs,h,'LabelSpacing',100,'FontSize',10,'Color','k');
set(gcf, 'color', [1 1 1])
hold off;


% frequency of maximum correlation coefficient of each column
coo = corr-diag(diag(corr));
co0 = max(coo);
figure;
 set(gcf, 'color', [1 1 1]);
 histogram(co0,'Normalization','probability')
 xlabel('Correlation coefficient','FontSize', 20); ylabel('Percentage','FontSize', 20);
 set(gca, 'XLim',[0.99 1.00], 'FontSize', 16);
 
 fprintf('finding percentage of  the correlation coefficients that higher than 0.9\n  4 cycles of heart beat = %d\n',...
    sum(co0>0.99)/length(co0));
else
%---data 4:cond(A)=e+12--------------------
A = cell2mat(struct2cell(load('/Users/yshu1/Documents/ECGI/0ECGI/ED/matrix/A.mat')));
R = cell2mat(struct2cell(load('/Users/yshu1/Documents/ECGI/0ECGI/ED/matrix/R1.mat')));
Z1 = cell2mat(struct2cell(load('/Users/yshu1/Documents/ECGI/0ECGI/ED/potential/Run0017-cs.mat')));
Z1 = Z1.potvals;
Z2 = cell2mat(struct2cell(load('/Users/yshu1/Documents/ECGI/0ECGI/ED/potential/Run0018-cs.mat')));
Z2 = Z2.potvals;
Z3 = cell2mat(struct2cell(load('/Users/yshu1/Documents/ECGI/0ECGI/ED/potential/Run0019-cs.mat')));
Z3 = Z3.potvals;
Z4 = cell2mat(struct2cell(load('/Users/yshu1/Documents/ECGI/0ECGI/ED/potential/Run0020-cs.mat')));
Z4 = Z4.potvals;
Z5 = cell2mat(struct2cell(load('/Users/yshu1/Documents/ECGI/0ECGI/ED/potential/Run0021-cs.mat')));
Z5 = Z5.potvals;
l1dict = cell2mat(struct2cell(load('/Users/yshu1/Documents/L1dictionary.mat')));
%X = R*[Z2 Z3 Z4 Z5];
X = l1dict;
%--------
k = length(X);
X1 = X(:,1:k); X2 = X1'*X1;
nx = sqrt(diag(X2)); B = nx*nx'; corr = abs(X2./B);

figure; xx = 1:k; yy = xx; pcolor(xx,yy,corr);
shading interp; colorbar; colormap(jet);
%xlabel('Time point','FontSize', 20); ylabel('Time point','FontSize', 20);
hold on;
%[cs,h] = contour(xx,yy,corr,[0.9 0.7],'w--'); %adding coontour line into plot
%[cs,h] = contour(xx,yy,co2);
%clabel(cs,h,'LabelSpacing',100,'FontSize',10,'Color','k');
set(gcf, 'color', [1 1 1])
hold off;
%figure;
%surf(co2);

%----------------------------------------------show propotion
% coo = corr-diag(diag(corr));
% co0 = [max(coo(1:530, :)) max(coo(531:1107, 531:end)) max(coo(1107:1675, 1107:end)) max(coo(1676:end, 1676:end))];
% co1 = max(coo(1:530, :)); 
% co2 = max(coo(573:1138, :));
% co3 = max(coo(1138:end, :));
%  figure;
%  set(gcf, 'color', [1 1 1]);
%  histogram(co0,'Normalization','probability')
%  xlabel('Correlation coefficient','FontSize', 16); ylabel('Percentage','FontSize', 16);
%  set(gca, 'XLim',[0.7 1.01], 'FontSize', 16);
% %  subplot(1,4,1); histogram(co0,'Normalization','probability');subplot(1,4,2); histogram(co1,'Normalization','probability');subplot(1,4,3); histogram(co2,'Normalization','probability');subplot(1,4,4); histogram(co3,'Normalization','probability');
% fprintf('finding percentage of  the correlation coefficients that higher than 0.9\n (different amount of heart beat cycles used as dictionary)\n 4 cycles of heart beat = %d\n 1st cycle of heart beat = %d\n 2nd cycle of heart beat = %d\n 3rd cycle of heart bea = %d\n',...
%     sum(co0>0.9)/length(co0),sum(co1>0.9)/length(co1),sum(co2>0.9)/length(co2),sum(co3>0.9)/length(co3));
% % 
end

% N = 1000; y = ones(N,1);
% yn = awgn(y,20,'measured');
% 20*log10(norm(y)/norm(yn-y))
% snr(y,yn)
