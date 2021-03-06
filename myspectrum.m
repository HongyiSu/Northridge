function myspectrum(data_syn_d_f,data_obs_d_f, station, channel,fs_syn,fs_obs,j,k)
     ns_syn = length(data_syn_d_f);
     f_syn = fs_syn*(0:ns_syn/2)/ns_syn;%sample individual frequency
     F_syn=fft(data_syn_d_f);%perform Fourier Transformation with fft
     A_syn=abs(F_syn(1:ns_syn/2+1));%take absolute value
     ns_obs = length(data_obs_d_f);
     f_obs = fs_obs*(0:ns_obs/2)/ns_obs;
     F_obs=fft(data_obs_d_f);
     A_obs=abs(F_obs(1:ns_obs/2+1));
     loglog(f_obs,A_obs, 'r');
     ylim([10^-4 10^4]);
    
    if(j==5)
        xticks([10^-2 10^-1 10^0 10^1 10^2]);
        xlabel(['Frequency[Hz]'],'FontSize', 16,'Fontweight','bold');
    elseif(j==1)
        title([char(channel)],'FontSize', 20,'fontweight','bold');
        set(gca,'Xticklabel',[])
    else
        set(gca,'Xticklabel',[])
    end
   
    
    if(k==1)
        yticks([10^-4 10^-2 10^0 10^2 10^4]);
        ylabel([char(station)],'FontSize', 16,'fontweight','bold')
    else
       yticks([]);
       set(gca,'YColor','none')
    end

    hold on

    loglog(f_syn,A_syn, 'k');
    ylim([10^-4 10^4])
    if(j==5)
        xticks([10^-2 10^-1 10^0 10^1 10^2]);
        xlabel('Frequency[Hz]','FontSize', 16,'Fontweight','bold');
    elseif(j==1)
        title([char(channel)],'FontSize', 20,'fontweight','bold')
        set(gca,'Xticklabel',[])
    else
        set(gca,'Xticklabel',[])
    end
    if(k==1)
        yticks([10^-4 10^-2 10^0 10^2 10^4]);
        ylabel([char(station)],'FontSize', 16,'fontweight','bold')
    else
        yticks([]);
        set(gca,'YColor','none')
    end
    set(gca,'box','off')
    set(gcf,'color','w');
    grid on
    set(gca,'YGrid', 'off')
    set(gca, 'xminorgrid', 'on')
    set(gca,'MinorGridLineStyle','-')
    set(gca,'GridLineStyle','-')
end