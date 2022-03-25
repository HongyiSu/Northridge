close all
clear all

T = importdata('rec61_xyz_2miomesh.dat');

T_x = T(:,1);
T_y = T(:,2);

fig = figure;

fig.Units = 'centimeters';
fig.Position = [0 0 60 60/1.6];  %golden ratio
subplot(311)
for i=1:length(T)
    h3 = plot(T_x(i),T_y(i),'r*','DisplayName', 'seissol output');
    text(T_x(i),T_y(i),string(i));
    hold on
end
legend([h3]);
%%
addpath deg2utm/
TT = importdata('report_2.0.txt');
abc=TT.data; 
sta_list = TT.textdata(:,2);
sta_list = sta_list(3:end);
dist2fault = abc(:,3);

%report_2.0.txt

TT_lon = abc(:,1);
TT_lat = abc(:,2);
TT_x = [];
TT_y = [];
for j=1:length(abc)
    [TT_x(j) TT_y(j) ~]=deg2utm(TT_lat(j),TT_lon(j)); 
end
fig = figure;
fig.Units = 'centimeters';
fig.Position = [0 0 60 60/1.6]; 

for i=1:length(TT_x)
    h4 = plot(TT_x(i),TT_y(i),'Color','g','DisplayName', 'observational',...
        'Marker','.', 'MarkerSize',dist2fault(i));
    text(TT_x(i),TT_y(i),sta_list(i));
    hold on
end
%obre 69; seal 119; sndb 85; vasq 42; anav 77
list_5 = [69 119 85 42 77];
for(i=1:length(list_5))
    plot(TT_x(list_5(i)),TT_y(list_5(i)),'Color','r','DisplayName', 'observational',...
        'Marker','o', 'MarkerSize',dist2fault(list_5(i)));
end
 text(TT_x(121)*1.004,TT_y(121)*0.999,'71.5km [for reference]');
%%
 subplot(313)
 
%fig = figure;
%fig.Units = 'centimeters';
%fig.Position = [0 0 100 100/1.6];  %golden ratio
 


for i=1:length(T)
    h1 = plot(T_x(i),T_y(i),'r*', 'DisplayName', 'seissol output');
    %h2 = plot(TT_x(i),TT_y(i),'bo','DisplayName', 'observational' );
    %b = convertStringsToChars(string(TT.textdata(i+1,1)));
    text(T_x(i),T_y(i),string(i));
    hold on
end

for i=1:length(TT_x)

    h2 = plot(TT_x(i),TT_y(i),'bo','DisplayName', 'observational' );
    b = convertStringsToChars(string(TT.textdata(i+1,1)));
    text(TT_x(i),TT_y(i),b(1:4));
    hold on
end
legend([h1 h2]);

    %print -dpdf myfigure.pdf
    %print -depsc2 myfigure.eps
    
    
    %%
for i=2:length(TT.textdata)
   b(i) = convertStringsToChars(string(TT.textdata(i,1)))
end
strmatch("smch.bbp",b)