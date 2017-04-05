
local realtime = getRealTime()
setTime(realtime.hour, realtime.minute)
setMinuteDuration(60000)       

function checkSetTime()
    local realtime = getRealTime()
    setTime(realtime.hour,realtime.minute)
    setMinuteDuration(60000) 
end
setTimer(checkSetTime,60000,0)
