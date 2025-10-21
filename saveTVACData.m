function saveTVACData(handles, startHourStr, startMinuteStr, startSecondStr, ...
    thermoData, stopFlag)

%This function is called by getTemperatureTransducerData.m

%First set up the save path.
savePath = "C:\Users\SPARC TVAC\TVAC\Data\";
absoluteSavePath = makeAbsoluteDirectory(savePath);

%Generate a string containing the date.  
labDate = datestr(now, 'mm-dd-yyyy');

labTime = datestr(now, 'HH-MM-SS');
hour = str2double(labTime(1:2));
minute = str2double(labTime(4:5));
second = str2double(labTime(7:8));
%disp(['Hour : ', num2str(hour), ' Minute : ', num2str(minute), ' Second : ', num2str(second)])

%Generate a file name.
fileName = strcat(absoluteSavePath, '\', 'TemperatureValues_', labDate, '_', ...
    startHourStr, startMinuteStr, startSecondStr, '.txt');
    
%Check to see if the file exists.  If not open, if so append.
fid = fopen(fileName, 'at');
    
fprintf(fid, "%d %d %d %5.2f %5.2f %5.2f %5.2f \n", hour, minute, ...
    second, thermoData.averageTemp1, thermoData.averageTemp2, ...
    thermoData.averageTemp3, thermoData.averageTemp4);
fclose(fid);
    
clear thermo1;
clear thermo2;
clear thermo3;
clear thermo4;
    
end  %End of the function saveTVACData.m