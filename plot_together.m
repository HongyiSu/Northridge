%Hongyi Su, M.Sc. candidate at LMU @ TUM 
%Supervisors: Taufiqurrahman taufiqurrahman, Alice-Agnes Gabriel

clc;
close all;
clear all;

if(isdir([pwd '/figure_new']))
    disp(['directory exists!'])
else
    mkdir([pwd '/figure_new' ])
    disp(['create a new directory: ' pwd '/figure_new'])
end

TT = importdata([pwd '/doc/report_2.0.txt']);
syn_list = TT.textdata(:,1); % extract synetic name list 
syn_list = syn_list(3:end); % skip headline
obs_list = TT.textdata(:,2); % extract synetic name list 
obs_list = obs_list(3:end); % skip headline
%%
%plot obs/syn waveform 
close all

list_5 = [42, 69, 77, 85, 119]; %select stations here, refer to doc/report_2.0.txt, f.ex. scse = 1
%obre = 69, seal = 119, sndb = 85, vasq = 42, anav = 77;
channel_3 = ["NS", "EW", "Vertical"];
syn = 'syn_3D'; % {other possible input: syn_1D_rock, syn_1D_soil}

%loop over the five seleted stations and plot them
%plotting
%fig = figure;
%fig.Units = 'centimeters';
%fig.Position = [0 0 30 30/1.4];%define size of the figure

count =0;
for(j=1:length(list_5))
   for(k=1:length(channel_3))

   i =list_5(j);
   channel = channel_3(k);
  
   station = obs_list{i};
         
   [data_obs data_syn obs_t syn_t fs_obs fs_syn max_syn_t max_obs_t] = fetch_data(obs_list{i},syn_list{i}, channel, syn);
   data_obs = data_obs/100; % in this specific study, unit conversion from cm>m

   m=0.001; %define low cut
   n=0.5; %define high cut
  
    
   [data_obs_d_f,data_syn_d_f]=filter_mydata(data_obs, data_syn, m, n);

   count=count+1;
   subfigure(5,3,count)
   myplot(obs_t, data_obs_d_f, syn_t, data_syn_d_f,max_obs_t, max_syn_t, station, channel);
   end
end

%%
close all
%plot obs/syn spectrum

fig = figure;
fig.Units = "centimeters";
fig.Position = [0 0 40/1.4 40];

list_5 = [42, 69, 77, 85, 119];

channel_3 = ["NS", "EW", "Vertical"];
syn = 'syn_3D';
count =0;
for(j=1:length(list_5))
    for(k=1:length(channel_3))
        
     i =list_5(j);
     channel = channel_3(k);
     station = obs_list{i}; % for title of the figure  

     [data_obs data_syn obs_t syn_t fs_obs fs_syn max_syn_t max_obs_t] = fetch_data(obs_list{i},syn_list{i}, channel, syn);
    
     %filtering
     m=0.001;
     n=0.5;
     [data_obs_d_f,data_syn_d_f]=filter_mydata(data_obs, data_syn, m, n);
 
     count=count+1;
     subplot(5,3,count)

     myspectrum(data_syn_d_f,data_obs_d_f, station, channel,fs_syn,fs_obs,j,k)

    %saveas(fig,[pwd '/figure_new/' station '_spectrum_' syn],'jpg')
  
    end
end
saveas(fig,[pwd '/figure_new/' station '_spectrum_' syn],'jpg')



