require "TimedActions/ISBaseTimedAction"

e=1;

--ФУНКЦИЯ РЫТЬСЯ НА СВАЛКЕ
ISSearchTrash = ISBaseTimedAction:derive("ISSearchTrash");

function ISSearchTrash:isValid()
	return true;
end

function ISSearchTrash:update()
end

function ISSearchTrash:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISSearchTrash:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISSearchTrash:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local r=ZombRand(100)
	local x=ZombRand(8)
	local bc=ZombRand(6)
	local dt=ZombRand(8)
	local nail=ZombRand(5)
	local screw=ZombRand(5)
	local plastic=ZombRand(3)
	local rope=ZombRand(10)
	local rubber=ZombRand(4)
	local silicon=ZombRand(4)
	local glass=ZombRand(3)
	local grncrd=ZombRand(30)
	if r<=50 then
	self.character:getInventory():AddItem("Base.ScrapMetal");
	end
	if x==5 then
		self.character:getInventory():AddItems("Base.UnusableMetal",3);
	elseif x==4 then
		self.character:getInventory():AddItems("Base.UnusableMetal",2);
	elseif x==2 or x==1 or x==0 then
		self.character:getInventory():AddItem("Base.UnusableMetal");
	end
	if bc==5 then
		self.character:getInventory():AddItems("NHM.BulletCasing",2);
	elseif bc==4 or bc==3 then 
		self.character:getInventory():AddItem("NHM.BulletCasing");
	end
	if dt == 0 then
		self.character:getInventory():AddItem("Base.DuctTape");
	elseif dt == 1 then 
		self.character:getInventory():AddItem("Base.Glue");
	elseif dt == 2 then 
		self.character:getInventory():AddItem("Base.Woodglue");
	elseif dt == 3 then 
		self.character:getInventory():AddItem("Base.Scotchtape");
	end
	if nail==2 or nail==3 then
		self.character:getInventory():AddItem("Base.Nails");
	end
	if screw==2 then
		self.character:getInventory():AddItems("Base.Screws",2);
	end
	if plastic==2 then
		self.character:getInventory():AddItem("NHM.Plastic");
	end
	if rope==9 then
		self.character:getInventory():AddItem("Base.Rope");
	end
	if rubber==3 then
		self.character:getInventory():AddItem("NHM.Rubber");
	end
	if silicon==1 then
		self.character:getInventory():AddItem("NHM.SiliconOre");
	end
	if glass==2 then
		self.character:getInventory():AddItem("NHM.Glass");
	end
	if grncrd==9 then
		self.character:getInventory():AddItem("NHM.GreenCard");
	end
end

function ISSearchTrash:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ НАПОЛНИТЬ ГАЗОВУЮ ГОРЕЛКУ
ISExtractGas = ISBaseTimedAction:derive("ISExtractGas");

function ISExtractGas:isValid()
	return true;
end

function ISExtractGas:update()
end

function ISExtractGas:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISExtractGas:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISExtractGas:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	self.character:getInventory():Remove("EmptyBlowTorch");
	self.character:getInventory():AddItem("Base.BlowTorch");
end

function ISExtractGas:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end


--ФУНКЦИЯ НАПОЛНИТЬ ПРОПАНОВЫЙ БАЛЛН
ISExtractMuchGas = ISBaseTimedAction:derive("ISExtractMuchGas");

function ISExtractMuchGas:isValid()
	return true;
end

function ISExtractMuchGas:update()
end

function ISExtractMuchGas:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISExtractMuchGas:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISExtractMuchGas:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	self.character:getInventory():Remove("EmptyPropaneTank");
	self.character:getInventory():AddItem("Base.PropaneTank");
end

function ISExtractMuchGas:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end


--ФУНКЦИЯ КОПАТЬ МЕДЬ
ISMineCopper = ISBaseTimedAction:derive("ISMineCopper");

function ISMineCopper:isValid()
	return true;
end

function ISMineCopper:update()
end

