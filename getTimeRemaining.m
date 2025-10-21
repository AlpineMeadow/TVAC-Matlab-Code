function getTimeRemaining = getTimeRemaining(handles, initialValue, row, column)
%This function is called by getTVACHandles.m

getTimeRemaining = uitextarea(handles.gl);
getTimeRemaining.Value = num2str(initialValue);
getTimeRemaining.FontWeight = "bold";
getTimeRemaining.FontSize = 24;
getTimeRemaining.FontColor = [0 0 0];
getTimeRemaining.Layout.Row = row;
getTimeRemaining.Layout.Column = column;
getTimeRemaining.BackgroundColor = [1 1 1];
getTimeRemaining.HorizontalAlignment = 'center';
getTimeRemaining.Enable = 'on';
getTimeRemaining.Editable = 'off';
    
end %End of the function getTimeRemaining.m