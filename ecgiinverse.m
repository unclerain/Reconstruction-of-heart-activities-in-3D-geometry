% X: training data
function xe = ecgiinverse(A,y,x_bench,X,D,temp,dB,Dict)
%---Least square method----------------------------------------------------
% x_least = A\y;
% fprintf('Least RE = %d\n',norm(x_least-x_bench)/norm(x_bench));
%---Tikhonov zero order method---------------------------------------------
[U,s,V] = csvd(A);
[lambda0,~,~,~] = l_curve(U,s,y);
x_tikh0 = tikhonov(U,s,V,y,lambda0);

obj_ex = norm(y-A*x_bench).^2+lambda0.^2*norm(x_bench).^2;
obj_est = norm(y-A*x_tikh0).^2+lambda0.^2*norm(x_tikh0).^2;
fprintf('Tik_0 RE = %d, lambda = %d, object exact vs est = %d vs %d \n',...
    norm(x_tikh0-x_bench)/norm(x_bench),lambda0,obj_ex,obj_est);
% x_tikh22 = tikhonov2(A,y,lambda,0);
% fprintf('Tikhonov 02 RE = %d, lambda = %d\n',...
%     norm(x_tikh22-x_bench)/norm(x_bench),lambda);
%---Tikhonov first order method--------------------------------------------
n = size(A,2); L = [zeros(n-1,1) eye(n-1)]-[eye(n-1) zeros(n-1,1)];

% [U,sm,V,~,~] = cgsvd(A,L);
% lambda = l_curve(U,sm,y);
% x_tikh1 = tikhonov(U,sm,V,y,lambda); 
% fprintf('Tik_1 RE = %d, lambda = %d\n',...
%     norm(x_tikh1-x_bench)/norm(x_bench),lambda);
%-----------------
% x_tikh33 = tikhonov2(A,y,lambda,1);
% fprintf('Tikhonov 03 RE = %d, lambda = %d\n',...
%     norm(x_tikh33-x_bench)/norm(x_bench),lambda);
%---L1 regularization method-----------------------------------------------
%x_l1reg = l1reg(A,y,L,lambda0);
L = D;
x_l1reg = l1reg(A,y,L,lambda0,temp,dB);
obj_exL1 = norm(y-A*x_bench).^2+lambda0.^2*norm(D*x_bench,1);
obj_estL1 = norm(y-A*x_l1reg).^2+lambda0.^2*norm(D*x_l1reg,1);
firstL1 = norm(y-A*x_l1reg).^2;
secondL1 = norm(D*x_l1reg,1);
fprintf('L1 regularization RE = %d, lambda = %d, object exact vs est = %d vs %d, first = %d, second = %d \n',...
    norm(x_l1reg-x_bench)/norm(x_bench),lambda0,obj_exL1,obj_estL1,firstL1,secondL1);
%---truncated sigular value decompositon-----------------------------------
k = 15;
x_trsvd = trsvd(A,y,k);
fprintf('TSVD RE = %d, k = %d\n',...
    norm(x_trsvd-x_bench)/norm(x_bench),k);
%---truncated total least square-------------------------------------------
% something is wrong?
% sigma = 1e-7;
% x_ttls = ttls(A,y,sigma);
% fprintf('TTLS RE = %d, k = %d\n',...
%     norm(x_ttls-x_bench)/norm(x_bench),k);
%---OMP with basis U-------------------------------------------------------
% tol = 1e-10; vtol = 1e-3;
% [U,~,~] = svd(X);
% [z_omp,~] = omp(A*U,y,tol,vtol,x_bench,U);
% x_omp_basisU = U*z_omp;
% fprintf('OMP with basis U RE = %d \n',...
%     norm(x_omp_basisU-x_bench)/norm(x_bench));
%---OMP with basis X-------------------------------------------------------
%if ratio == 1
%-----------------k5n2000
%     if dB == 1
%         tol = 1e-12;
%         vtol = 7e-6;
%     elseif dB == 2
%         tol = 1e-9;
%         vtol = 7e-3;
%     elseif dB == 3
%         tol = 1e-8;
%         vtol = 8e-3;
%     elseif dB == 4
%         tol = 1e-9;
%         vtol = 8e-3;
%     else
%         tol = 1e-9; 
%         vtol = 8e-3;
%     end
% %-----------------k3n2000    
%         if dB == 1
%  
%         tol = 1e-12;
%         vtol = 7e-6;
%     elseif dB == 2
%         tol = 1e-10;
%         vtol = 7e-3;
%     elseif dB == 3
%         tol = 1e-9;
%         vtol = 8e-3;
%     elseif dB == 4
%         tol = 1e-8;
%         vtol = 8e-3;
%     else
%         tol = 1e-8; 
%         vtol = 8e-3;
%         end
%-----------------L1k3n1000    
        if dB == 1
 
        tol = 2.152391e-07;
        vtol = 7e-8;
    elseif dB == 2
        tol = 9e-2;
        vtol = 6e-3;
    elseif dB == 3
        tol = 9e-3;
        vtol = 8e-3;
    elseif dB == 4
        tol = 3e-2;
        vtol = 8e-3;
    else
        tol = 9e-1; 
        vtol = 8e-3;
        end

%elseif ratio == 2
[z_omp,itr,zz,yyy] = omp(A*Dict,y,tol,vtol);
x_omp_basisX = Dict*z_omp;
obj_exL0 = norm(y-A*x_bench).^2+lambda0.^2*norm(x_bench).^2;
obj_estL0 = norm(y-A*x_omp_basisX).^2+lambda0.^2*norm(D*x_omp_basisX,1);
firstL0 = norm(y-A*x_omp_basisX).^2;
secondL0 = norm(D*x_omp_basisX,1);
fprintf('OMP X RE = %d, iter = %d, breaknumber = %d, breaknumber2 = %d, object exact vs est = %d vs %d, first = %d, second = %d \n',...
    norm(x_omp_basisX-x_bench)/norm(x_bench),itr,zz,yyy,obj_exL0,obj_estL0,firstL0,secondL0);
%---Output-----------------------------------------------------------------
%xe = [x_least x_tikh0 x_tikh1 x_omp_basisU x_omp_basisX];
%xe = [x_tikh0 x_tikh1 x_omp_basisX];
%xe = [x_tikh0 x_tikh1 x_l1reg x_omp_basisX];
%xe = [x_tikh0 x_trsvd x_ttls x_omp_basisX];
xe = [x_tikh0 x_l1reg x_trsvd x_omp_basisX ];