function ISMineCopper:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineCopper:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineCopper:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local minecop = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 5);
	if minecop==3 or (minecop==2 and self.character:HasTrait('miner')) or (minecop==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("NHM.CopperOre",2);
	else 
	self.character:getInventory():AddItem("NHM.CopperOre");
	end
end

function ISMineCopper:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ ОЛОВО
ISMineTin = ISBaseTimedAction:derive("ISMineTin");

function ISMineTin:isValid()
	return true;
end

function ISMineTin:update()
end

function ISMineTin:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineTin:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineTin:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local minetin = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 5);
	if minetin==3 or (minetin==2 and self.character:HasTrait('miner')) or (minetin==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("NHM.TinOre",2);
	else 
	self.character:getInventory():AddItem("NHM.TinOre");
	end
end

function ISMineTin:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ ЖЕЛЕЗО
ISMineIron = ISBaseTimedAction:derive("ISMineIron");

function ISMineIron:isValid()
	return true;
end

function ISMineIron:update()
end

function ISMineIron:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineIron:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineIron:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local mineiron = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 10);
	if mineiron==4 or (mineiron==2 and self.character:HasTrait('miner')) or (mineiron==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("NHM.IronOre",2);
	else
	self.character:getInventory():AddItem("NHM.IronOre");
	end
	self.character:getInventory():AddItems("Base.Stone",1);
end

function ISMineIron:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ СВИНЕЦ
ISMineLead = ISBaseTimedAction:derive("ISMineLead");

function ISMineLead:isValid()
	return true;
end

function ISMineLead:update()
end

function ISMineLead:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineLead:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineLead:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local minelead = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 10);
	if minelead==4 or (minelead==2 and self.character:HasTrait('miner')) or (minelead==1 and self.character:HasTrait('miner')) then 
		self.character:getInventory():AddItems("NHM.GalenaOre",2);	
		else
		self.character:getInventory():AddItem("NHM.GalenaOre");
		end
	self.character:getInventory():AddItems("Base.Stone",1);
end

function ISMineLead:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ ХРОМ
ISMineChromium = ISBaseTimedAction:derive("ISMineChromium");

function ISMineChromium:isValid()
	return true;
end

function ISMineChromium:update()
end

function ISMineChromium:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineChromium:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineChromium:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local minechr = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 15);
	if minechr==4 or (minechr==2 and self.character:HasTrait('miner')) or (minechr==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("NHM.ChromiumOre",2);
	else 
	self.character:getInventory():AddItem("NHM.ChromiumOre");
	end
	self.character:getInventory():AddItems("Base.Stone",2);
end

function ISMineChromium:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ НИКЕЛЬ
ISMineNickel = ISBaseTimedAction:derive("ISMineNickel");

function ISMineNickel:isValid()
	return true;
end

function ISMineNickel:update()
end

function ISMineNickel:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineNickel:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineNickel:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local minenkl = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 15);
	if minenkl==4 or (minenkl==2 and self.character:HasTrait('miner')) or (minenkl==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("NHM.NickelOre",2);
	else 
	self.character:getInventory():AddItem("NHM.NickelOre");
	end
	self.character:getInventory():AddItems("Base.Stone",2);
end

function ISMineNickel:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ ИЗВЕСТНЯК
ISMineLimestone = ISBaseTimedAction:derive("ISMineLimestone");

function ISMineLimestone:isValid()
	return true;
end

function ISMineLimestone:update()
end

function ISMineLimestone:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineLimestone:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineLimestone:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local minelmst = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 3);
	if minelmst==4 or (minelmst==2 and self.character:HasTrait('miner')) or (minelmst==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("NHM.Limestone",2);
	else 
	self.character:getInventory():AddItem("NHM.Limestone");
	end
end

function ISMineLimestone:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ УГОЛЬ
ISMineCoal = ISBaseTimedAction:derive("ISMineCoal");

function ISMineCoal:isValid()
	return true;
end

function ISMineCoal:update()
end

function ISMineCoal:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineCoal:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineCoal:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local minecl = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 3);
	if minecl==4 or (minecl==2 and self.character:HasTrait('miner')) or (minecl==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("NHM.Coal",5);
	else 
	self.character:getInventory():AddItems("NHM.Coal",3);
	end
end

function ISMineCoal:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ СОЛЬ
ISMineSalt = ISBaseTimedAction:derive("ISMineSalt");

function ISMineSalt:isValid()
	return true;
end

function ISMineSalt:update()
end

function ISMineSalt:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineSalt:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineSalt:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local mineslt = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 3);
	if mineslt==4  or (mineslt==2 and self.character:HasTrait('miner')) or (mineslt==1 and self.character:HasTrait('miner'))  then
	self.character:getInventory():AddItems("NHM.SaltPinch",4);
	else 
	self.character:getInventory():AddItems("NHM.SaltPinch",2);
	end
