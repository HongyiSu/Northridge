function myplot(obs_t, data_obs_d_f, syn_t, data_syn_d_f,max_obs_t,max_syn_t, station, channel)
       
     %plotting
     %fig = figure;
     % fig.Units = 'centimeters';
      %fig.Position = [0 0 30 30/1.4];%define size of the figure
     %plot observational data
     h1 = subplot(211);
     plot(obs_t,data_obs_d_f,'k','LineWidth', 1.2);
     h1_pos=get(h1,'Position'); 
     box off;
     axis off ;
     xlim([0,60]);
     %title([station ' & ' syn_list{i} ' ' char(channel) ' with butter [' num2str(m)... 
     %',' num2str(n) '] Hz, shift 3.885 s' ],'Interpreter','none');
     text(-4,min(data_obs_d_f),['\bf' '\it' station '(' char(channel) ')'],'FontSize', 10);
     %scale filtered observational data this factor written on the plot to get filtered synthetic data
     po1 = max(max_obs_t,max_syn_t); %for place the text
     text(po1,max(data_obs_d_f)*0.95,num2str((max(data_syn_d_f)/max(data_obs_d_f))), 'FontSize', 16);
    


     %now plot synthetic data
     h2 = subplot(212);
     plot(syn_t-3.885,data_syn_d_f,'r','LineWidth', 1.2); %shifted 3.885 second based on obre EW
     xlim([0,60])
     h2_pos=get(h2,'Position'); 
     box off
     axis off ;
     set(gcf,'color','w');
     set(h2,'Position',[h1_pos(1) h1_pos(2)+h1_pos(4)-0.65 h2_pos(3:end)]);
end
   