function ccplot_Multitime(X,t,dataset)
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
        cc_error(j,i) = 0.15*X(j).varianceCC(1,i);
    end
end
%figure
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
p(3).FaceColor = 'r';
p(4).FaceColor = '#0000FF';
%p(4).FaceColor = 'r';
set(gca,'FontSize', 16,'YLim',[0 1.0]);
%ax = gca;
%ax.FontWeight = 'bold';
xticks([1 2 3 4 5]);
xticklabels({'1.0','0.8','0.6','0.4','0.2'});
ylabel('$\rho$','FontSize', 30,'Rotation',0,'Units', 'Normalized', 'Position', [-0.17, 0.5, 0],'interpreter','latex');
if dataset == 1
    set(gca, 'YLim',[0.92 1.01]);
    yticks([ 0.92 0.93 0.94 0.95 0.96 0.97 0.98 0.99 1.00 1.01]);
    yticklabels({'0.92','0.93','0.94','0.95','0.96','0.97','0.98','0.99','1.00','1.01'});
else
    set(gca, 'YLim',[0.50 1.01]);
    yticks([0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00]);
    yticklabels({'0.50','0.55','0.60','0.65','0.70','0.75','0.80','0.85','0.90','0.95','1.00'});
end
% yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3]);
% yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','1.1','1.2','1.3'});
 %xlabel('Noise'); ylabel('\rho','FontSize', 25);
%xlabel1 = xlabel('$$\frac{No.\ of\ nodes}{Total\ nodes}\times100\%$$','FontSize', 20);
% if N == 3
%     legend('Tikhonov zero','OMP with basis');
% elseif N == 4
%     legend('Tikhonov zero','TSVD','OMP with basis');
% elseif N == 5
%     legend('Tikhonov zero','TSVD','L1 regularization','OMP with basis');
% end
if t == 1
    xlabel({'Ratio (no noise)'},'FontSize', 20);
elseif t == 2

    xlabel({'Ratio (SNR = 50dB)'},'FontSize', 20);    
else
    xlabel({'Ratio (SNR = 25dB)'},'FontSize', 20);
    legend('L2','L1','TSVD','L0','Location','eastoutside','NumColumns',1,'FontSize',12);
end
%legend('Tikhonov zero','TSVD','L1 regularization','OMP with basis');
% legend('Tikhonov zero','OMP with basis','LASSO end');
