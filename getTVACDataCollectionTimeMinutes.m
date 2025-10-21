function  dataCollectionTimeMinutes =  getTVACDataCollectionTimeMinutes(handles, timeToCollectDataMinutes, row, ...
        column, timeToCollectDataMinutesIndex)
%This function is called by getTVACHandles.m.  This function will get the
%number of seconds the user wants to collect data.

dataCollectionTimeMinutes = uieditfield(handles.gl, 'numeric');
dataCollectionTimeMinutes.Value = timeToCollectDataMinutes;
dataCollectionTimeMinutes.Layout.Row = row;
dataCollectionTimeMinutes.Layout.Column = column;
dataCollectionTimeMinutes.HorizontalAlignment = 'center';
dataCollectionTimeMinutes.FontSize = 24;
dataCollectionTimeMinutes.FontWeight = 'bold';
dataCollectionTimeMinutes.ValueChangedFcn = {@changeDataCollectionTimeMinutes, dataCollectionTimeMinutes, ...
    timeToCollectDataMinutesIndex};

end %End of the function getTVACDataCollectionTimeMinutes.m

function changeDataCollectionTimeMinutes(src, event, dataCollectionTimeMinutes,  timeToCollectDataMinutessIndex)
%This function will put the new parameter into the param vector.
    
%Get the data out of the application data of the figure object.
handles = guidata(src);

%Set the new value into the params vector.
handles.params(timeToCollectDataMinutesIndex) = dataCollectionTimeMinutes.Value;

%Set the new value into the dataCollectionTime handle.
dataCollectionTimeMinutes.Value = event.Value;
    
%Now store the new values back into the application data of the figure object.
guidata(src, handles);
    
end  %End of the function changeDataCollectionTimeMinutes.m