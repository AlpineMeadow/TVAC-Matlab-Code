function startButton = getTVACStartButtonGood(handles, label, row, column, TVACDAQ)
%This function will get the handle for the start button.    
%It is called by getTVACHandles.m

startButton = uibutton(handles.gl);
startButton.Text = label;
startButton.FontWeight = "bold";
startButton.FontSize = 24;
startButton.FontColor = [0 0 0];
startButton.Layout.Row = row;
startButton.Layout.Column = column;
startButton.BackgroundColor = [0 1 0];
startButton.ButtonPushedFcn = {@startLoopingInputSignal, TVACDAQ};
                                                                           
end %End of the function getTVACStartButton.m


function startLoopingInputSignal(src, ~, TVACDAQ)
%This function will run the loop that sends the data to the daq.
%This function is called by getTVACStartButton.m

%Allow matlab to pause.
pause('on')
  
%Set up a pause so that the computer keeps proper wall clock time.
%I found this value by choosing n = 0.15 and n = 0.35 and
%interpolating so that computer time and wall clock time coincided.
%This value is pretty close to correct and changing it will cause the
%two times to be different.
%    n = 0.21;  %Number of seconds to pause between while loop iterations.
n = 0.5;  %Number of seconds to pause between while loop iterations.
n = 0.73;
n = 0.0;

%Generate a figure handle.  This figure will be the one that plots out the
%temperature data.
fig = figure('Visible', 'off');
figWidth = 1200;
figHeight = 425;
figXPlacement = 100; %Pixels from bottom left corner.
figYPlacement = 40; %Pixels from bottom left corner
fig.Position = [figXPlacement figYPlacement figWidth figHeight];

%Set up a timer object.
labTime = datestr(now, 'HH-MM-SS');
startHourStr = labTime(1:2);
startMinuteStr = labTime(4:5);
startSecondStr = labTime(7:8);
            
%Set up a counter that holds the length of time the program is running.
timeRunning = 0;

True = 1;
while True
        
    %Get the data out of the application data of the figure object.
    handles = guidata(src);

    %Pause for the time n(in seconds).
    pause(n);
        
    %Set up the display countdown in terms of seconds.
    dataCollectionTime = handles.dataCollectionTimeSeconds.Value + ...
        handles.dataCollectionTimeHours.Value*3600;
    numHours = handles.dataCollectionTimeHours.Value;

    %Determine the time remaining in seconds.
    timeRemaining = dataCollectionTime - timeRunning;
    [timeRemainingHours, timeRemainingMinutes, timeRemainingSeconds] = getTimeRemainingHMS(timeRemaining);

    %Print the time remaining to the GUI.
    set(handles.getTimeRemaining, 'Value', [num2str(timeRemainingHours, '%02d'), ...
        ':', num2str(timeRemainingMinutes, '%02d'), ':', ...
        num2str(timeRemainingSeconds, '%02d')]);

    %Increment the running time counter.
    timeRunning = timeRunning + 1;
        
    %Check to see how much time is left.
    if timeRemaining == 0
        closereq();  %closes the figure.
        close all;   %Closes all the figures.
        break;       %Causes the program to exit gracefully.
    end
    
    %Set the start and stop button value.  If startButton.Value = 1 then we have started
    %the loop.  Likewise in order for the loop to run we set stopButton.Value = 0.
    handles.startButton.UserData = 1;
    handles.stopButton.UserData = 0;

    if handles.dataCollectionTimeSeconds.UserData == 1 & handles.dataCollectionTimeHours.Value == 0
        hoursSecondsFlag = 'Seconds';
    end
    if handles.dataCollectionTimeHours.Value >= 1
        hoursSecondsFlag = 'Hours';
    end

    %Temperature transducer code goes here.
    getTemperatureTransducerData(handles, fig, TVACDAQ, startHourStr, ...
        startMinuteStr, startSecondStr, timeRemaining, hoursSecondsFlag, numHours);

    
    if handles.stopButton.UserData == 1
        break;
    end  %End of if statement.

end  %End of the while loop
end  %End of the function startLoopingInputSignal.m
