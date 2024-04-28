-- custom combat area pattern as described in question5 video
AREA_CIRCLE3X3_CUSTOM = {
	{ 0, 0, 0, 1, 0, 0, 0 },
	{ 0, 0, 1, 0, 1, 0, 0 },
	{ 0, 1, 0, 1, 0, 1, 0 },
	{ 1, 0, 1, 2, 1, 0, 1 },
	{ 0, 1, 0, 1, 0, 1, 0 },
	{ 0, 0, 1, 0, 1, 0, 0 },
	{ 0, 0, 0, 1, 0, 0, 0 },
}

-- recursive delayed tornado effect onTargetTile
local function playTornadoOnTile(cid, position, count)
	-- randomly flash tile with tornado
	if count == 0 or math.random(0, 1) == 1 then
		position:sendMagicEffect(CONST_ME_ICETORNADO)
	end

	-- play next tornado delayed randomly 
	if count > 0 then
		addEvent(playTornadoOnTile, math.random(300, 1000), cid, position, count - 1)
	end
end

-- trigger function, when attack hit on desired tile
function TriggerTornadoEffectOnTile(creature, position)
	playTornadoOnTile(creature:getId(), position, 3)
end

local combat = Combat()
-- define the attack area: https://github.com/otland/forgottenserver/wiki/Metatable:Combat#setArea%7Barea%7D
combat:setArea(createCombatArea(AREA_CIRCLE3X3_CUSTOM))
-- set callabck on target tile being hit: https://github.com/otland/forgottenserver/wiki/Metatable:Combat#setcallbackkey-function
combat:setCallback(CALLBACK_PARAM_TARGETTILE, "TriggerTornadoEffectOnTile")


-- default spell function
function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end