end

function ISMineSalt:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ СЕРУ
ISMineSulfur = ISBaseTimedAction:derive("ISMineSulfur");

function ISMineSulfur:isValid()
	return true;
end

function ISMineSulfur:update()
end

function ISMineSulfur:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineSulfur:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineSulfur:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local mineslfr = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 6);
	if mineslfr==4 or (mineslfr==2 and self.character:HasTrait('miner')) or (mineslfr==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("NHM.SulfurOre",3);
	else 
	self.character:getInventory():AddItems("NHM.SulfurOre",2);
	end
end

function ISMineSulfur:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ КОПАТЬ КАМНИ
ISMineStone = ISBaseTimedAction:derive("ISMineStone");

function ISMineStone:isValid()
	return true;
end

function ISMineStone:update()
end

function ISMineStone:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISMineStone:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISMineStone:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local minestn = ZombRand(5)
	self.character:getXp():AddXP(Perks.MetalWelding, 6);
	if minestn==4 or (minestn==2 and self.character:HasTrait('miner')) or (minestn==1 and self.character:HasTrait('miner')) then
	self.character:getInventory():AddItems("Base.Stone",5);
	else 
	self.character:getInventory():AddItems("Base.Stone",3);
	end
end

function ISMineStone:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ ДОБЫТЬ АКТИВНОЕ ВЕЩЕСТВО
ISActiveComp = ISBaseTimedAction:derive("ISActiveComp");

function ISActiveComp:isValid()
	return true;
end

function ISActiveComp:update()
end

function ISActiveComp:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISActiveComp:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISActiveComp:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	self.character:getInventory():Remove("ChemicalFlask");
	self.character:getInventory():AddItem("NHM.FlaskActiveComp");
end

function ISActiveComp:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ НАПОЛНИТЬ КАНИСТРУ БЕНЗИНОМ
ISExtractPetrol = ISBaseTimedAction:derive("ISExtractPetrol");

function ISExtractPetrol:isValid()
	return true;
end

function ISExtractPetrol:update()
end

function ISExtractPetrol:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISExtractPetrol:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISExtractPetrol:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	self.character:getInventory():Remove("EmptyPetrolCan");
	self.character:getInventory():AddItem("Base.PetrolCan");
end

function ISExtractPetrol:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

--ФУНКЦИЯ ДОБЫТЬ ДЕТАЛИ ОРУЖИЯ
ISExtractWeaponpart = ISBaseTimedAction:derive("ISExtractWeaponpart");

function ISExtractWeaponpart:isValid()
	return true;
end

function ISExtractWeaponpart:update()
end

function ISExtractWeaponpart:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISExtractWeaponpart:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISExtractWeaponpart:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
		local wp = ZombRand(33)
		if wp == 0 or wp == 1 then
			self.character:getInventory():AddItem("NHM.BarrelRifle");
		elseif wp == 2 or wp == 3 then 
			self.character:getInventory():AddItem("NHM.BarrelPistol");
		elseif wp == 4 or wp == 5 then 
			self.character:getInventory():AddItem("NHM.Riflebody");
		elseif wp == 6 or wp == 7 then 
			self.character:getInventory():AddItem("NHM.Woodenparts");
		elseif wp == 8 or wp == 9 then 
			self.character:getInventory():AddItem("NHM.Triggergroup");
		elseif wp == 10 or wp == 11 then 
			self.character:getInventory():AddItem("NHM.Boltgroup");
		elseif wp == 12 or wp == 13 then 
			self.character:getInventory():AddItem("NHM.BoltgroupSA");
		elseif wp == 14 or wp == 15 then 
			self.character:getInventory():AddItem("NHM.Gastube");
		elseif wp == 16 or wp == 17 then 
			self.character:getInventory():AddItem("NHM.Spring");
		elseif wp == 18 or wp == 19 then 
			self.character:getInventory():AddItem("NHM.Revolverdrum");
		elseif wp == 20 or wp == 21 then 
			self.character:getInventory():AddItem("NHM.Pistolbody");
		end
end

function ISExtractWeaponpart:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end


--КВЕСТ 1 УБОРЩИЦА МЫТЬ ПОЛЫ
ISElevatorDirt = ISBaseTimedAction:derive("ISElevatorDirt");

function ISElevatorDirt:isValid()
	return true;
end

function ISElevatorDirt:update()
end

function ISElevatorDirt:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHBroom");
self.character:getInventory():Remove("QuestHBucket");
end

function ISElevatorDirt:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHBroom");
	self.character:getInventory():AddItem("NHM.QuestHBucket");
end

function ISElevatorDirt:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
			self.character:getInventory():AddItem("NHM.QuestHBroomDirty");
			self.character:getInventory():AddItem("NHM.QuestHBucketDirty");
		QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/ElevatorDirt.png>" .."<LINE><LINE>".. getText("Tooltip_CleanerQuest1_Perform") .."\n")
		QuestWindow:setVisible(true);
end

function ISElevatorDirt:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end


--КВЕСТ 2 УБОРЩИЦА СТИРАТЬ ОДЕЖДУ
ISLaundry = ISBaseTimedAction:derive("ISLaundry");

function ISLaundry:isValid()
	return true;
end

function ISLaundry:update()
end

function ISLaundry:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHDirtyCloth");
end

function ISLaundry:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHDirtyCloth");
end

function ISLaundry:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHCleanCloth");
		QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Laundry.png>" .."<LINE><LINE>".. getText("Tooltip_CleanerQuest2_Perform") .."\n")
		QuestWindow:setVisible(true);
end

function ISLaundry:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- ДЕМИУРГ ЗАДАНИЕ 1 АРХИВ
ISArchive = ISBaseTimedAction:derive("ISArchive");

function ISArchive:isValid()
	return true;
end

function ISArchive:update()
end

function ISArchive:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHTip");
end

function ISArchive:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHTip");
end

function ISArchive:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHArchive");
			QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Archive.png>" .."<LINE><LINE>".. getText("Tooltip_DemiurgeQuest1_Perform") .."\n")
			QuestWindow:setVisible(true);
end

function ISArchive:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- ДЕМИУРГ ЗАДАНИЕ 2 ПИЛА 
ISMorgue = ISBaseTimedAction:derive("ISMorgue");

function ISMorgue:isValid()
	return true;
end

function ISMorgue:update()
end

function ISMorgue:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHTweezers");
end

function ISMorgue:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHTweezers");
end

function ISMorgue:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHDeadSaw");
			QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Morgue.png>" .."<LINE><LINE>".. getText("Tooltip_DemiurgeQuest2_Perform") .."\n")
			QuestWindow:setVisible(true);
end

function ISMorgue:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- СЕСТРА ЗАДАНИЕ 1 ДИСКЕТА 
ISComputer = ISBaseTimedAction:derive("ISComputer");

function ISComputer:isValid()
	return true;
end

function ISComputer:update()
end

function ISComputer:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHDisk");
end

function ISComputer:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHDisk");
end

function ISComputer:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHFullDisk");
			QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Computer.png>" .."<LINE><LINE>".. getText("Tooltip_NurseQuest1_Perform") .."\n")
			QuestWindow:setVisible(true);
end

function ISComputer:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- СЕСТРА ЗАДАНИЕ 2 КОЛБА
ISVioletLiquid = ISBaseTimedAction:derive("ISVioletLiquid");

function ISVioletLiquid:isValid()
	return true;
end

function ISVioletLiquid:update()
end

function ISVioletLiquid:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHEmptyFlask");
end

function ISVioletLiquid:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHEmptyFlask");
end

function ISVioletLiquid:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHFullFlask");
			QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/VioletLiquid.png>" .."<LINE><LINE>".. getText("Tooltip_NurseQuest2_Perform") .."\n")
			QuestWindow:setVisible(true);
end

function ISVioletLiquid:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- АССИСТЕНТ ЗАДАНИЕ 1 ПЕТРИ 
ISMicroscope = ISBaseTimedAction:derive("ISMicroscope");

function ISMicroscope:isValid()
	return true;
end

function ISMicroscope:update()
end

function ISMicroscope:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHPetri");
end

function ISMicroscope:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHPetri");
end

function ISMicroscope:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHFullPetri");
			QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Microscope.png>" .."<LINE><LINE>".. getText("Tooltip_AssistantQuest1_Perform") .."\n")
			QuestWindow:setVisible(true);
end

function ISMicroscope:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- АССИСТЕНТ ЗАДАНИЕ 2 КАРТА ЗВЕЗДНОГО НЕБА
ISStars = ISBaseTimedAction:derive("ISStars");

function ISStars:isValid()
	return true;
end

function ISStars:update()
end

function ISStars:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHEmptyStars");
end

function ISStars:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHEmptyStars");
end

function ISStars:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHStars");
		QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Stars.png>" .."<LINE><LINE>".. getText("Tooltip_AssistantQuest2_Perform") .."\n")
		QuestWindow:setVisible(true);
end

function ISStars:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end


-- КУХАРКА ЗАДАНИЕ 1 ТАРЕЛКИ 
ISSink = ISBaseTimedAction:derive("ISSink");

function ISSink:isValid()
	return true;
end

function ISSink:update()
end

function ISSink:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHDirtyDish");
end

function ISSink:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHDirtyDish");
end

function ISSink:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHCleanDish");
			QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Sink.png>" .."<LINE><LINE>".. getText("Tooltip_CookQuest1_Perform") .."\n")
			QuestWindow:setVisible(true);
end

function ISSink:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- КУХАРКА ЗАДАНИЕ 2 ПЕВКО))
ISBeer = ISBaseTimedAction:derive("ISBeer");

