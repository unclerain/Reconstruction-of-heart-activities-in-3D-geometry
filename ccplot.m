function ccplot(X)
% plot the correlation coefficient
[M,N,P] = size(X);
cc = zeros(P,N-1);
for i = 1:N-1
    for j = 1:P
        ex = sum(X(:,1,j))/M; exest = sum(X(:,i+1,j))/M;
        xn = X(:,1,j)-ex;
        xestn = X(:,i+1,j)-exest;
        cc(j,i) = abs(xn'*xestn)/(norm(xn)*norm(xestn));
    end
end

figure;
p = bar(cc);
% p = bar(cc,'MarkerFaceColor',[0.5,0.5,0.5],'MarkerEdgeColor','k','LineWidth',2.5);
p(1).FaceColor = 'g';
p(2).FaceColor = 'k';
p(3).FaceColor = 'b';
p(4).FaceColor = 'r';
set(gca, 'FontWeight','bold','FontSize', 14);
ax = gca;
ax.YLabel.FontSize = 18;
xticks([1 2 3 4 5]);
xticklabels({'0','0.002','0.004','0.006','0.008'});
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3]);
yticklabels({'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0','1.1','1.2','1.3'});
 xlabel('Noise'); ylabel('\rho');
if N == 3
    legend('Tikhonov zero','OMP with basis');
elseif N == 4
    legend('Tikhonov zero','TSVD','OMP with basis');
elseif N == 5
    legend('Tikhonov zero','TSVD','L1 regularization','OMP with basis');
end
% legend('Tikhonov zero','OMP with basis','LASSO end');
