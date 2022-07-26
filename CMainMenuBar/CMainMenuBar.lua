--(Перемещение всех панелей)
local sar = CreateFrame("Frame")
sar:RegisterEvent("PLAYER_ENTERING_WORLD")
local function eventHandler(self,event)
if event == "PLAYER_ENTERING_WORLD" then
MainMenuBar:ClearAllPoints()
MainMenuBar:SetPoint('BOTTOM', UIParent, -147, 0)
MainMenuBar.SetPoint = function() end
VehicleMenuBar:ClearAllPoints()
VehicleMenuBar:SetPoint("BOTTOM",UIparent, 0,0)
VehicleMenuBar.SetPoint = function() end
end
end
sar:SetScript("OnEvent",eventHandler)

--(Верхние панели)
MultiBarBottomLeftButton1:ClearAllPoints()
MultiBarBottomLeftButton1:SetPoint("BOTTOMLEFT", 0, 1)

--(Панель стоек/форм )
BonusActionBarTexture0:SetTexture("Interface\\AddOns\\CMainMenuBar\\tex\\jopa.blp");
BonusActionBarTexture1:SetTexture("Interface\\AddOns\\CMainMenuBar\\tex\\jopa.blp");
BonusActionBarFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0)
BonusActionButton1:ClearAllPoints()
BonusActionButton1:SetPoint("BOTTOMLEFT", BonusActionBarFrame, "BOTTOMLEFT", 5.2, 4)
if not BonusActionBarFrame:IsShown() then
	BonusActionBarFrame:Hide()
end

--(Отключение/скрытие грифонов)
--MainMenuBarLeftEndCap:Hide();MainMenuBarRightEndCap:Hide()

--(Перенос строчки)
MultiBarBottomRightButton1:ClearAllPoints();
MultiBarBottomRightButton1:SetPoint("RIGHT", MultiBarBottomLeftButton12, 80.8, 0);
MultiBarBottomRightButton7:ClearAllPoints();
MultiBarBottomRightButton7:SetPoint("RIGHT", ActionButton12, 80.8, 0);


--(Панель стоек)
ShapeshiftButton1:ClearAllPoints()
ShapeshiftButton1:SetPoint("CENTER", -6, 2) --< ПЕРЕДВИНУТЬ ПАНЕЛЬ СТОЕК ТУТ!

--(Перемещение хоткеев)
hooksecurefunc('ActionButton_UpdateHotkeys', function(self)
    local hotkey = _G[self:GetName()..'HotKey']
    hotkey:ClearAllPoints()
    hotkey:SetPoint('TOPRIGHT', self, -2, -3.6) --< ПЕРЕДВИНУТЬ ТУТ!
end)