function ISBeer:isValid()
	return true;
end

function ISBeer:update()
end

function ISBeer:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHEmptyBeer");
end

function ISBeer:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHEmptyBeer");
end

function ISBeer:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHBeer");
		QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Beer.png>" .."<LINE><LINE>".. getText("Tooltip_CookQuest2_Perform") .."\n")
		QuestWindow:setVisible(true);
end

function ISBeer:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- ЗАВЕДУЮЩИЙ ЗАДАНИЕ 1 ОГНЕТУШИТЕЛЬ
ISFirecup = ISBaseTimedAction:derive("ISFirecup");

function ISFirecup:isValid()
	return true;
end

function ISFirecup:update()
end

function ISFirecup:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHKey");
end

function ISFirecup:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHKey");
end

function ISFirecup:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHFireEx");
		QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Firecup.png>" .."<LINE><LINE>".. getText("Tooltip_HeadQuest1_Perform") .."\n")
		QuestWindow:setVisible(true);
end

function ISFirecup:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- ЗАВЕДУЮЩИЙ ЗАДАНИЕ 2 ПАКЕТ КРОВИ
ISBlood = ISBaseTimedAction:derive("ISBlood");

function ISBlood:isValid()
	return true;
end

function ISBlood:update()
end

function ISBlood:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHBloodBag");
end

