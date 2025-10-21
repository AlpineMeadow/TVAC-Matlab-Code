function dataCollectionTimeHours =  getTVACDataCollectionTimeHours(handles, timeToCollectDataHours, row, ...
        column, timeToCollectDataHoursIndex)

%This function is called by getTVACHandles.m.  This function will get the
%number of seconds the user wants to collect data.

dataCollectionTimeHours = uieditfield(handles.gl, 'numeric');
dataCollectionTimeHours.Value = timeToCollectDataHours;
dataCollectionTimeHours.Layout.Row = row;
dataCollectionTimeHours.Layout.Column = column;
dataCollectionTimeHours.HorizontalAlignment = 'center';
dataCollectionTimeHours.FontSize = 24;
dataCollectionTimeHours.FontWeight = 'bold';
dataCollectionTimeHours.UserData = 1;
dataCollectionTimeHours.ValueChangedFcn = {@changeDataCollectionTimeHours, dataCollectionTimeHours, ...
    timeToCollectDataHoursIndex};

end %End of the function getTVACDataCollectionTimeHours.m

function changeDataCollectionTimeHours(src, event, dataCollectionTimeHours,  timeToCollectDataHoursIndex)
%This function will put the new parameter into the param vector.
    
%Get the data out of the application data of the figure object.
handles = guidata(src);

%Set the new value into the params vector.
handles.params(timeToCollectDataHoursIndex) = dataCollectionTimeHours.Value;

%Set the new value into the dataCollectionTime handle.
dataCollectionTimeHours.Value = event.Value;
    
%Now store the new values back into the application data of the figure object.
guidata(src, handles);
    
end  %End of the function changeDataCollectionTimeHours.m