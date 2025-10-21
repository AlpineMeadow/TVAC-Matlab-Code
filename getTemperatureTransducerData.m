function thermoData = getTemperatureTransducerData(handles, fig, ThermoDAQ, ...
    startHourStr, startMinuteStr, startSecondStr, timeRemaining, ...
    hoursSecondsFlag, numHours, stopFlag)

%This function is called by getTVACStartButton.m  

%Set up some persistent variables.
persistent thermo1
persistent thermo2
persistent thermo3
persistent thermo4
    
%Pull the params vector out of the handles structure.
params = handles.params;

%Lets make the parameters more understandable.
VToT1Slope = params(1);  %Units are in Celcius/Volt.
VToT1Intercept = params(2);  %Units are in Celcius.
VToT2Slope = params(3);  %Units are in Celcius/Volt.
VToT2Intercept = params(4);  %Units are in Celcius.
VToT3Slope = params(5);  %Units are in Celcius/Volt.
VToT3Intercept = params(6);  %Units are in Celcius.
VToT4Slope = params(7);  %Units are in Celcius/Volt.
VToT4Intercept = params(8);  %Units are in Celcius.

sampleRate = params(9); %Units are in samples per second.
%numSecondsToCollectData = params(10);

%Set the data rate using the number of points divided by the sweep
%duration.
ThermoDAQ.s.Rate = sampleRate;

%Read the data from the DAQ.  The outputs are data = actual data
%read in from the device.
[data, ~, ~] = read(ThermoDAQ.s, ThermoDAQ.s.ScansAvailableFcnCount,  'OutputFormat', 'Matrix');
    
%Since the data and time vectors are written as the same voltage value twice we will
%extract every other value.
voltage1 = data(:, 1);
voltage2 = data(:, 2);
voltage3 = data(:, 3);
voltage4 = data(:, 4);
   
%Now convert from voltage to temperature by multiplying by the
%conversion factor and find the mean.
averageTemp1 = VToT1Slope*mean(voltage1) + VToT1Intercept;
averageTemp2 = VToT2Slope*mean(voltage2) + VToT2Intercept;
averageTemp3 = VToT3Slope*mean(voltage3) + VToT3Intercept;
averageTemp4 = VToT4Slope*mean(voltage4) + VToT4Intercept;

%I want to send all of the thermo data out of this function so I am going
%to put all the variables into a structure for ease of parameter passing.
thermoData.averageTemp1 = averageTemp1;
thermoData.averageTemp2 = averageTemp2;
thermoData.averageTemp3 = averageTemp3;
thermoData.averageTemp4 = averageTemp4;

%Make some strings of the temperature.
averageTemp1Str = sprintf('Average Temperature : %6.2f C', averageTemp1);
averageTemp2Str = sprintf('Average Temperature : %6.2f C', averageTemp2);
averageTemp3Str = sprintf('Average Temperature : %6.2f C', averageTemp3);
averageTemp4Str = sprintf('Average Temperature : %6.2f C', averageTemp4);

thermoData.averageTemp1Str = averageTemp1Str;
thermoData.averageTemp2Str = averageTemp2Str;
thermoData.averageTemp3Str = averageTemp3Str;
thermoData.averageTemp4Str = averageTemp4Str;

%Concatinate the thermo values.  This is essentially a running average.
thermo1 = vertcat(thermo1, averageTemp1);
thermo2 = vertcat(thermo2, averageTemp2);
thermo3 = vertcat(thermo3, averageTemp3);
thermo4 = vertcat(thermo4, averageTemp4);

thermoData.thermo1 = thermo1;
thermoData.thermo2 = thermo2;
thermoData.thermo3 = thermo3;
thermoData.thermo4 = thermo4;


%Make plots of the outputs from the ESA.
generateTVACPlots(fig, thermoData, timeRemaining, hoursSecondsFlag, ...
    numHours, stopFlag);    
    
saveTVACData(handles, startHourStr, startMinuteStr, startSecondStr, thermoData, stopFlag);
   
end  %End of the function getTemperatureTransducerData.m

    
