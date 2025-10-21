function sampleRate = getTVACSampleRate(handles, initialValue, row, column, position)
%This function will get the handle for each of the components in the graphical user interface. 
%This function is called by getTVACHandles.m

sampleRate = uieditfield(handles.gl, 'numeric');
sampleRate.Value = initialValue;
sampleRate.Layout.Row = row;
sampleRate.Layout.Column = column;
sampleRate.HorizontalAlignment = 'center';
sampleRate.FontSize = 24;
sampleRate.FontWeight = 'bold';
sampleRate.ValueChangedFcn = {@changeSampleRate, position};

end %End of the function getTVACSampleRate.m

function changeSampleRate(src, ~, position)
%This function will put the new parameter into the param vector.
    
%Get the data out of the application data of the figure object.
handles = guidata(src);

%Set the new value into the params vector.
handles.params(position) = src.Value;

%Now store the new values back into the application data of the figure object.
guidata(src, handles);
    
end  %End of the function changeSampleRate.m