--(Полоски репутации/опыта)
function ReputationWatchBar_Update(newLevel)
	local name, reaction, min, max, value = GetWatchedFactionInfo();
	local visibilityChanged = nil;
	if ( not newLevel ) then
		newLevel = UnitLevel("player");
	end
	if ( name ) then
		if ( not ReputationWatchBar:IsShown() ) then
			visibilityChanged = 1;
		end

		max = max - min;
		value = value - min;
		min = 0;
		ReputationWatchStatusBar:SetMinMaxValues(min, max);
		ReputationWatchStatusBar:SetValue(value);
		ReputationWatchStatusBarText:SetText(name.." "..value.." / "..max);
		local color = FACTION_BAR_COLORS[reaction];
		ReputationWatchStatusBar:SetStatusBarColor(color.r, color.g, color.b);
		ReputationWatchBar:Show();

		ReputationWatchStatusBar:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()-1);
		if ( newLevel < MAX_PLAYER_LEVEL ) then
			ReputationWatchStatusBar:SetHeight(8);
			ReputationWatchStatusBar:SetWidth(804);
			ReputationWatchBar:ClearAllPoints();
			ReputationWatchBar:SetPoint("BOTTOM", MainMenuBar, "TOP", 146, -3);
			ReputationWatchStatusBarText:SetPoint("CENTER", ReputationWatchBarOverlayFrame, "CENTER", 0, 3);
			for i = 0, 3 do _G['ReputationWatchBarTexture'..i]:SetTexture'Interface\\AddOns\\CMainMenuBar\\tex\\repapoloska.blp' end
			ReputationWatchBarTexture0:ClearAllPoints();
			ReputationWatchBarTexture0:SetPoint("CENTER", ReputationWatchStatusBar, 494, 1);
			ReputationWatchBarTexture1:ClearAllPoints();
			ReputationWatchBarTexture1:SetPoint("CENTER", ReputationWatchStatusBar, 238, 1);
			ReputationWatchBarTexture2:ClearAllPoints();
			ReputationWatchBarTexture2:SetPoint("CENTER", ReputationWatchStatusBar, -18, 1);
			ReputationWatchBarTexture3:ClearAllPoints();
			ReputationWatchBarTexture3:SetPoint("CENTER", ReputationWatchStatusBar, -274, 1);

			ReputationXPBarTexture0:Hide();
			ReputationXPBarTexture1:Hide();
			ReputationXPBarTexture2:Hide();
			ReputationXPBarTexture3:Hide();

			MainMenuExpBar:Show();
			MainMenuExpBar.pauseUpdates = nil;
			MainMenuBarMaxLevelBar:Hide();
		else
			ReputationWatchStatusBar:SetHeight(13);
			ReputationWatchBar:ClearAllPoints();
			ReputationWatchBar:SetPoint("TOP", MainMenuBar, "TOP", 147, 0);
			ReputationWatchStatusBarText:SetPoint("CENTER", ReputationWatchBarOverlayFrame, "CENTER", 0, 1);
			ReputationWatchStatusBar:SetFrameStrata("LOW");
			ReputationWatchBarTexture0:Hide();
			ReputationWatchBarTexture1:Hide();
			ReputationWatchBarTexture2:Hide();
			ReputationWatchBarTexture3:Hide();

			ReputationXPBarTexture0:Show();
			ReputationXPBarTexture1:Show();
			ReputationXPBarTexture2:Show();
			ReputationXPBarTexture3:Show();
	
			ExhaustionTick:Hide();

			MainMenuExpBar:Hide();
			MainMenuExpBar.pauseUpdates = true;
			MainMenuBarMaxLevelBar:Hide();
		end
		
	else
		if ( ReputationWatchBar:IsShown() ) then
			visibilityChanged = 1;
		end
		ReputationWatchBar:Hide();
		if ( newLevel == MAX_PLAYER_LEVEL ) then
			MainMenuExpBar:Hide();
			MainMenuExpBar.pauseUpdates = true;
			MainMenuBarMaxLevelBar:Show();
			ExhaustionTick:Hide();
		else
			MainMenuExpBar:Show();
			MainMenuExpBar.pauseUpdates = nil;
			MainMenuBarMaxLevelBar:Hide();
		end
	end
	if ( visibilityChanged ) then
		UIParent_ManageFramePositions();
		updateContainerFrameAnchors();
	end
end

--(Полоса опыта)
ReputationWatchStatusBar:SetWidth(804);
MainMenuExpBar:SetWidth(804)
MainMenuExpBar:SetHeight(9)
MainMenuExpBar:ClearAllPoints()
MainMenuExpBar:SetPoint('CENTER', 147, 22) --< ПЕРЕДВИНУТЬ ТУТ! Полоска опыта.
MainMenuExpBar:SetFrameStrata("LOW");

--(Полоса максимального уровня)
MainMenuBarMaxLevelBar:ClearAllPoints()
MainMenuBarMaxLevelBar:SetWidth(256)
MainMenuBarMaxLevelBar:SetHeight(9)
MainMenuBarMaxLevelBar:SetPoint('CENTER', 256, 11)
MainMenuBarMaxLevelBar:SetFrameStrata("BACKGROUND")

