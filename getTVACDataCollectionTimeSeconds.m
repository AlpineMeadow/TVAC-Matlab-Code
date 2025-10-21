function  dataCollectionTimeSeconds =  getTVACDataCollectionTimeSeconds(handles, timeToCollectData, row, ...
        column, timeToCollectDataIndex)
%This function is called by getTVACHandles.m.  This function will get the
%number of seconds the user wants to collect data.

dataCollectionTimeSeconds = uieditfield(handles.gl, 'numeric');
dataCollectionTimeSeconds.Value = timeToCollectData;
dataCollectionTimeSeconds.Layout.Row = row;
dataCollectionTimeSeconds.Layout.Column = column;
dataCollectionTimeSeconds.HorizontalAlignment = 'center';
dataCollectionTimeSeconds.FontSize = 24;
dataCollectionTimeSeconds.FontWeight = 'bold';
dataCollectionTimeSeconds.UserData = 1;
dataCollectionTimeSeconds.ValueChangedFcn = {@changeDataCollectionTimeSeconds, dataCollectionTimeSeconds, ...
    timeToCollectDataIndex};

end %End of the function getTVACDataCollectionTimeSeconds.m

function changeDataCollectionTimeSeconds(src, event, dataCollectionTimeSeconds,  timeToCollectDataSecondsIndex)
%This function will put the new parameter into the param vector.
    
%Get the data out of the application data of the figure object.
handles = guidata(src);

%Set the new value into the params vector.
handles.params(timeToCollectDataSecondsIndex) = dataCollectionTimeSeconds.Value;

%Set the new value into the dataCollectionTime handle.
dataCollectionTimeSeconds.Value = event.Value;
    
%Now store the new values back into the application data of the figure object.
guidata(src, handles);
    
end  %End of the function changeDataCollectionTimeSeconds.m
