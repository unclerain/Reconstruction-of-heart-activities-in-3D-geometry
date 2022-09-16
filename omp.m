function [x,itr] = omp(A,y,tol,vtol)
% itr is the iteration number
% if norm(y-A*x)<tol, the iteration stops
% if norm(x_new-x_old)<vtol, the iteration stops

[M,N] = size(A);

reg = sum(A.^2,1).^(1/2); % 每一列的2范数
A1 = A./(ones(M,1)*reg); % A的每一列单位化

S0 = []; % 初始指标
r = y; % 初始残差
x0 = ones(N,1); % 初始估计值

for itr = 1:N   
    
    [~,ind] = sort(abs(r'*A1),'descend'); 
    S1 = union(S0,ind(1)); % update the index set
    
    xS = A1(:,S1)\y; 
    x1 = zeros(N,1);
    x1(S1) = xS; % update x
    
    r = y-A1*x1; % update the residual
    
    inpro = abs(x1' * x0)/(norm(x1)*norm(x0)); 
    
    if (norm(r)<tol)
        break;
    end
   
    %if(sqrt(1-inpro^2)<vtol)
    if((1-inpro)<vtol)
        break;
    end
   
    S0 = S1;
    x0 = x1;
end
x = x1./reg'; 
%fprintf('iter/length = %d/%d, residual = %d, inpro = %d \n',itr,length(x),norm(y-A*x),inpro);