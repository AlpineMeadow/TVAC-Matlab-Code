function quitButton = getTVACQuitButton(handles, Text, row, column)
%This function will get the handle for the quit button.

%This function is called by get TVACHandles.m.  It generates a button on
%the user interface that allows the user to quit the program.

    quitButton = uibutton(handles.gl);
    quitButton.Text = Text;
    quitButton.FontWeight = "bold";
    quitButton.FontSize = 16;
    quitButton.FontColor = [0 0 0];
    quitButton.Layout.Row = row;
    quitButton.Layout.Column = column;
    quitButton.BackgroundColor = [1 1 1];
    quitButton.ButtonPushedFcn = {@quitButtonFlag};
    
end %End of the function getTVACQuitButton.m

function quitButtonFlag(src, event)

%This function is called by getTVACQuitButton.m  It will close the window.

%If the user clicks the close window button then close the window.
closereq();
close all;

end  %End of the function quitButtonFlag.m