--(Замена текстур полосок)
for i = 0, 3 do _G['MainMenuXPBarTexture'..i]:SetTexture'Interface\\AddOns\\CMainMenuBar\\tex\\SUKA.blp' end
for i = 0, 3 do _G['ReputationXPBarTexture'..i]:SetTexture'Interface\\AddOns\\CMainMenuBar\\tex\\SUKA.blp' end
for i = 0, 3 do _G['MainMenuMaxLevelBar'..i]:SetTexture'Interface\\AddOns\\CMainMenuBar\\tex\UI-MainMenuBar-MaxLevel.blp' end

--(расположение полосок опыта)
MainMenuMaxLevelBar2:ClearAllPoints();
MainMenuMaxLevelBar2:SetPoint("CENTER", MainMenuMaxLevelBar1, 38, 0);

MainMenuXPBarTexture0:ClearAllPoints();
MainMenuXPBarTexture0:SetPoint("CENTER", MainMenuMaxLevelBar1, -256, 2);
MainMenuXPBarTexture1:ClearAllPoints();
MainMenuXPBarTexture1:SetPoint("CENTER", MainMenuMaxLevelBar1, 0, 2);
MainMenuXPBarTexture2:ClearAllPoints();
MainMenuXPBarTexture2:SetPoint("CENTER", MainMenuMaxLevelBar1, 256, 2);
MainMenuXPBarTexture3:ClearAllPoints();
MainMenuXPBarTexture3:SetPoint("CENTER", MainMenuMaxLevelBar1, 512, 2);

ReputationXPBarTexture0:ClearAllPoints();
ReputationXPBarTexture0:SetPoint("CENTER", ReputationWatchStatusBar, -275, 1);
ReputationXPBarTexture1:ClearAllPoints();
ReputationXPBarTexture1:SetPoint("CENTER", ReputationWatchStatusBar, -19, 1);
ReputationXPBarTexture2:ClearAllPoints();
ReputationXPBarTexture2:SetPoint("CENTER", ReputationWatchStatusBar, 237, 1);
ReputationXPBarTexture3:ClearAllPoints();
ReputationXPBarTexture3:SetPoint("CENTER", ReputationWatchStatusBar, 493, 1);
	
--
BINDING_HEADER_CMainMenuBar = "CMainMenuBar";
local CMainMenuBarVisibleBar;

function CMainMenuBar_OnLoad(self)
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");	
end

function CMainMenuBar_OnEvent(self, event, ...)
	if (event == "ADDON_LOADED") then
		local addonName = ...;
		if (addonName == "CMainMenuBar") then
			CMainMenuBar_Initialize();
		end
		return;
	elseif (event == "PLAYER_ENTERING_WORLD") then
		CMainMenuBar_ShowBar(bar);
		return;
	end
end

-- (Initialize)
function CMainMenuBar_Initialize()
	MainMenuBar:SetWidth(512);
	MainMenuBarLeftEndCap:SetWidth(115);
	MainMenuBarLeftEndCap:SetHeight(115);
	MainMenuBarLeftEndCap:SetPoint("BOTTOM", MainMenuBarArtFrame, "BOTTOM", -284, 0);
	MainMenuBarRightEndCap:SetWidth(115);
	MainMenuBarRightEndCap:SetHeight(115);
	MainMenuBarRightEndCap:SetPoint("BOTTOM", MainMenuBarArtFrame, "BOTTOM", 578, 0);

	hooksecurefunc("VehicleMenuBar_MoveMicroButtons", myVehicleMenuBar_MoveMicroButtons);
end

--(Создание текстур)	
local brr = CreateFrame("Frame",nil,UIParent)
	brr:SetFrameStrata("BACKGROUND")
	brr:SetWidth(512)
	brr:SetHeight(256)

local rrr = brr:CreateTexture(nil,"BACKGROUND")
	rrr:SetTexture("Interface\\AddOns\\CMainMenuBar\\tex\\bagpack.blp")
	rrr:SetAllPoints(brr)
	brr.texture = rrr
	brr:SetScale(0.99)
	brr:Show()

local x = CreateFrame("Frame",nil,UIParent)
	x:SetFrameStrata("BACKGROUND")
	x:SetWidth(256)
	x:SetHeight(256)
	x:SetScale(1)
	x:SetFrameStrata("MEDIUM")