function ISBlood:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHBloodBag");
end

function ISBlood:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHFullBloodBag");
		QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Blood.png>" .."<LINE><LINE>".. getText("Tooltip_HeadQuest2_Perform") .."\n")
		QuestWindow:setVisible(true);
end

function ISBlood:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- ФАРМАЦЕВТ ЗАДАНИЕ 1 ТАБЛЕТКИ
ISTablets = ISBaseTimedAction:derive("ISTablets");

function ISTablets:isValid()
	return true;
end

function ISTablets:update()
end

function ISTablets:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestHMortPest");
end

function ISTablets:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestHMortPest");
end

function ISTablets:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestHTablets");
			QuestWindow:setText("<IMAGECENTRE:media/textures/Quests/Tablets.png>" .."<LINE><LINE>".. getText("Tooltip_PharmacistQuest1_Perform") .."\n")
			QuestWindow:setVisible(true);
end

function ISTablets:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- КАИН ЗАДАНИЕ НА АВТОМАТ 1
ISComputer2 = ISBaseTimedAction:derive("ISComputer2");

function ISComputer2:isValid()
	return true;
end

function ISComputer2:update()
end

function ISComputer2:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestAFlash");
end

function ISComputer2:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestAFlash");
end

function ISComputer2:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestAEmptyFlash");
end

