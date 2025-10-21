function VToTConversionFactor = getVToTConversionFactor(handles, params, initialValue, row, column, position)
%This function will get the handle for each of the components in the graphical user interface. 

    VToTConversionFactor = uieditfield(handles.gl, 'numeric');
    VToTConversionFactor.Value = initialValue;
    VToTConversionFactor.Layout.Row = row;
    VToTConversionFactor.Layout.Column = column;
    VToTConversionFactor.ValueChangedFcn = {@setVToTConversionFactor, params, position};

end %End of the function getVToTConversionFactor.m

function setVToTConversionFactor(src, event, param, position)
%This function will put the new parameter into the param vector.
    
    %Get the data out of the application data of the figure object.
    handles = guidata(src);

    %Set the new value into the params vector.
    handles.params(position) = src.Value;

    %Now store the new values back into the application data of the figure object.
    guidata(src, handles);
    
end  %End of the function setVToTConversionFactor.m