local y = x:CreateTexture(nil,"BACKGROUND")
	y:SetTexture("Interface\\AddOns\\CMainMenuBar\\tex\\tex3.blp")
	y:SetAllPoints(x)
	x.texture = y
	x:Show()

local by = CreateFrame("Frame",nil,UIParent)
	by:SetFrameStrata("BACKGROUND")
	by:SetWidth(256)
	by:SetHeight(256)
	by:SetFrameStrata("MEDIUM")

local rx = by:CreateTexture(nil,"BACKGROUND")
	rx:SetTexture("Interface\\AddOns\\CMainMenuBar\\tex\\tex4.blp")
	rx:SetAllPoints(by)
	by.texture = rx
	by:Show()

local bx = CreateFrame("Frame",nil,UIParent)
	bx:SetFrameStrata("BACKGROUND")
	bx:SetWidth(256)
	bx:SetHeight(256)
	bx:SetFrameStrata("MEDIUM")

local ry = bx:CreateTexture(nil,"BACKGROUND")
	ry:SetTexture("Interface\\AddOns\\CMainMenuBar\\tex\\tex5.blp")
	ry:SetAllPoints(bx)
	bx.texture = ry
	bx:Show()

local a = CreateFrame("Frame",nil,UIParent)
	a:SetFrameStrata("BACKGROUND")
	a:SetWidth(256)
	a:SetHeight(256)
	a:SetScale(1)
	a:SetFrameStrata("MEDIUM")

local s = a:CreateTexture(nil,"BACKGROUND")
	s:SetTexture("Interface\\AddOns\\CMainMenuBar\\tex\\tex6.blp")
	s:SetAllPoints(a)
	a.texture = s
	a:Show()
--
function CMainMenuBar_ShowBar(bar)
		a:SetPoint("BOTTOMRIGHT", MainMenuBarArtFrame, 296, 0);		
		x:SetPoint("BOTTOM", MainMenuBarArtFrame, "BOTTOM", -128, 0);
		by:SetPoint("BOTTOM", MainMenuBarArtFrame, "BOTTOM", 128, 0);
		bx:SetPoint("BOTTOM", MainMenuBarArtFrame, "BOTTOM", 384, 0);
		brr:SetPoint("CENTER", MainMenuBarBackpackButton, -125, -22);
		CharacterMicroButton:SetPoint("BOTTOMLEFT", MainMenuBarBackpackButton, "CENTER", -233, -62.9);
		MainMenuBarPageNumber:SetPoint("CENTER", MainMenuBar, "TOPRIGHT", 28, -31);
        ActionBarUpButton:SetPoint("CENTER", MainMenuBar, "BOTTOMLEFT", 521.9, 31.2);
        ActionBarDownButton:SetPoint("CENTER", MainMenuBar, "BOTTOMLEFT", 521.9, 12);
		
		--	Сумки	
		MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -6, 46); --ВОООТ ТУТ МЕНЯЙ	
        CharacterBag0Slot:ClearAllPoints();
        CharacterBag0Slot:SetPoint("BOTTOMLEFT", MainMenuBarBackpackButton, "CENTER", -55.7, -20);
        CharacterBag1Slot:ClearAllPoints();
        CharacterBag1Slot:SetPoint("CENTER", CharacterBag0Slot, -33.5, 0);
        CharacterBag2Slot:ClearAllPoints();
        CharacterBag2Slot:SetPoint("CENTER", CharacterBag0Slot, -67, 0);
        CharacterBag3Slot:ClearAllPoints();
        CharacterBag3Slot:SetPoint("CENTER", CharacterBag0Slot, -101, 0);
		KeyRingButton:SetAlpha(0);
		KeyRingButton:EnableMouse(false);
		
		-- Размер сумок
		for _, symki in pairs({
            _G['CharacterBag0Slot'],
            _G['CharacterBag1Slot'],
            _G['CharacterBag2Slot'],
            _G['CharacterBag3Slot'],
        }) do
            symki:SetScale(0.95)
        end
		
