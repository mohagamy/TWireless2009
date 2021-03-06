% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Collaborative beamforming for
% wireless sensor networks with Gaussian distributed sensor nodes," IEEE
% Trans. Wireless Communications, vol. 8, no. 2, pp.638-643, Feb. 2009.
% Fig 3: The variance of X and Y for both uniform and Gaussian spatial
% distributions: N = 16, sigma^2 = 1, R = 3 sigma.
%
%
%
% N : Number of sensor nodes.
% R : Cluster radius.
% V : Vairiance of the Gaussian spatial distribution corresponding to
% cluster radius R.
% phi : The azimuth angle.
% alpha : Defined for Uniform and Gaussian spatial distributions.
% var_x : The variance of the real part X of the array factor level at a given
% angle phi, defined for Uniform and Gaussian spatial distributions.
% var_y : The variance of the imaginary part Y of the array factor level at a
% given angle phi, defined for Uniform and Gaussian spatial distributions.



clc;clear;

V = 1;
N = 16;

phi = 0:.01:pi*(50/180);
R = 3*sqrt(V);
alpha_u = 4*pi*R*sin(phi/2);
alpha_g = 4*pi*sin(phi/2);


var_x_u = 0.5*(1+(besselj(1,2*alpha_u)./alpha_u))-(2*(besselj(1,alpha_u)./alpha_u)).^2;
var_y_u = 0.5*(1-(besselj(1,2*alpha_u)./alpha_u));


var_x_g = (1/2)*(1+ exp(-((2*alpha_g).^2)*V/2) )-(1/1)*(exp(-(alpha_g.^2)*V/2)).^2;
var_y_g = (1/2)*(1- exp(-((2*alpha_g).^2)*V/2) );


%   - - - Ploting the figure - - -

%% Create figure
figure1 = figure;

%% Create axes
axes1 = axes(...
    'FontName','Times New Roman',...
    'FontSize',30,...
    'YTick',[0 0.1 0.2 0.3 0.4 0.5 0.6],...
    'Parent',figure1);
ylim(axes1,[0 0.6]);
xlabel(axes1,'Angle \phi [degree]');
ylabel(axes1,'Variance');
grid(axes1,'on');
hold(axes1,'all');

%% Create plot
plot1 = plot(...
    phi*180/pi,var_y_u,...
    'Color','b',...
    'LineStyle','-.',...
    'LineWidth',2,...
    'Parent',axes1,...
    'DisplayName','Uniform');

%% Create plot
plot2 = plot(...
    phi*180/pi,var_y_g,...
    'LineWidth',2,...
    'Color','r',...
    'Parent',axes1,...
    'DisplayName','Gaussian');

%% Create plot
plot3 = plot(...
    phi*180/pi,var_x_u,...
    'LineStyle','-.',...
    'LineWidth',2,...
    'Color','b',...
    'Parent',axes1);

%% Create plot
plot4 = plot(...
    phi*180/pi,var_x_g,...
    'Color','r',...
    'LineWidth',2,...
    'Parent',axes1);

%% Create legend
legend1 = legend(...
    axes1,{'Uniform','Gaussian'},...
    'FontName','Times New Roman',...
    'FontSize',30,...
    'Location','SouthEast');

%% Create textbox
annotation1 = annotation(...
    figure1,'textbox',...
    'Position',[0.1848 0.5375 0.07031 0.1231],...
    'LineStyle','none',...
    'FitHeightToText','off',...
    'FontName','Times New Roman',...
    'FontSize',30,...
    'String',{'{\sigma_x}^2'});

%% Create textbox
annotation2 = annotation(...
    figure1,'textbox',...
    'Position',[0.2313 0.3008 0.07031 0.1231],...
    'LineStyle','none',...
    'FitHeightToText','off',...
    'FontName','Times New Roman',...
    'FontSize',30,...
    'String',{'{\sigma_y}^2'});
