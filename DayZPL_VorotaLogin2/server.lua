
speed = 1000 --скорість
id = 2004 --айди

function omg()
  omg = createObject(2004, 2311.8999023438, -2175.1999511719, -49.900001525879, 0, 0, 52.997802734375) --Де стоять ворота
  omgMoveomg(1)
end

function omgMoveomg(point)
  if point == 1 then
    moveObject(omg, speed, 2311.8999023438, -2175.1999511719, -49.900001525879, 0, 0, 0) -- закриті
    setTimer(omgMoveomg, speed, 1, 2)
  elseif point == 2 then
    moveObject(omg, speed, 2310.6999511719, -2176.8999023438, -49.900001525879, 0, 0, 0) -- відкриті
    setTimer(omgMoveomg, speed, 1, 1)
  end
end

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), omg)