function generateTVACPlots(fig, thermoData, timeRemaining, hoursSecondsFlag, ...
    numHours, stopFlag)    
        
%This function is called by getTemperatureTransducerData.m

if strcmp(hoursSecondsFlag, 'Hours')
    xLabel = 'Time (Hours)';
    time = (1:length(thermoData.thermo1))/3600;
    modValue = 600;
end

if strcmp(hoursSecondsFlag, 'Seconds')
    xLabel = 'Time (Seconds)';
    time = 1 : length(thermoData.thermo1);
    modValue = 10;
end

subplot(1, 3, 1)
plot(time, thermoData.thermo1)
title({'Cuvette Temperature', 'Versus Time'})
xlabel(xLabel)
ylabel('Temperature (\circC)')
text('Units', 'Normalized', 'Position', [0.1 0.1], 'String', thermoData.averageTemp1Str)

subplot(1, 3, 2)
plot(time, thermoData.thermo3)
title({'Platen Temperature',  'Versus Time'})
xlabel(xLabel)
ylabel('Temperature (\circC)')
text('Units', 'Normalized', 'Position', [0.1 0.1], 'String', thermoData.averageTemp3Str)
    
subplot(1, 3, 3)
plot(time, thermoData.thermo4)
title({'Greenhouse Temperature', 'Versus Time'})
xlabel(xLabel)
ylabel('Temperature (\circC)')
text('Units', 'Normalized', 'Position', [0.1 0.1], 'String', thermoData.averageTemp4Str)
    
%Write the plot to a file
        
%Set up a plotting directory.
plotPath = "C:\Users\SPARC TVAC\TVAC\Plots\";
absolutePlotPath = makeAbsoluteDirectory(plotPath);

%Set up some save figure parameters.
set(gcf, 'PaperOrientation', 'landscape');

%Set up a plot file name.
plotFileName = strcat(absolutePlotPath, '\', 'Temperature', datestr(now, 'HH-MM-SS'), '.pdf');

%Only save the plot if we are at the last time interval.
hoursList = numHours/4*[1, 2, 3, 4];
hourListCounter = 1;
if (mod(timeRemaining/3600, hoursList(hourListCounter)) == 0)
    saveas(fig, plotFileName);
    hourListCounter = hourListCounter + 1;
end

%Lets handle the case when the time remaining is just equal to one.
if (timeRemaining == 1)
    saveas(fig, plotFileName);
end

%Let's handle the case when the user hits the stop button.  We also will
%handle the case when there is only one second left in the countdown.
if (stopFlag == 1)
    saveas(fig, plotFileName);
end

end  %End of the function definition generateThermoPlots.m