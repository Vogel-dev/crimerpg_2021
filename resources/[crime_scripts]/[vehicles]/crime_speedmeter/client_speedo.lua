--[[

	@ Author: Vercetti 
	@ Copyright: Vercetti for CrimeRPG ©2020

	@ Pierwotne prawo do użytkowania tego zasobu ma tylko i wyłącznie pierwotny Autor.
	@ Obowiązuje całkowity zakaz rozpowszechniania, zmiany autora jak i edycji zasobu.
	@ Obowiązuje całkowity nakaz zachowania autora po uzyskaniu zgody na używanie skryptu przez autora.

]]--

local screen = {guiGetScreenSize()};
scale = 1;
if screen[1] < 1920 then scale = math.min(2, 1920/screen[1]); end

local speedo = {};
speedo.veh_player = nil;
speedo.scale = {
    disc = {screen[1] - 405 / scale, screen[2] - 405 / scale, 385 / scale, 385 / scale},
    arrow = {screen[1] - 221 / scale, screen[2] - 410 / scale, 20 / scale, 400 / scale},
    arrow_fuel = {screen[1] - 139 / scale, screen[2] - 290 / scale, 20 / scale, 400 / scale},

    icon_engine = {screen[1] - 267 / scale, screen[2] - 181 / scale, 30 / scale, 20 / scale},
    icon_handbrake = {screen[1] - 229 / scale, screen[2] - 183 / scale, 30 / scale, 22 / scale},
    icon_light = {screen[1] - 187 / scale, screen[2] - 181 / scale, 30 / scale, 20 / scale},

    mileage = {screen[1] - 255 / scale, screen[2] - 294 / scale, screen[1] - 168 / scale, screen[2] - 276 / scale},
};

speedo.textures = {
    disc = {no_light = dxCreateTexture('files/disc.png', 'argb', true, 'clamp'), light = dxCreateTexture('files/disc_light.png', 'argb', true, 'clamp')},
    arrow = {main = dxCreateTexture('files/arrow.png', 'argb', true, 'clamp'), fuel = dxCreateTexture('files/arrow_fuel.png', 'argb', true, 'clamp')},
    icon = {engine = dxCreateTexture('files/icon_engine.png', 'argb', true, 'clamp'), handbrake = dxCreateTexture('files/icon_handbrake.png', 'argb', true, 'clamp'), light = dxCreateTexture('files/icon_light.png', 'argb', true, 'clamp')},
};

speedo.fonts = {
    dxCreateFont('files/Roboto-Regular.ttf', 9 / scale, false, 'cleartype_natural'),
};

speedo.draw = function()
    dxDrawImage(speedo.scale.disc[1], speedo.scale.disc[2], speedo.scale.disc[3], speedo.scale.disc[4], (getVehicleOverrideLights(speedo.veh_player) == 2 and speedo.textures.disc.light or speedo.textures.disc.no_light));


    dxDrawImage(speedo.scale.icon_engine[1], speedo.scale.icon_engine[2], speedo.scale.icon_engine[3], speedo.scale.icon_engine[4], speedo.textures.icon.engine, 0, 0, 0, (getVehicleEngineState(speedo.veh_player) and 0xFFb57d1c or 0xFF131313));
    dxDrawImage(speedo.scale.icon_handbrake[1], speedo.scale.icon_handbrake[2], speedo.scale.icon_handbrake[3], speedo.scale.icon_handbrake[4], speedo.textures.icon.handbrake, 0, 0, 0, (isElementFrozen(speedo.veh_player) and 0xFFb51212 or 0xFF131313));
    dxDrawImage(speedo.scale.icon_light[1], speedo.scale.icon_light[2], speedo.scale.icon_light[3], speedo.scale.icon_light[4], speedo.textures.icon.light, 0, 0, 0, (getVehicleOverrideLights(speedo.veh_player) ~= 2 and 0xFF131313 or 0Xff3288bf));

    local _mileage = getElementData(speedo.veh_player, 'vehicle:mileage') or 0
    dxDrawText(string.format('%07dkm', _mileage), speedo.scale.mileage[1], speedo.scale.mileage[2], speedo.scale.mileage[3], speedo.scale.mileage[4], 0xFFA5A5A5, 1, speedo.fonts[1], 'center', 'center');
    dxDrawImage(speedo.scale.arrow[1], speedo.scale.arrow[2], speedo.scale.arrow[3], speedo.scale.arrow[4], speedo.textures.arrow.main, 182 + getElementSpeed(speedo.veh_player, 'km/h') * 0.95);
    local _tank = getElementData(speedo.veh_player, 'vehicle:bak');
    if getElementData(speedo.veh_player,"vehicle:wlaczonelpg") == true then 
        _fuel = getElementData(speedo.veh_player,"vehicle:lpgfuel") or 0
    else 
        _fuel = getElementData(speedo.veh_player,"vehicle:fuel") or 0
    end
    if _fuel and _tank then
        local _calc = _fuel / _tank * 120
        dxDrawImage(speedo.scale.arrow_fuel[1], speedo.scale.arrow_fuel[2], speedo.scale.arrow_fuel[3], speedo.scale.arrow_fuel[4], speedo.textures.arrow.fuel, 303+_calc);
    end
end 

speedo.show = function ( bool )
    if bool and not getElementData(localPlayer, 'newhud') then
        speedo.veh_player = getPedOccupiedVehicle(localPlayer);
        if not speedo.veh_player then return end
        addEventHandler('onClientRender', root, speedo.draw);
    else
        removeEventHandler('onClientRender', root, speedo.draw);
        speedo.veh_player = nil;
    end
end
addEvent('speedo:toggle', true);
addEventHandler('speedo:toggle', localPlayer, speedo.show);
addEventHandler('onClientVehicleEnter', root, function(player) if player == localPlayer then speedo.show ( true ) end end);
addEventHandler('onClientVehicleExit', root, function(player) if player == localPlayer then speedo.show ( false ) end end);
addEventHandler('onClientElementDestroy', root, function() if getElementType(source) == 'vehicle' and getPedOccupiedVehicle(localPlayer) == source then speedo.show ( false ) end end);

if getPedOccupiedVehicle(localPlayer) then
    speedo.show ( true );
end