CMainMenuBarVisibleBar = bar;
end

function myVehicleMenuBar_MoveMicroButtons(skinName)
	if (not skinName) then
		CMainMenuBar_ShowBar(CMainMenuBarVisibleBar);
	end
end

-- (чтобы не слетала оконтовка бутонов при открытии спелбука:)
hooksecurefunc("ActionButton_ShowGrid", function(btn)
    local buttonTexture = _G[btn:GetName().."NormalTexture"]:SetVertexColor(1, 1, 1, 1)
end)

--(Изменение размера панелей)
for _, paneli in pairs({
    _G['MainMenuBar'],
    _G['MultiBarBottomLeft'],
    _G['MultiBarBottomRight'],
    _G['MultiBarLeft'],
    _G['MultiBarRight'],	
}) do
    paneli:SetScale(1)
end

a:SetScale(1)	
x:SetScale(1)
by:SetScale(1)
bx:SetScale(1)
brr:SetScale(1)

--(Скрыть дефолт текстуры)
MainMenuBarTexture0:Hide()
MainMenuBarTexture1:Hide()
MainMenuBarTexture2:Hide()
MainMenuBarTexture3:Hide()





--local bottom = function() end
    --MainMenuBar:ClearAllPoints()  MainMenuBar:SetPoint("BOTTOM",UIparent, -147, 0)  MainMenuBar.ClearAllPoints = bottom MainMenuBar.SetPoint = bottom
   -- VehicleMenuBar:ClearAllPoints()  VehicleMenuBar:SetPoint("BOTTOM",UIparent, 0,0)  VehicleMenuBar.ClearAllPoints = bottom VehicleMenuBar.SetPoint = bottom 
	 
local MAINMENU_SLIDETIME = 0.30;
local MAINMENU_GONEYPOS = 130;	--Distance off screen for MainMenuBar to be completely hidden
local MAINMENU_XPOS = 0;
local MAINMENU_VEHICLE_ENDCAPPOS = 548;


local function MainMenuBar_GetAnimPos(self, fraction)	
	return "BOTTOM", UIParent, "BOTTOM", MAINMENU_XPOS, (sin(fraction*90+90)-1) * MAINMENU_GONEYPOS;
end

local function MainMenuBar_GetRightABPos(self, fraction)

	local finaloffset;
	if ( SHOW_MULTI_ACTIONBAR_3 and SHOW_MULTI_ACTIONBAR_4 ) then
		finaloffset = 100;
	else
		finaloffset = 62;
	end
	
	return "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", (sin(fraction*90)) * finaloffset, 98;
end

local function MainMenuBar_GetRightABPos2(self, fraction)

	local finaloffset;
	if ( SHOW_MULTI_ACTIONBAR_3 and SHOW_MULTI_ACTIONBAR_4 ) then
		finaloffset = 100;
	else
		finaloffset = 62;
	end
	
	return "BOTTOM", UIParent, "BOTTOM", MAINMENU_XPOS, (sin(fraction*90+90)-.64) * MAINMENU_GONEYPOS;
end

local function MainMenuBar_GetSeatIndicatorPos(self, fraction)

	local finaloffset;
	if ( SHOW_MULTI_ACTIONBAR_3 and SHOW_MULTI_ACTIONBAR_4 ) then
		finaloffset = -100;
	elseif ( SHOW_MULTI_ACTIONBAR_3 ) then
		finaloffset = -62;
	else
		finaloffset = 0;
	end
	
	return "TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", (cos(fraction*90)) * finaloffset, -13;
end

function MainMenuBar_AnimFinished(self)
	MainMenuBar.busy = false;
	if ( GetBonusBarOffset() > 0 ) then
		ShowBonusActionBar(true);
	else
		HideBonusActionBar(true);
	end
	MainMenuBar_UpdateArt(self);
end

function MainMenuBar_UnlockAB(self)
	MultiBarRight.ignoreFramePositionManager = nil;
end

