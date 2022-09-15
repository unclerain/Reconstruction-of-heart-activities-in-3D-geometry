function ccplot_oneratioMultitime(X,dataset)
% plot the correlation coefficient
% plot the relative error
[N,P] = size(X);
cc = zeros(P,3);
cc_error = zeros(P,3);

for i = 1:4
    for j = 1:P
        cc(j,i) = X(j).averageCC(1,i);
    end
end
for i = 1:4
    for j = 1:P
        cc_error(j,i) = 0.1*X(j).varianceCC(1,i);
    end
end
figure
hold on
p = bar(cc);
% For each set of bars, find the centers of the bars, and write error bars
pause(0.1); %pause allows the figure to be created
for ib = 1:4
    %XData property is the tick labels/group centers; XOffset is the offset
    %of each distinct group
    xData = p(ib).XData+p(ib).XOffset;
    errorbar(xData,cc(:,ib),cc_error(:,ib),	'k.','CapSize',12,'LineWidth',1.5)
end   
% er.Color = [0 0 0];                            
% er.LineStyle = 'none';  
%p = bar(cc,'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor','k','LineWidth',2.5);
p(1).FaceColor = '#2E8B57';
p(2).FaceColor = '#800080';
p(3).FaceColor = '#0000FF';
p(4).FaceColor = 'r';
%p(4).FaceColor = 'r';
set(gca,'FontSize', 14);
%ax.FontWeight = 'bold';
xticks([1 2 3 4 5]);
xticklabels({'No noise','50','40','30','20'});
if dataset == 1
    set(gca, 'YLim',[0.93 1.01]);
    yticks([0.93 0.94 0.95 0.96 0.97 0.98 0.99 1.00 1.01]);
    yticklabels({'0.93','0.94','0.95','0.96','0.97','0.98','0.99','1.00','1.01'});
else
    set(gca, 'YLim',[0.55 1.01]);
    yticks([0.55 0.6 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00]);
    yticklabels({'0.55','0.60','0.65','0.70','0.75','0.80','0.85','0.90','0.95','1.00'});
end
 xlabel('SNR(dB)'); ylabel('$\rho$','FontSize', 30,'Rotation',0,'Units', 'Normalized', 'Position', [-0.13, 0.5, 0],'interpreter','latex');
%xlabel1 = xlabel('$$\frac{No.\ of\ nodes}{Total\ nodes}\times100\%$$','FontSize', 20);
% if N == 3
%     legend('Tikhonov zero','OMP with basis');
% elseif N == 4
%     legend('Tikhonov zero','TSVD','OMP with basis');
% elseif N == 5
%     legend('Tikhonov zero','TSVD','L1 regularization','OMP with basis');
% end

    legend('L2','L1','TSVD','L0','Location','northoutside','NumColumns',4,'FontSize',10);

%legend('Tikhonov zero','TSVD','L1 regularization','OMP with basis');
% legend('Tikhonov zero','OMP with basis','LASSO end');
