function TVACLabel = getTVACLabel(handles, name, row, column, color)
%This function will place a label of "Stage at the top of the graphical user
%interface.
%This function is called by getTVACHandles.m
    
TVACLabel = uilabel(handles.gl);
TVACLabel.Text = name;
TVACLabel.FontWeight = "bold";
TVACLabel.FontSize = 24;
TVACLabel.FontColor = color;
TVACLabel.Layout.Row = row;
TVACLabel.Layout.Column = column;
TVACLabel.HorizontalAlignment = "center";

end %End of the function getTVACLabel.m