function MainMenuBar_UpdateArt(self)
	if ( MainMenuBar.animComplete and not MainMenuBar.busy) then
		if ( UnitHasVehicleUI("player") ) then
			MainMenuBar_ToVehicleArt(self);
		else
			if ( MainMenuBar.state ~= "player" ) then
				MainMenuBar_ToPlayerArt(self)
			else
				MainMenuBarVehicleLeaveButton_Update();
			end
		end
	end
end

local AnimDataTable = {
	MenuBar_Slide = {
		totalTime = MAINMENU_SLIDETIME,
		updateFunc = "SetPoint",
		getPosFunc = MainMenuBar_GetAnimPos,
	},
	ActionBar_Slide = {
		totalTime = MAINMENU_SLIDETIME,
		updateFunc = "SetPoint",
		getPosFunc = MainMenuBar_GetRightABPos,
	},
	ActionBar_Slide2 = {
		totalTime = MAINMENU_SLIDETIME,
		updateFunc = "SetPoint",
		getPosFunc = MainMenuBar_GetRightABPos2,
	},
	SeatIndicator_Slide = {
		totalTime = MAINMENU_SLIDETIME,
		updateFunc = "SetPoint",
		getPosFunc = MainMenuBar_GetSeatIndicatorPos,
	},
}

function MainMenuBar_ToVehicleArt(self)
	MainMenuBar.state = "vehicle";
	
	SetUpAnimation(VehicleMenuBar, AnimDataTable.MenuBar_Slide, nil, true);
	
	MultiBarLeft:Hide();
	MultiBarRight:Hide();
	MultiBarBottomLeft:Hide();
	MultiBarBottomRight:Hide();
	--!
	MainMenuBarBackpackButton:Hide();
	brr:Hide();
	a:Hide();
	x:Hide();
	by:Hide();
	bx:Hide();
	
	MainMenuBar:Hide();
	VehicleMenuBar:SetPoint(MainMenuBar_GetAnimPos(VehicleMenuBar, 1))
	VehicleMenuBar:Show();
	PossessBar_Update(true);
	ShowBonusActionBar(true);	--Now, when we are switching to vehicle art we will ALWAYS be using the BonusActionBar
	UIParent_ManageFramePositions();	--This is called in PossessBar_Update, but it doesn't actually do anything but change an attribute, so it is worth keeping	
	
	VehicleMenuBar_SetSkin(VehicleMenuBar.skin, IsVehicleAimAngleAdjustable());
end

function MainMenuBar_ToPlayerArt(self)
	MainMenuBar.state = "player";
	
	MultiActionBar_Update();
	
	MultiBarRight:SetPoint(MainMenuBar_GetRightABPos(MultiBarRight, 1));
	
	SetUpAnimation(MainMenuBar, AnimDataTable.MenuBar_Slide, nil, true);
	SetUpAnimation(MultiBarRight, AnimDataTable.ActionBar_Slide, MainMenuBar_UnlockAB, true);
	SetUpAnimation(VehicleSeatIndicator, AnimDataTable.SeatIndicator_Slide, nil, true);
	
	
	--!
	MainMenuBarBackpackButton:Show();
	brr:Show();
	a:Show();
	x:Show();
	by:Show();
	bx:Show();
	MainMenuBarBackpackButton:SetPoint(MainMenuBar_GetRightABPos2(MainMenuBarBackpackButton, 1));
	SetUpAnimation(MainMenuBarBackpackButton, AnimDataTable.ActionBar_Slide2, MainMenuBar_UnlockAB, true);
	
	VehicleMenuBar:Hide();
	
	
	MainMenuBar:Show();

	PossessBar_Update(true);
	if ( GetBonusBarOffset() > 0 ) then
		ShowBonusActionBar(true);
	else
		HideBonusActionBar(true);
	end
	--UIParent_ManageFramePositions()	--This is called in PossessBar_Update
	MainMenuBarVehicleLeaveButton_Update();
	
	VehicleMenuBar_MoveMicroButtons();
	VehicleMenuBar_ReleaseSkins();
end

