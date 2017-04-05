-- Author: __Vector__
local flashbangEnabled = {};
local flashbangCoefficient = 0.0;
local flashbangCoefficientFade = 1/3000;

local projectileToBeReplaced = 1;
local maximumInfluenceDistance = 30.5;
local maximumInfluenceCoefficient = 3;


local function getDistance3D (sX, sY, sZ, pX, pY, pZ)
    return math.sqrt ((sX-pX)*(sX-pX)+(sY-pY)*(sY-pY)+(sZ-pZ)*(sZ-pZ));
end;

local function getInfluenceCoefficient (sX, sY, sZ, pX, pY, pZ)
    local hit, hitX, hitY, hitZ =
            processLineOfSight (pX, pY, pZ, sX, sY, sZ, true, false, false, true, false,
                true);
    if not hit then
        local dist = getDistance3D (sX,sY,sZ,pX,pY,pZ);
        return maximumInfluenceCoefficient - math.sqrt (dist/maximumInfluenceDistance);
    end;
    return 0.0;
end;

addEventHandler ("onClientExplosion", getRootElement (),
    function (pX, pY, pZ, projectileType)
        if getElementType (source) == "player" then
        if (projectileType == projectileToBeReplaced) and flashbangEnabled[source] and (getPedWeapon (source) ~= 17) then
                local sX, sY, sZ = getElementPosition (getLocalPlayer ());

                if getDistance3D (sX, sY, sZ, pX, pY, pZ) <= maximumInfluenceDistance then
                    flashbangCoefficient = flashbangCoefficient + getInfluenceCoefficient (sX, sY, sZ, pX, pY, pZ);
                    if flashbangCoefficient > maximumInfluenceCoefficient then
                        flashbangCoefficient = maximumInfluenceCoefficient;
                    end;
                    playSound3D ("sounds/flashbang_explode.mp3", pX, pY, pZ, false);
                end;
                cancelEvent ();
            end;
        end;
    end);


addEventHandler ("onClientPreRender", getRootElement (),
    function (dt)
        if flashbangCoefficient > 0 then
            flashbangCoefficient = flashbangCoefficient - flashbangCoefficientFade * dt;
        elseif flashbangCoefficient < 0 then
            flashbangCoefficient = 0;
        end;
    end);


addEventHandler ("onClientRender", getRootElement (),
    function ()
        if flashbangCoefficient > 0 then
            local r,g,b = 255, 255, 255;
            local alpha = flashbangCoefficient * 255;
            if alpha > 255 then alpha = 255; end;
            local screenWidth, screenHeight = guiGetScreenSize ();

            dxDrawRectangle (0, 0, screenWidth, screenHeight, tocolor (r,g,b,alpha), true);
        end;
    end);


addEvent ("onPlayerToggleFlashbangGranade", true);
addEventHandler ("onPlayerToggleFlashbangGranade", getRootElement (),
    function (playerFlashbangEnabled)
        if type (playerFlashbangEnabled) == "table" then
            for i,j in pairs (playerFlashbangEnabled) do
                flashbangEnabled [i] = j;
            end;
        else
            flashbangEnabled [source] = playerFlashbangEnabled;
        end;
    end);

addEventHandler ("onClientPlayerJoin", getRootElement (),
    function ()
        flashbangEnabled [source] = true;
    end);

addEventHandler ("onClienPlayerQuit", getRootElement (),
    function ()
        flashbangEnabled [source] = nil;
    end);

addEventHandler ("onClientResourceStart", getResourceRootElement(getThisResource()),
    function ()
        triggerServerEvent ("onClientRequestPlayerData", getLocalPlayer ());
    end);

-- exported function.
function toggleFlashbangGranade (state)
    if type (state) ~= "boolean" then
        outputDebugString ("Bad Argument @ \"toggleFlashbangGranade\" [Expected boolean at argument 1, got " .. type (state) .. "]",2);
        return;
    end;

    triggerServerEvent ("onPlayerToggleFlashbangGranade", getLocalPlayer (), state);
end;
