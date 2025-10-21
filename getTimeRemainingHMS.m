function [hours, minutes, seconds] = getTimeRemainingHMS(remainingSeconds)

%This function will be used to convert the remaing time in seconds into the
%remaining time in hours, minutes and seconds.  
%This function will be called by getTVACStartButton.m

hours = fix(remainingSeconds/3600.0);

minutes = fix((remainingSeconds - 3600*hours)/60.0);

seconds = remainingSeconds - 3600*hours - 60*minutes;

end  %End of the function getTimeRemainingHMS.m