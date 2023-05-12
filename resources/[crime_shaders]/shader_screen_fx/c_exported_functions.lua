--
-- c_exported_functions.lua
--
----------------------------------------------------------------------------------------------------------------------------
-- exported functions
----------------------------------------------------------------------------------------------------------------------------
function startEffects(isEnabled)
	if (type(isEnabled)=="boolean") then
		if isEnabled then
			return enableScreenEffects()
		else
			return disableScreenEffects()
		end
	else
		return false
	end
end

function setMaxAlpha(fxAlpha)
	if not fxScreenEnable then return false end
	if (type(fxAlpha)=="number") then
		if (fxAlpha >= 0 and fxAlpha <= 255) then
			local v = Settings.var
			v.maxAlpha = fxAlpha
			return true
		else
			return false
		end
	else
		return false
	end
end

function enableEffect(effectNo,isEnabled)
	if not fxScreenEnable then return false end
	if (type(effectNo)=="number" and type(isEnabled)=='boolean') then
		if (effectNo >= 1 and effectNo <= 4) then
			local v = Settings.var
			v.effectType[math.floor(effectNo)].enabled = isEnabled
			return true
		else
			return false
		end
	else
		return false
	end
end

function setEffectFadeSpeed(effectNo,fSpeed)
	if not fxScreenEnable then return false end
	if (type(effectNo)=='number' and type(fSpeed)=='number') then
		if (fSpeed > 1 or fSpeed <= 0) then return false end
		if (effectNo >= 1 and effectNo <= 4) then
			local v = Settings.var
			v.effectType[math.floor(effectNo)].fadeSpeed = fSpeed
			return true
		else
			return false
		end
	else
		return false
	end
end

function setEffectMaxStrength(effectNo,maxStreng)
	if not fxScreenEnable then return false end
	if (type(effectNo)=='number' and type(maxStreng)=='number') then
		if (maxStreng > 1 or maxStreng < 0) then return false end
		if (effectNo >= 1 and effectNo <= 4) then
			local v = Settings.var
			v.effectType[math.floor(effectNo)].maxStreng = maxStreng
			return true
		else
			return false
		end
	else
		return false
	end
end

function setEffectVariables(effectNo,isEnabled,streng,speed,...)
	if not fxScreenEnable then return false end
	local reqParam = {effectNo,streng,speed}
	local isThisValid = true
	local countParam = 0
	for m, param in ipairs(reqParam) do
		countParam = countParam + 1
		isThisValid = isThisValid and param and (type(param) == "number")
	end
	if (countParam ~= 3) or type(isEnabled) ~= "boolean" then return false end
	if (effectNo < 1 or effectNo > 4) then return false end
	local v = Settings.var
	local effectFloor = math.floor(effectNo)
	v.effectType[effectFloor].enabled = isEnabled
	v.effectType[effectFloor].streng = streng 
	v.effectType[effectFloor].speed = speed	
	local optParam = {...}
	local isValid = true
	if #optParam > 3 then return false end
	if #optParam >= 1 then
		if (type(optParam[1]) =='number') then
			if effectFloor == 1 then v.effectType[1].choke = optParam[1] end
			if effectFloor == 3 then v.effectType[3].size = optParam[1] end
			if effectFloor == 4 then v.effectType[4].intens = optParam[1] end
		else
			isValid = isValid and false
		end
	end
	if #optParam >= 2 then
		if (type(optParam[2]) =='number') then
			if effectFloor == 3 then v.effectType[3].density = optParam[2] end
			if effectFloor == 4 then v.effectType[4].blur = optParam[2] end
		else
			isValid = isValid and false
		end
	end
	if #optParam == 3 then
		if (type(optParam[3]) =='number') then
			if effectFloor == 4 then v.effectType[4].choke = optParam[3] end	
		else
			isValid = isValid and false
		end
	end
	return isValid
end