function MainMenuBarVehicleLeaveButton_OnLoad(self)
	self:RegisterEvent("UPDATE_BONUS_ACTIONBAR");
	self:RegisterEvent("UPDATE_MULTI_CAST_ACTIONBAR");
	self:RegisterEvent("VEHICLE_UPDATE");
end

function MainMenuBarVehicleLeaveButton_OnEvent(self, event, ...)
	MainMenuBarVehicleLeaveButton_Update();
end

function MainMenuBarVehicleLeaveButton_Update()
	if ( CanExitVehicle() ) then
		MainMenuBarVehicleLeaveButton:ClearAllPoints();
		if ( IsPossessBarVisible() ) then
			MainMenuBarVehicleLeaveButton:SetPoint("LEFT", PossessButton2, "RIGHT", 30, 0);
		elseif ( GetNumShapeshiftForms() > 0 ) then
			MainMenuBarVehicleLeaveButton:SetPoint("LEFT", "ShapeshiftButton"..GetNumShapeshiftForms(), "RIGHT", 30, 0);
		elseif ( HasMultiCastActionBar() ) then
			MainMenuBarVehicleLeaveButton:SetPoint("LEFT", MultiCastActionBarFrame, "RIGHT", 30, 0);
		else
			MainMenuBarVehicleLeaveButton:SetPoint("LEFT", PossessBarFrame, "LEFT", 10, 0);
		end
		MainMenuBarVehicleLeaveButton:Show();
		ShowPetActionBar(true);
	else
		MainMenuBarVehicleLeaveButton:Hide();
		ShowPetActionBar(true);
	end

	UIParent_ManageFramePositions();
end

function MainMenuBar_OnLoad(self)
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("BAG_UPDATE");
	self:RegisterEvent("ACTIONBAR_PAGE_CHANGED");
	self:RegisterEvent("KNOWN_CURRENCY_TYPES_UPDATE");
	self:RegisterEvent("CURRENCY_DISPLAY_UPDATE");
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("UNIT_ENTERING_VEHICLE");
	self:RegisterEvent("UNIT_ENTERED_VEHICLE");
	self:RegisterEvent("UNIT_EXITING_VEHICLE");
	self:RegisterEvent("UNIT_EXITED_VEHICLE");
	
	MainMenuBar.state = "player";
	MainMenuBarPageNumber:SetText(GetActionBarPage());
end