function ISComputer2:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end

-- КАИН ЗАДАНИЕ НА АВТОМАТ 2
ISComputer3 = ISBaseTimedAction:derive("ISComputer3");

function ISComputer3:isValid()
	return true;
end

function ISComputer3:update()
end

function ISComputer3:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
self.character:getInventory():Remove("QuestADisk");
end

function ISComputer3:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
	self.character:getInventory():AddItem("NHM.QuestADisk");
end

function ISComputer3:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);		
			self.character:getInventory():AddItem("NHM.QuestAFullDisk");
end

function ISComputer3:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 950;
	return o;
end


--ФУНКЦИЯ КАЧАТЬ БЕГ
ISTrainRun = ISBaseTimedAction:derive("ISTrainRun");

function ISTrainRun:isValid()
	return true;
end

function ISTrainRun:update()
end

function ISTrainRun:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISTrainRun:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISTrainRun:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local g = getPlayer():getPerkLevel(Perks.Sprinting);
	getPlayer():getXp():AddXP(Perks.Sprinting, 7.5*(1+g));
end

function ISTrainRun:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end

--ФУНКЦИЯ КАЧАТЬ ЛЕГКИЙ ШАГ
ISTrainLightfoot = ISBaseTimedAction:derive("ISTrainLightfoot");

function ISTrainLightfoot:isValid()
	return true;
end

function ISTrainLightfoot:update()
end

function ISTrainLightfoot:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISTrainLightfoot:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISTrainLightfoot:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local g = getPlayer():getPerkLevel(Perks.Lightfoot);
	getPlayer():getXp():AddXP(Perks.Lightfoot, 7.5*(1+g));
end

function ISTrainLightfoot:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end

--ФУНКЦИЯ КАЧАТЬ ПРОВОРНОСТЬ
ISTrainNimble = ISBaseTimedAction:derive("ISTrainNimble");

function ISTrainNimble:isValid()
	return true;
end

function ISTrainNimble:update()
end

function ISTrainNimble:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISTrainNimble:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISTrainNimble:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local g = getPlayer():getPerkLevel(Perks.Nimble);
	getPlayer():getXp():AddXP(Perks.Nimble, 7.5*(1+g));
end

function ISTrainNimble:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end

--ФУНКЦИЯ КАЧАТЬ СКРЫТНОСТЬ
ISTrainSneak = ISBaseTimedAction:derive("ISTrainSneak");

function ISTrainSneak:isValid()
	return true;
end

function ISTrainSneak:update()
end

function ISTrainSneak:start()
self.sound = self.character:playSound("TrashSearch");
local radius = 20 
addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), radius, radius)
end

function ISTrainSneak:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function ISTrainSneak:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	ISBaseTimedAction.perform(self);
	local g = getPlayer():getPerkLevel(Perks.Sneak);
	getPlayer():getXp():AddXP(Perks.Sneak, 7.5*(1+g));
end

function ISTrainSneak:new(character, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end