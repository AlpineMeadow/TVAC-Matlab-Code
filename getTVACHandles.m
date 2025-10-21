function handles = getTVACHandles(ThermoDAQ)

%Set up a vector of 12 parameters.
params = zeros(1, 12);

VtoT1Slope = 76.6;  %The slope for thermocouple 1.
VtoT1Intercept = -234.0;  %The intercept for thermocouple 1.

VtoT2Slope = 77.1;  %The slope for thermocouple 2.
VtoT2Intercept = -236.0;  %The intercept for thermocouple 2

VtoT3Slope = 77.5;  %The slope for thermocouple 3.
VtoT3Intercept = -234.0;  %The intercept for thermocouple 3.

VtoT4Slope = 76.0;  %The slope for thermocouple 4.
VtoT4Intercept = -232.0;  %The intercept for thermocouple 4.

sampleRate = 100;  %Rate is samples per second.
timeToCollectDataSeconds = 10;  %The data collection time in seconds.
timeToCollectDataMinutes = 0;  %The data collection time in minutes.
timeToCollectDataHours = 0;  %The data collection time in hours.

VtoT1SlopeIndex = 1;
params(VtoT1SlopeIndex) = VtoT1Slope;
    
VtoT1InterceptIndex = 2;
params(VtoT1InterceptIndex) = VtoT1Intercept;

VtoT2SlopeIndex = 3;
params(VtoT2SlopeIndex) = VtoT2Slope;
    
VtoT2InterceptIndex = 4;
params(VtoT2InterceptIndex) = VtoT2Intercept;
    
VtoT3SlopeIndex = 5;
params(VtoT3SlopeIndex) = VtoT3Slope;
    
VtoT3InterceptIndex = 6;
params(VtoT3InterceptIndex) = VtoT3Intercept;
    
VtoT4SlopeIndex = 7;
params(VtoT4SlopeIndex) = VtoT4Slope;
    
VtoT4InterceptIndex = 8;
params(VtoT4InterceptIndex) = VtoT4Intercept;

sampleRateIndex = 9;
params(sampleRateIndex) = sampleRate;
    
timeToCollectDataSecondsIndex = 10;
params(timeToCollectDataSecondsIndex) = timeToCollectDataSeconds;

timeToCollectDataMinutesIndex = 11;
params(timeToCollectDataMinutesIndex) = timeToCollectDataMinutes;

timeToCollectDataHoursIndex = 12;
params(timeToCollectDataHoursIndex) = timeToCollectDataHours;


%Put the param vector into the handles structure.
handles.params = params;

%Generate a user interface.
fig = uifigure;
fig.Name = "Temperature Testing";
    
figWidth = 500;
figHeight = 485;
figXPlacement = 800; %Pixels from bottom left corner.
figYPlacement = 150; %Pixels from bottom left corner

fig.Position = [figXPlacement figYPlacement figWidth figHeight];

%Generate a grid layout for the user interface.
numRows = 8;
numColumns = 5;
handles.gl = uigridlayout(fig, [numRows numColumns]);

%Set the heights and widths of the components in the user interface.
handles.gl.RowHeight = {50, 50, 50, 50, 50, 50, 50};
handles.gl.ColumnWidth = {25, 175, 75, 150, 25};

%Set up the graphical user interface components.

%Generate the label for the stage.
row = 1;
column = [2 4];
color = [0 0 0];
handles.TVACLabel = getTVACLabel(handles, "Thermo-Vacuum Data", row, column, color);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
%Generate the label for setting the sample rate.
row = 2;
column = 2;
label = 'Set Sample Rate (samples/s)';
fontSize = 16;
handles.setSampleRateLabel = getParamLabel(handles, label, row, column, fontSize);
      
%Generate the sample rate component.
row = 2;
column = 4;
handles.setSampleRate = getTVACSampleRate(handles, sampleRate, row, column, sampleRateIndex);













%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generate the label for setting the data collection time.
row = 3;
column = 2;
label = 'Set Data Collection Time (Seconds)';
fontSize = 16;
handles.setDataCollectionTimeLabel = getParamLabel(handles, label, row, column, fontSize);
      
%Generate the data collection time component.
row = 3;
column = 4;
handles.dataCollectionTimeSeconds = getTVACDataCollectionTimeSeconds(handles, timeToCollectDataSeconds, row, ...
    column, timeToCollectDataSecondsIndex);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generate the label for setting the data collection time.
% row = 4;
% column = 2;
% label = 'Set Data Collection Time (Minutes)';
% fontSize = 16;
% handles.setDataCollectionTimeLabel = getParamLabel(handles, label, row, column, fontSize);
% 
% %Generate the data collection time component.
% row = 4;
% column = 4;
% handles.dataCollectionTimeMinutes = getTVACDataCollectionTimeMinutes(handles, timeToCollectDataMinutes, row, ...
%     column, timeToCollectDataMinutesIndex);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Generate the label for setting the data collection time.
row = 4;
column = 2;
label = 'Set Data Collection Time (Hours)';
fontSize = 16;
handles.setDataCollectionTimeLabel = getParamLabel(handles, label, row, column, fontSize);
      
%Generate the data collection time component.
row = 4;
column = 4;
handles.dataCollectionTimeHours = getTVACDataCollectionTimeHours(handles, timeToCollectDataHours, row, ...
    column, timeToCollectDataHoursIndex);















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Generate the label for setting the data collection time.
row = 5;
column = 2;
label = 'Time Remaining (HH:MM:SS) ';
fontSize = 16;
handles.setTimeRemainingLabel = getParamLabel(handles, label, row, column, fontSize);

%Generate the data collection time component.
row = 5;
column = 4;
handles.getTimeRemaining = getTimeRemaining(handles, timeToCollectDataSeconds, row, column);

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
%Generate the start button component.
label = "Start";
row = 6;
column = [2 4];
handles.startButton = getTVACStartButton(handles, label, row, column, ThermoDAQ);
handles.startButton.UserData = 1;

%Generate the stop button component.
label = "Stop";
row = 7;
column = [2 4];
handles.stopButton = getTVACStopButton(handles, label, row, column);
handles.stopButton.UserData = 0;

%Generate the quit button component.
label = "Close Window";
row = 8;
column = [2 4];
handles.quitButton = getTVACQuitButton(handles, label, row, column);

%This command causes the handle structure to be stored in the application data of the
%figure object.
guidata(fig, handles);
        
end  %End of the function getThermoHandles.m