local firstEnteringWorld = true;
function MainMenuBar_OnEvent(self, event, ...)
	local arg1, arg2, arg3, arg4, arg5 = ...;
	if ( event == "ACTIONBAR_PAGE_CHANGED" ) then
		MainMenuBarPageNumber:SetText(GetActionBarPage());
	elseif ( event == "KNOWN_CURRENCY_TYPES_UPDATE" or event == "CURRENCY_DISPLAY_UPDATE" ) then
		local showTokenFrame, showTokenFrameHonor = GetCVarBool("showTokenFrame"), GetCVarBool("showTokenFrameHonor");
		if ( not showTokenFrame or not showTokenFrameHonor ) then
			local name, isHeader, isExpanded, isUnused, isWatched, count, icon, extraCurrencyType;
			local hasPVPTokens, hasNormalTokens;
			for index=1, GetCurrencyListSize() do
				name, isHeader, isExpanded, isUnused, isWatched, count, extraCurrencyType, icon = GetCurrencyListInfo(index);
				if ( (not isHeader) and (extraCurrencyType > 0) and (count>0) ) then
					hasPVPTokens = true;
				elseif ( (not isHeader) and (extraCurrencyType <= 0) and (count>0) ) then
					hasNormalTokens = true;
				end
			end
			if ( (not showTokenFrame) and (hasNormalTokens) ) then
				SetCVar("showTokenFrame", 1);
				if ( not CharacterFrame:IsVisible() ) then
					SetButtonPulse(CharacterMicroButton, 60, 1);
				end
				if ( not TokenFrame:IsVisible() ) then
					SetButtonPulse(CharacterFrameTab5, 60, 1);
				end
			end
			if ( (not showTokenFrameHonor) and (hasPVPTokens) ) then
				SetCVar("showTokenFrameHonor", 1);
				if ( not CharacterFrame:IsVisible() ) then
					SetButtonPulse(CharacterMicroButton, 60, 1);
				end
				if ( not TokenFrame:IsVisible() ) then
					SetButtonPulse(CharacterFrameTab5, 60, 1);
				end
			end
			if ( hasNormalTokens or hasPVPTokens or showTokenFrame or showTokenFrameHonor ) then
				TokenFrame_LoadUI();
				TokenFrame_Update();
				BackpackTokenFrame_Update();
			else
				CharacterFrameTab5:Hide();
			end
		else
			TokenFrame_LoadUI();
			TokenFrame_Update();
			BackpackTokenFrame_Update();
		end
	elseif ( event == "PLAYER_ENTERING_WORLD" ) then
		MainMenuBar_UpdateKeyRing();
		if ( not firstEnteringWorld ) then
			MainMenuBar_ToPlayerArt();
		end
		firstEnteringWorld = false;
	elseif ( event == "BAG_UPDATE" ) then
		if ( not GetCVarBool("showKeyring") ) then
			if ( HasKey() ) then
				-- Show Tutorial and flash keyring
				SetButtonPulse(KeyRingButton, 60, 1);
				SetCVar("showKeyring", 1);
			end
			MainMenuBar_UpdateKeyRing();
		end
	elseif ( (event == "UNIT_ENTERED_VEHICLE") and (arg1=="player") ) then
		MainMenuBar.animComplete = true;
		MainMenuBar_UpdateArt(self);
	elseif ( (event == "UNIT_EXITED_VEHICLE") and (arg1=="player") )then
		MainMenuBar.animComplete = true;
		MainMenuBar_UpdateArt(self);
	elseif ( (event == "UNIT_ENTERING_VEHICLE") and (arg1=="player") ) then
		MainMenuBar.busy = true;
		MainMenuBar.animComplete = false;
		VehicleMenuBar.skin = arg3;
		if ( arg2 ) then	--We are going to show a vehicle UI
			if ( MainMenuBar.state == "vehicle" ) then
				MultiBarRight.ignoreFramePositionManager = true;
				SetUpAnimation(VehicleMenuBar, AnimDataTable.MenuBar_Slide, MainMenuBar_AnimFinished, false);
			else
				MainMenuBar.state = "vehicle";
				MultiBarRight.ignoreFramePositionManager = true;
				SetUpAnimation(MultiBarRight, AnimDataTable.ActionBar_Slide, nil, false);
				SetUpAnimation(MainMenuBar, AnimDataTable.MenuBar_Slide, MainMenuBar_AnimFinished, false);
				SetUpAnimation(VehicleSeatIndicator, AnimDataTable.SeatIndicator_Slide, nil, false);
			end
		else
			if ( MainMenuBar.state == "vehicle" ) then
				MultiBarRight.ignoreFramePositionManager = true;
				SetUpAnimation(VehicleMenuBar, AnimDataTable.MenuBar_Slide, MainMenuBar_AnimFinished, false);
				--MainMenuBar_SetUpAnimation(MultiBarRight, true, MAINMENU_SLIDETIME, MainMenuBar_GetRightABPos, nil, true);
			else
				MainMenuBar.busy = false;
				MainMenuBar.animComplete = true;
				MainMenuBarVehicleLeaveButton_Update();
			end
		end
	elseif ( (event == "UNIT_EXITING_VEHICLE") and (arg1=="player") ) then
		if ( MainMenuBar.state ~= "player" ) then
			MainMenuBar.busy = true;
			MainMenuBar.animComplete = false;
			MultiBarRight.ignoreFramePositionManager = true;
			SetUpAnimation(VehicleMenuBar, AnimDataTable.MenuBar_Slide, MainMenuBar_AnimFinished, false);
		else
			if ( GetBonusBarOffset() > 0 ) then
				ShowBonusActionBar();
			else
				HideBonusActionBar();
			end
		end
		
	end
end

