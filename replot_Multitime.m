function replot_Multitime(X,t,dataset)
% plot the relative error
[N,P] = size(X);
% re = zeros(P,4);
% re_error = zeros(P,4);
re = zeros(P,3);
re_error = zeros(P,3);
for i = 1:4
    for j = 1:P
        re(j,i) = X(j).averageRE(1,i);
    end
end
for i = 1:4
    for j = 1:P
        re_error(j,i) = 0.1*X(j).varianceRE(1,i);
    end
end

%figure;
p = errorbar(re,re_error,'-s','MarkerFaceColor','k','MarkerSize',2,'MarkerEdgeColor','k','LineWidth',2.5,'CapSize',12);
p(1).Color = '#2E8B57';
p(2).Color = '#800080';
p(3).Color = 'r';
p(4).Color = '#0000FF';
%p(4).Color = 'r';

%set(gca, 'YScale', 'log')
% ax = gca;
% ax.YLabel.FontSize = 18;
%set(gca, 'YLim',[-0.1 0.4], 'FontSize', 16);
set(gca, 'YLim',[-0.1 0.7], 'FontSize', 16);
% yticks([-0.1 0 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]);
% yticklabels({'0','0.01','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'});
% yticks([-0.1 0 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8]);
% yticklabels({'0','0.01','0.4','0.45','0.5','0.55','0.6','0.65','0.7','0.75','0.8'});

%xlabel1 = xlabel('$$\frac{No.\ of\ nodes}{Total\ nodes}\times100\%$$','FontSize', 20);
 %ylabel('\epsilon','FontSize', 25);
% if N == 3
%     legend('Tikhonov zero','OMP with basis');
% elseif N == 4
%     legend('Tikhonov zero','TSVD','OMP with basis');
% elseif N == 5
%     legend('Tikhonov zero','TSVD','L1 regularization','OMP with basis');
% end
if dataset == 1
    set(gca, 'YLim',[-0.1 0.5],'FontSize', 14);
    yticks([-0.1 -0.05 0 0.1 0.2 0.3 0.4 0.5]);
    yticklabels({'','0','0.01','0.1','0.2','0.3','0.4','0.5'});
else
    set(gca, 'YLim',[-0.1 0.8],'FontSize', 14);
    yticks([-0.1 -0.05 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8]);
    yticklabels({'','0','0.01','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8'});
end
ax = gca;
ax.YLabel.FontSize = 18;
xticks([1 2 3 4 5]);
xticklabels({'1.0','0.8','0.6','0.4','0.2'});
ylabel('$\varepsilon$','FontSize', 30,'Rotation',0,'Units', 'Normalized', 'Position', [-0.15, 0.5, 0],'interpreter','latex');
%xlabel('Noise');
if t == 1
    xlabel({'Ratio (no noise)'},'FontSize', 20);
%     yticks([-0.1 -0.05 0 0.05 0.1 0.15 0.20 0.25 0.3 0.35]);
% yticklabels({'','0','0.01','0.05','0.21','0.15','0.20','0.25','0.3','0.35'});

elseif t == 2
    xlabel({'Ratio (SNR = 50dB)'},'FontSize', 20);
   
    % yticks([-0.1 -0.05 0 0.05 0.1 0.15 0.20 0.25 0.3 0.35]);
    % yticklabels({'','0','0.01','0.05','0.1','0.15','0.20','0.25','0.3','0.35'});
%    legend('Tikhonov zero','TSVD','L1','L0','Location','northoutside','NumColumns',4,'FontSize',10);
else
    xlabel({'Ratio (SNR = 25dB)'},'FontSize', 20);
    legend('L2','L1','TSVD','L0','Location','eastoutside','NumColumns',1,'FontSize',12);
%     yticks([-0.1 -0.05 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7]);
%     yticklabels({'','0','0.01','0.1','0.2','0.3','0.4','0.5','0.6','0.7'});
end

% legend('Tikhonov zero','OMP with basis','LASSO end');
