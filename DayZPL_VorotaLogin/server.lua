
speed = 1000 --скорість
id = 2004 --айди

function omg()
  omg = createObject(2004, 2308.8999023438, -2172.8999023438, -49.900001525879, 0, 0, 233.99780273438) --Де стоять ворота
  omgMoveomg(1)
end

function omgMoveomg(point)
  if point == 1 then
    moveObject(omg, speed, 2308.8999023438, -2172.8999023438, -49.900001525879, 0, 0, 0) -- закриті
    setTimer(omgMoveomg, speed, 1, 2)
  elseif point == 2 then
    moveObject(omg, speed, 2307.6000976563, -2174.5, -49.900001525879, 0, 0, 0) -- відкриті
    setTimer(omgMoveomg, speed, 1, 1)
  end
end

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), omg)