close all; clear; clc;


% a = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/torso-geom_771nodes.mat')));
c = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/heart-geom_337.mat')));

%import simulated 2048 AF mesh
cc = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/atria.mat')));
%import 2d vs 3d mesh
mesh = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/DATA/anatomy_ID-00.mat')));
%import simulated 2048 AF ECG signal
d = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/ECG_LA_fibrotic.mat')));
AAA = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/Inverse_Transform.mat')));
 

%import simulated 2048 normal ECG signal
%    ddd = cell2mat(struct2cell(load('/Users/yushu/Documents/0ECGI/ED/potential/Valsim_normal_tissue/EGM_RA_normal.mat')));
       ddd = cell2mat(struct2cell(load('/Users/yushu/Documents/0ECGI/ED/potential/Valsim_normal_tissue/EGM_LA_normal.mat')));
%import 2d vs 3d potential
potential_mesh = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/DATA/phase_ID-00.mat')));
% ddd = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/ECG_LA_normal.mat')));
AAAA = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/Inverse_Transform.mat')));
 
%%337 transfer matrix
A = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/matrix/A.mat')));
R = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/matrix/R1.mat')));
    
%import patient AF signal
dd = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/ECG_AV_block.mat')));
AA = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/Inverse_Transform2.mat')));
%import patient AF mesh
ccc = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/hearttorsogeometry/atria2.mat')));

%import 771 potentials    
Z1 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0017-cs.mat')));
    Z1 = Z1.potvals;
    Z2 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0018-cs.mat')));
    Z2 = Z2.potvals;
    Z3 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0019-cs.mat')));
    Z3 = Z3.potvals;
    Z4 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0020-cs.mat')));
    Z4 = Z4.potvals;
    Z5 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0021-cs.mat')));
    Z5 = Z5.potvals;
    Z6 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0028-cs.mat')));
    Z6 = Z6.potvals;
    Z7 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0039-cs.mat')));
    Z7 = Z7.potvals;
    Z8 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0050-cs.mat')));
    Z8 = Z8.potvals;
    Z9 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0022-cs.mat')));
    Z9 = Z9.potvals;
    Z10 = cell2mat(struct2cell(load('/Users/yushu/Documents/ECGI/0ECGI/ED/potential/Run0023-cs.mat')));
    Z10 = Z10.potvals;
% c = cell2mat(struct2cell(load('/Users/wdan/Documents/0ECGI/hearttorsogeometry/heart-geom_257.mat')));

% Y = cell2mat(struct2cell(load('/Users/danwei/Documents/MATLAB/0ECGI/Data/bodypots.mat')));
% A = cell2mat(struct2cell(load('/Users/danwei/Documents/MATLAB/0ECGI/Data/sciruntransfermatrix.mat')));
% X = cell2mat(struct2cell(load('/Users/danwei/Documents/MATLAB/0ECGI/Data/heartpots.mat')));

% node_a = a.node'; face_a = a.face';
node_c = c.node'; face_c = c.face';
node_cc = cc.node; face_cc = cc.face;
node_mesh = mesh.Object2; face_mesh = mesh.Polygons2;
node_ccc = ccc.node; face_ccc = ccc.face;
% field_c = c.field; fieldface_c = c.fieldface;
direction1 = [1 0 0];%x-axis direction
 
 
% %337
 %potentialmap=R*Z5;
 
% 2048 AF
potentialmap=ddd.potvals;
potentialmap2=potential_mesh;
% potentialmap = AAA*potentialmap;
% 2048
 trep=triangulation(face_cc,node_cc);
trep2=triangulation(face_mesh,node_mesh);
% % 2048 normal
% potentialmap=ddd.potvals;
% potentialmap = AAAA*potentialmap;
% % 2048
%  trep=triangulation(face_cc,node_cc);
% % patient 1 af
% potentialmap=dd.potvals;
% potentialmap = AA*potentialmap;
% %patient 1 af
% trep=triangulation(face_ccc,node_ccc);
% %337
% heart3D = trisurf(face_c,node_c(:,1),node_c(:,2),node_c(:,3),potentialmap(:,114)');


 

figure(1)
subplot(2,3,1);
 %2048,patient1 
heart3D = trisurf(trep,potentialmap(:,61),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
%colorbar('vert');


% rotate(heart3D,direction1,-90);%x-axis 180 degree
%shading interp;
colormap(jet);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ztick',[]);
set(gca,'zticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
set(gca,'XColor', 'none','YColor','none','ZColor','none');

subplot(2,3,2);
heart3D_2 = trisurf(trep,potentialmap(:,68),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
%colorbar('vert')
subplot(2,3,3);
heart3D_3 = trisurf(trep,potentialmap(:,2000),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
subplot(2,3,4);
heart3D_4 = trisurf(trep,potentialmap(:,69),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
subplot(2,3,5);
heart3D_5 = trisurf(trep,potentialmap(:,70),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
subplot(2,3,6);
heart3D_6 = trisurf(trep,potentialmap(:,90),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;

% colordata = mapminmax(potentialmap(:,29)',0,1);
% colors = transfer_datacolor(colordata');
% obj_write_col('heartwithColor29.obj',node_cc',face_cc',colors' );

figure(2)
 %2048,patient1 
heart3D = trisurf(trep,potentialmap(:,500),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
%colorbar('vert');


% rotate(heart3D,direction1,-90);%x-axis 180 degree
%shading interp;
colormap(jet);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ztick',[]);
set(gca,'zticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
set(gca,'XColor', 'none','YColor','none','ZColor','none');

figure(3)
 %2048,patient1 
heart3D = trisurf(trep,potentialmap(:,500),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
%colorbar('vert');


% rotate(heart3D,direction1,-90);%x-axis 180 degree
%shading interp;
colormap(jet);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ztick',[]);
set(gca,'zticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
set(gca,'XColor', 'none','YColor','none','ZColor','none');

figure(4)
 %2048,patient1 
heart3D = trisurf(trep,potentialmap(:,501),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
%colorbar('vert');


% rotate(heart3D,direction1,-90);%x-axis 180 degree
%shading interp;
colormap(jet);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ztick',[]);
set(gca,'zticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
set(gca,'XColor', 'none','YColor','none','ZColor','none');

figure(5)
 %2048,patient1 
heart3D = trisurf(trep,potentialmap(:,502),'edgecolor','interp','FaceColor','interp');
 caxis([min(potentialmap(:,1)) max(potentialmap(:,1))]);...  
 axis square;brighten(-0.1);axis off;
%colorbar('vert');


% rotate(heart3D,direction1,-90);%x-axis 180 degree
%shading interp;
colormap(jet);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ztick',[]);
set(gca,'zticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
set(gca,'XColor', 'none','YColor','none','ZColor','none');
figure(6)
plot(potentialmap(1,:));



