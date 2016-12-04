
function [V,ss,L,group_num] = evecs(A,nEvecs)

%% calculate eigenvectors, eigenvalues of the laplaican of A
%%
%%   [V,ss,L] = evecs(A,nEvecs)
%%  
%%  Input:
%%        A = Affinity matrix
%%        nEvecs = number of eigenvectors to compute
%%        
%%  Output:       
%%        V = eigenvectors
%%        ss = eigenvalues
%%        L = Laplacian
%%        group_num = number of groups as approximate by eigengap (i.e. the number of eigenvalues before the largest eigengap)
%%
%%  Code by Lihi Zelnik-Manor (2005)
%%
%%



%%%%%%%% Compute the Laplacian
tic;
npix = size(A,1);
%% useSparse = issparse(A);
useSparse = 1; %% set to always use sparse matrix solver 

fprintf(' size = %d %d \n', size(A))   %  *FS*

dd = 1./(sum(A)+eps);
dd = sqrt(dd);
if(useSparse)
    DD = sparse(1:npix,1:npix,dd);
else
    DD = diag(dd);
end
L = DD*A*DD;
ttt = toc;
% disp(['Laplacian computation took ' num2str(ttt) ' seconds']);

%%%%%% Estimate the numbers of clusters using eigengap 
maxClusterNum = 50;

%%%%%%% Compute eigenvectors
tic;
if (useSparse)
    opts.issym = 1;
    opts.isreal = 1;
    opts.disp = 0;
    [V,ss] = eigs(L, maxClusterNum, 1, opts); % Col of V are the eigenvectors
    v = diag(ss);
    [vs, is] = sort(v, 'descend');

    flag = 0;

    previous = abs(vs(2) - vs(1));
    for i=2:1:length(vs) %% initval:step:endval
        gap = abs(vs(i+1) - vs(i));
        if (gap > previous*3)
            group_num=i;
            V = V(:, 1:group_num);
            flag = 1;
            break
        end
        previous=gap;
    end
    if (flag==1)
        ss = diag(ss);
        ss = ss(1:group_num);
        return
    end
    group_num=length(vs);
    group_num
    V(:, group_num-1)
    V = V(:, 1:group_num); %% Only take the first <group_num> eigenvectors 
    ss = diag(ss);
    ss = ss(1:nEvecs);
    return

%    [V,ss] = eigs(L,nEvecs,1,opts);
%     [VV,ss]=svds(L,nClusts,1,opts);
else
    [V,ss] = svd(L);
    V = V(:,1:nEvecs);    
end
ss = diag(ss);
ss = ss(1:nEvecs);
ttt = toc;
disp(['eigenvectors computation took ' num2str(ttt) ' seconds']);




