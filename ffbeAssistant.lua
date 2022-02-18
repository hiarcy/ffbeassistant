-- ffbeAssistant
-- F A R M!
-- Tested on 720x1280

-- MASTER TODO LIST
-- 1. think of a better way to buffer text on textviews
-- 2. reorganize the whole of chain assist

-------------------------------
---------- VARIABLES ----------
-------------------------------
-- Global Settings
Settings:setCompareDimension(true, 1440)
Settings:setScriptDimension(true, 1440)
Settings:set("AutoWaitTimeout", 0)
Settings:set("MinSimilarity", 0.8)

setImmersiveMode(true)
--autoGameArea(true)
setButtonPosition(0, 2560)
setContinueClickTiming(50, 450)
setDragDropTiming(100, 250)


SOURCE_CURRENTVERSION 	= "1.42"
IMAGE_CURRENTVERSION 	= "1.41"

----------------------------
---------- Maybe? ----------
TEXT_SPACE_BUFFER 		= " "
TEXT_TAB_BUFFER 		= "\t"

TITLE 					= "ffbeAssistant"
TITLE_CHAINASSIST 		= "ffbeAssistant - Chain Assist"
TITLE_FARM 				= "ffbeAssistant - Farm"
TITLE_FINDDUNGEON		= "ffbeAssistant - Dungeon List"
TITLE_MAINTENANCE		= "ffbeAssistant - Maintenance"

COMPANION_OPTIONS_LABEL	= "Companion options: "
DELAY_LABEL 			= "Delay:"
DUNGEON_SELECT_LABEL	= "Select Dungeon:"
FLAGS_LABEL				= "Flags:"
MAINTENANCE_LABEL		= "Set maintenance options:"
OPTIONS_LABEL 			= "Options:"
ORDER_LABEL 			= "Order:"
RUNOPTIONS_LABEL 		= "Run options:"

CAPRESETS_LABEL 		= "Presets:"
CA_MANUAL_LABEL 		= "Set manual presets:"
CAUNIT1_LABEL 			= "Unit 1"
CAUNIT2_LABEL 			= "Unit 2"
CAUNIT3_LABEL 			= "Unit 3"
CAUNIT4_LABEL 			= "Unit 4"
CAUNIT5_LABEL 			= "Unit 5"
CAUNIT6_LABEL 			= "Unit 6"

ARENA 					= "Arena"
CACTUARFUSION 			= "Cactuar Fusion"
CHAINASSIST 			= "Chain Assist"
DUNGEON 				= "Dungeon"
FARM 					= "Farm"
MAINTENANCE				= "Maintenance"
MOGKING 				= "Mog King"
MULTISUMMON 			= "Multi-Summon"
RAID 					= "Raid"
REPEAT 					= "Repeat"
STEELCASTLE 			= "Steel Castle"


SCRIPTEXIT_DEFAULT_DESCRIPTION		= ":O"
SCRIPTEXIT_FINISHED_DESCRIPTION		= "Finished!"

CASSIST_RELOAD_DESCRIPTION 			= "Delay before reloading again (ms): "
CASSIST_EXIT_DESCRIPTION 			= "CA: Presets passed are incorrect!"
COMPANION_DEFAULT_DESCRIPTION 		= "Default (select first)"
COMPANION_BONUS_DESCRIPTION 		= "Select bonus unit"
COMPANION_NONE_DESCRIPTION 			= "Select no companion"
DUNGEONS_FOUND_DESCRIPTION 			= "Dungeon #"
DUNGEONS_NONE_DESCRIPTION 			= "No dungeons found!"
FARM_LAPISREFILL_DESCRIPTION 		= "Lapis refill"
FARM_WAIT_DESCRIPTION 				= "Wait between runs (seconds):"
LOOPCOUNT_DESCRIPTION 				= "Loop count (0 for inf): "
SCANRATE_DESCRIPTION 				= "Set scan rate (ms): "
STOPMSG_TIMESSUMMONED_DESCRIPTION 	= "Times summoned: "
STOPMSG_LOOPCOUNT_DESCRIPTION		= "Loop count: "
STOPMSG_LAPISREFILL_DESCRIPTION		= "Lapis refills: "
WHFINISHED_DESCRIPTION 				= "Done, starting next run!"


CFUSE_TOAST_DESCRIPTION				= "Cactuars fused: "
CFUSE2_TOAST_DESCRIPTION			= "Maxed cactuars: "
FARMSC_TOAST_DESCRIPTION			= "Waiting for enhancement to be selected..."
LAPISREFILL_TOAST_DESCRIPTION 		= "Lapis refreshes: "
WHANDLER_TOAST_DESCRIPTION			= " seconds before next run!"
WHANDLER_TIMER_TOAST_DESCRIPTION 	= "Timer (s): "


COMPANION_BONUS 		= 2
COMPANION_NONE 			= 3

FARM_OPTION 			= 1
FARM_CFUSE_OPTION		= 2 -- cactuar fusion
FARM_MSUMMON_OPTION 	= 3 -- multi-summon
FARM_CASSIST_OPTION 	= 4 -- chain assist
MAINTENANCE_OPTION		= 5

FARM_ARENA_OPTION		= 1 -- farm -> arena
FARM_DUNGEON_OPTION		= 2 -- farm -> dungeon
FARM_SCASTLE_OPTION		= 3 -- farm -> steel castle

RUN_REPEAT_OPTION		= 1 -- farm -> run option -> repeat
RUN_CASSIST_OPTION		= 2 -- farm -> run option -> chain assist


--SOURCE_FILE 			= "https://gitlab.com/hiarc/ffbeassistant/-/raw/master/ffbeAssistant.lua"
--VERSION_FILE 			= "https://gitlab.com/hiarc/ffbeassistant/-/raw/master/version.lua"

SOURCE_FILE 			= "https://drive.google.com/uc?id=18yyk7r_8yk21uyvPwJG44Jt1eIlr10GA"
IMAGE_FILE 				= "https://drive.google.com/uc?id=1-FJ29-WOVsTZB-KH8vFv5ZrysTjuVJIr"
VERSION_FILE 			= "https://drive.google.com/uc?id=1J7dhuT6_2wL1CECuXi1NAGwMbs2Q2sOL"

SOURCE_FILENAME 		= "ffbeAssistant.lua"
IMAGE_FILENAME 			= "imageUpdate.lua"
---------- Maybe? ----------
----------------------------


----- App Variables? -----
screen = Region(0, 0, 1440, 2560)


----- Global Variables -----
defaultArenaOpponent 	= Location(720, 1300)
defaultCompanion 		= Location(720, 1030)
defaultRaid 			= Location(410, 960)
middle 					= Location(720, 1280)

companionTab 			= 0

selectedDungeon 		= 0

loopCounter 			= 0
lapisRefillCounter 		= 0
maxedCactuarsCounter 	= 0

whIncrement 			= 2 		-- seconds, for example: 1 means we're counting every second
whTimeInterval 			= 10		-- seconds, for example: 10 means we're displaying every 10 seconds
standardWhWait 			= 3900		-- 3900 = 1hr 5mins

unit1 					= Location(332, 1664)
unit2 					= Location(332, 1920)
unit3 					= Location(332, 2176)
unit4 					= Location(1008, 1664)
unit5 					= Location(1008, 1920)
unit6 					= Location(1008, 2176)

-- Steel Castle --
scStart = true

-- Chain Assist --
caCurrentTurn 	= 0

caUnitOrder 	= {"1", "2", "3", "4", "5", "6"}

caPresets 		= {"None", "All", "1/4", "2/5", "3/6", "Scorn Doll Farm","caMaintArena", "caMaintMk", "caMaintRaid"}
caPresetsAll 	= {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}
caPresets14 	= {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
caPresets25 	= {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0}
caPresets36 	= {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0}
caPresetsDoll 	= {3, 2000, 2, 500, 1, 0, 1, 0, 2, 0, 0, 0}

-- Temp Maintenance CA --
caMaintArena 	= {2, 2000, 1, 0, 1, 0, 2, 0, 2, 0, 0, 0}
caMaintMk 		= {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
caMaintRaid 	= {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0}
--caMaintRaid2 	= {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

vmCaMaintArena 	= {2, 2000, 1, 0, 1, 0, 2, 0, 2, 0, 0, 0}
vmCaMaintRaid 	= {0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0}



----- Global Regions -----
topRegion 				= Region(0, 0, 1440, 1280)
bottomRegion 			= Region(0, 1280, 1440, 1280)
leftRegion 				= Region(0, 0, 720, 2560)
rightRegion 			= Region(720, 0, 720, 2560)
middleRegion 			= Region(0, 640, 1440, 1280)

combatButtonsRegion 	= Region(360, 2390, 710, 160)
combatReadyRegion1 		= Region(0, 1440, 160, 1120)
combatReadyRegion2 		= Region(700, 1440, 160, 1120)
combatUnitRegion 		= Region(0, 1520, 1440, 850)

companionRegion 		= Region(820, 680, 240, 1880)
companionBonusRegion 	= Region(40, 680, 280, 1880)
companionTabRegion 		= Region(0, 640, 1440, 200)

homeScreenTopRegion 	= Region(0, 300, 1440, 250)
homeScreenBottomRegion 	= Region(0, 1560, 1440, 670)

lapisRefillRegion 		= Region(0, 1120, 1440, 640)
labelRegion 			= Region(275, 440, 720, 200)

nextButtonRegion 		= Region(360, 1920, 740, 640)
xButtonRegion 			= Region(0, 0, 1440, 240)

arenaOpponentRegion 	= Region(960, 1120, 240, 1600)
dungeonIconRegion 		= Region(40, 640, 160, 1920)
multiSummonRegion 		= Region(0, 1480, 1440, 740)


----- Global Image Variables -----
startScreen 			= Pattern("01_titlescreen_inforestore.png")

backButton 				= Pattern("02_general_back.png")
closeButton 			= Pattern("02_general_close.png")
homeButton 				= Pattern("02_general_home.png")
limitText 				= Pattern("02_general_limittext.png")
mpText 					= Pattern("02_general_mptext.png")
nextButton 				= Pattern("02_general_next.png")
okButton 				= Pattern("02_general_ok.png")
reloadButton 			= Pattern("02_general_reload.png")
repeatButton 			= Pattern("02_general_repeat.png")
spinButton 				= Pattern("02_general_spin.png")
unitZeroHp 				= Pattern("02_general_unitzerohp.png")
xButton 				= Pattern("02_general_x.png")
xButton1 				= Pattern("02_general_x1.png")
xButton2 				= Pattern("02_general_x2.png")
xButton3 				= Pattern("02_general_x3.png")

maxAds 					= Pattern("02_general_maxAds.png")
resumeAds 				= Pattern("02_general_resumeAds.png")

homeScreenArena 		= Pattern("02_general_homescreenarena.png")
homeScreenExpedition 	= Pattern("02_general_homescreenexpedition.png")
homeScreenMenu 			= Pattern("02_general_homescreenmenu.png")
homeScreenRaidBubble 	= Pattern("02_general_homescreenraidbubble.png")
homeScreenWorld 		= Pattern("02_general_homescreenworld.png")

connectionErrorButton 	= Pattern("02_general_connectionerror.png")

lapisBackButton 		= Pattern("02_general_lapisback.png")
lapisConfirmButton 		= Pattern("02_general_lapisconfirm.png")
lapisRefill1 			= Pattern("02_general_lapisrefill.png")
lapisRefill2 			= Pattern("02_general_lapisrefill2.png")

companion 				= Pattern("02_general_companion.png")
companionBonusDrops 	= Pattern("02_general_companionbonusdrops.png")
noCompanion 			= Pattern("02_general_nocompanion.png")
selectCompanion 		= Pattern("02_general_selectcompanion.png")
selectYourOwn 			= Pattern("02_general_selectyourown.png")
companionTabEvent1 		= Pattern("02_general_companionevent1.png")
companionTabEvent2 		= Pattern("02_general_companionevent2.png")
companionTabFavorite 	= Pattern("02_general_companionfavorite.png")

combatBerserk 			= Pattern("02_general_combatberserk.png")
combatReady 			= Pattern("02_general_combatready.png")
connectionError 		= Pattern("02_general_connectionerror.png")
dailyPopup 				= Pattern("02_general_dailypopup.png")
companionDoNotRequest 	= Pattern("02_general_companiondonotrequest.png")

-- Arena --
arenaBegin 				= Pattern("03_arena_begin.png")
arenaLoss 				= Pattern("03_arena_loss.png")
arenaOpponent 			= Pattern("03_arena_opponentselect.png")
arenaOpponentConfirm 	= Pattern("03_arena_opponentconfirm.png")
arenaRestart 			= Pattern("03_arena_restart.png")
arenaRewards 			= Pattern("03_arena_rewards.png")
arenaRewards2 			= Pattern("03_arena_rewards2.png")
arenaSetup 				= Pattern("03_arena_setup.png")
arenaSetup2 			= Pattern("03_arena_setup2.png")
arenaWin 				= Pattern("03_arena_win.png")

-- Dungeon --
dungeonKeyRegion 		= Region(800, 1700, 475, 200)

dungeonDepart 			= Pattern("04_dungeon_depart.png")
dungeonDifficulty 		= Pattern("04_dungeon_difficulty.png")
dungeonIcon 			= Pattern("04_dungeon_icon.png")
dungeonKey 				= Pattern("04_dungeon_key.png")
dungeonNoKey 			= Pattern("04_dungeon_nokey.png")
dungeonReward 			= Pattern("04_dungeon_reward.png")

-- Steel Castle --
scStatSelection 		= {"Rare", "HP", "MP", "ATK", "DEF", "MAG", "SPR"}

scChallegeRegion 		= Region(600, 2130, 745, 250)
scRewardsLabelRegion 	= Region(0, 460, 530, 70)

scAbilityRewards 		= Pattern("05_steelcastle_abilityrewards.png")
scAbilityRewardsMenu 	= Pattern("05_steelcastle_abilityrewardsmenu.png")
scBattle 				= Pattern("05_steelcastle_battle.png")
scChallenge 			= Pattern("05_steelcastle_challenge.png")
scDepart 				= Pattern("05_steelcastle_depart.png")
scFinished 				= Pattern("05_steelcastle_finished.png")

-- Multi-Summon --
msButton 				= Pattern("06_multisummon_button.png")
msButton2 				= Pattern("06_multisummon_button2.png")
msTapScreen 			= Pattern("06_multisummon_tapscreen.png")
msRewards 				= Pattern("06_multisummon_rewards.png")
msRewards2 				= Pattern("06_multisummon_rewards2.png")
msNext 					= Pattern("06_multisummon_next.png")

-- Cactuar Fusion --
cfClick 				= Location(130, 1060) -- 65, 530 (720)
cfFuseUnit 				= Location(130, 1700)

cfDetailRegion 			= Region(0, 1880, 1440, 140)
cfFirstMaterialRegion 	= Region(0, 840, 280, 420)
cfFirstFuseRegion 		= Region(0, 1450, 280, 420)

cfMetalGigantuar 		= Pattern("07_cactuarfuse_metalgigantuar.png")
cfKingMetalMinituar 	= Pattern("07_cactuarfuse_kingmetalminituar.png")
cfEnhanceUnits 			= Pattern("07_cactuarfuse_enhanceunits.png")
cfFirstSelect 			= Pattern("07_cactuarfuse_firstselect.png")
cfFuseButton 			= Pattern("07_cactuarfuse_fuse.png")
cfMaterialUnits 		= Pattern("07_cactuarfuse_materialunits.png")
cfSelectBase 			= Pattern("07_cactuarfuse_selectbase.png")
cfZeroXpGil 			= Pattern("07_cactuarfuse_zeroxpgil.png")

-- Maintenance --
maintMk 				= 0
maintRaid 				= 0

-- Exploration --
mode 						= 0
direction 					= 0
length 						= 0
unitLocation 				= 0

stepUpOffset 				= -20
stepDownOffset 				= 140
stepLeftOffset 				= -100
stepRightOffset 			= 105

explorationRunOptions 		= 0 -- 0 is run, 1 is step

explorationMapSelections 	= {"Earth Shrine"}

explorationMenuRegion 		= Region(1000, 570, 440, 525)
explorationOptionsRegion 	= Region(970, 2350, 470, 210)

explorationBossConfirm 		= Pattern("08_general_explorationbossconfirm.png")
explorationBossCancel 		= Pattern("08_general_explorationbosscancel.png")
explorationContinue 		= Pattern("08_general_explorationcontinue.png")
explorationLeave 			= Pattern("08_general_explorationleave.png")
explorationOptions 			= Pattern("08_general_explorationmenu.png")

explorationLasswellUp 		= Pattern("08_general_explorationlasswellup.png"):similar(0.6)
explorationLasswellDown 	= Pattern("08_general_explorationlasswelldown.png"):similar(0.6)
explorationLasswellLeft 	= Pattern("08_general_explorationlasswellleft.png"):similar(0.6)
explorationLasswellRight 	= Pattern("08_general_explorationlasswellright.png"):similar(0.6)

explorationRainUp 			= Pattern("08_general_explorationrainup.png"):similar(0.6)
explorationRainDown 		= Pattern("08_general_explorationraindown.png"):similar(0.6)
explorationRainLeft 		= Pattern("08_general_explorationrainleft.png"):similar(0.6)
explorationRainRight 		= Pattern("08_general_explorationrainright.png"):similar(0.6)

-- Exploration Paths
earthShrineExploration 		= {"run,up,3000", "step,down,1", "run,left,4000", "step,right,3", "run,up,4000", "step,down,1", "run,right,6000", "step,left,3", "run,down,4000", "step,right,3", "step,down,1", "step,up,1", "step,left,3", "run,up,7000", "step,right,3", "run,up,3000", "step,left,3", "run,up,4000", "run,down,4000", "step,right,3", "run,down,3000", "step,up,1", "run,left,6000", "step,right,6", "run,up,4000"}


-- King Mog Lost Maps --
kmlmSelectionMenu 			= Pattern("09_kingmogmaps_selectionmenu.png")
kmlmSelectionYes 			= Pattern("09_kingmogmaps_selectionyes.png")

-- KMM Exploration Path --
kmlmMegacrystExploration 	= {"run,up,2000", "step,right,2", "step,up,1", "run,right,1000", "run,up,1000", "run,left,1000", "run,up,3000", "run,right,2000", "run,up,2000", "run,up,1000", "run,left,2000", "step,right,1", "run,up,3000", "run,right,1000", "step,down,4", "step,right,3", "step,left,3", "run,up,2000", "exit,0"}


-------------------------------
---------- FUNCTIONS ----------
-------------------------------
function farm()
	while (state == 0) do
		snapshot()
		if (farmOptions == FARM_ARENA_OPTION) then 			-- arena
			nextButtonRegion:existsClick(arenaSetup)
			nextButtonRegion:existsClick(arenaSetup2)
			middleRegion:existsClick(arenaOpponentConfirm)
			if (arenaOpponentRegion:exists(arenaOpponent)) then
				click(defaultArenaOpponent)
			elseif (nextButtonRegion:existsClick(arenaBegin)) then
				continueClick(nextButtonRegion:getLastMatch(), 10, 5)
				state = 1
			elseif (middleRegion:exists(okButton)) then
				state = -1
				getBackToArena()
			end
		elseif (farmOptions == FARM_DUNGEON_OPTION) then 	-- dungeon
			nextButtonRegion:existsClick(nextButton)
			if (dungeonIconRegion:exists(dungeonIcon)) then click(selectedDungeon)
			elseif (nextButtonRegion:existsClick(dungeonDepart)) then
				usePreviousSnap(false)
				if (farmKeyFlag) then
					if (dungeonKeyRegion:exists(dungeonKey, 2)) then
						continueClick(dungeonKeyRegion:getLastMatch(), 6, 3) end
				end
				state = 1
			end
		elseif (farmOptions == FARM_SCASTLE_OPTION) then 	-- steel castle
			if (scStart) then
				if (dungeonIconRegion:exists(dungeonIcon)) then
					click(dungeonIconRegion:getLastMatch())
				else
					scChallegeRegion:existsClick(scChallenge)
					scStart = false
				end
			elseif (nextButtonRegion:existsClick(scDepart)) then
				continueClick(nextButtonRegion:getLastMatch(), 2, 1)
				usePreviousSnap(false)

				-- might want to wrap this?
				if (middleRegion:exists(lapisRefill1, 2)) then lapisRefill() end

				state = 1
			elseif (topRegion:exists(scFinished)) then
				scriptExit(SCRIPTEXIT_FINISHED_DESCRIPTION)
			else scChallegeRegion:existsClick(scChallenge) end
		end
		usePreviousSnap(false)

		-- shared
		if (labelRegion:exists(selectCompanion)) then
			if (companionOptions == COMPANION_BONUS) then
				if (not companionBonusRegion:existsClick(companionBonusDrops, 3)) then
					if (companionTab == 0) then 
						companionTabRegion:existsClick(companionTabEvent1)
						companionTab = 1
					elseif (companionTab == 1) then
						companionTabRegion:existsClick(companionTabEvent2)
						companionTab = 2
					elseif (companionTab == 2) then
						companionTabRegion:existsClick(companionTabFavorite)
						companionTab = 0
					end
				end
			else
				if (middleRegion:exists(selectYourOwn)) then
					middleRegion:existsClick(noCompanion)
				else click(defaultCompanion) end
			end
		elseif (farmKeyFlag and middleRegion:exists(dungeonNoKey)) then
			scriptExit(SCRIPTEXIT_FINISHED_DESCRIPTION)
		elseif (middleRegion:exists(lapisRefill1)) then lapisRefill() end
	end

	-- Battle
	if (state ~= 99) then
		checkForConnectionError(repeatButton, combatButtonsRegion)
		doBattle()
	end

	while (state == 1) do
		snapshot()
		if (farmOptions == FARM_ARENA_OPTION) then 			-- arena
			nextButtonRegion:existsClick(arenaRewards)
			if (nextButtonRegion:exists(arenaSetup)) then state = 2 end
		elseif (farmOptions == FARM_DUNGEON_OPTION) then 	-- dungeon
			if (dungeonIconRegion:exists(dungeonIcon)) then state = 2 end
		elseif (farmOptions == FARM_SCASTLE_OPTION) then 	-- steel castle
			if (scRewardsLabelRegion:exists(scAbilityRewards)) then steelCastleRewards() end
		end

		-- shared
		middleRegion:existsClick(connectionErrorButton)
		middleRegion:existsClick(dailyPopup)
		middleRegion:existsClick(companionDoNotRequest)
		nextButtonRegion:existsClick(dungeonReward)
		click(labelRegion)
		usePreviousSnap(false)
	end
end

function steelCastleRewards()
	if (scRunOptions == 1) then -- note: stringify
		toast(FARMSC_TOAST_DESCRIPTION)

		usePreviousSnap(false)
		while (scChallegeRegion:exists(scChallenge) == nil) do
			if (middleRegion:exists(scAbilityRewardsMenu) == nil) then click(scRewardsLabelRegion) end
			wait(5)
		end

		state = 2
	elseif (scRunOptions == 2) then -- note: stringify
		scriptExit("THIS IS AUTO SELECT AND IT'S NOT IMPLEMENTED!")
	end
end


-- TODO: super extremely early WIP, will prob not run all the way through
function exploration()
	local vector = 0

	for i = 1, #earthShrineExploration do
		vector = split(earthShrineExploration[i], ",")

		mode 		= vector[1]
		direction 	= vector[2]
		length 		= vector[3]

		toast("mode: " .. mode .. ", direction: " .. direction .. ", length: " .. length)

		if (mode == "run") then explorationRunOptions = 0
		elseif (mode == "step") then explorationRunOptions = 1 end

		if (direction == "bossfight") then
			while (combatButtonsRegion:exists(repeatButton) == nil) do
				explorationMenuRegion:existsClick(explorationBossConfirm)
				click(labelRegion)

				wait(1)
			end

			doBattle()
		elseif (direction == "continue") then
			explorationMenuRegion:existsClick(explorationContinue, 3)
		elseif (direction == "exit") then
			explorationMenuRegion:existsClick(explorationLeave, 3)
		else
			move(direction, length) end
	end

	scriptExit()
end

function move()
	if (explorationRunOptions == 0) then
			moveRun(direction, length)
			explorationCheckBattle()
	elseif (explorationRunOptions == 1) then
		for i = 1, tonumber(length) do
			while (unitLocation == 0) do
				snapshot()
				if (middleRegion:exists(explorationRainUp)) then
					unitLocation = middleRegion:getLastMatch():getTarget()
				elseif (middleRegion:exists(explorationRainDown)) then
					unitLocation = middleRegion:getLastMatch():getTarget()
				elseif (middleRegion:exists(explorationRainLeft)) then
					unitLocation = middleRegion:getLastMatch():getTarget()
				elseif (middleRegion:exists(explorationRainRight)) then
					unitLocation = middleRegion:getLastMatch():getTarget() end
				usePreviousSnap(false)
			end

			moveStep(unitLocation)

			wait(toMs(stepInterval))

			explorationCheckBattle()
		end
	end
end

function moveRun()
	if (direction == "up") then
		dragDrop(middle, middle:offset(0, -500))

		wait(toMs(length))
	elseif (direction == "down") then
		dragDrop(middle, middle:offset(0, 500))

		wait(toMs(length))
	elseif (direction == "left") then
		dragDrop(middle, middle:offset(-500, 0))

		wait(toMs(length))
	elseif (direction == "right") then
		dragDrop(middle, middle:offset(500, 0))

		wait(toMs(length))
	end
end

function moveStep(unitLocation)
	if (direction == "up") then
		click(unitLocation:offset(0, stepUpOffset))
	elseif (direction == "down") then
		click(unitLocation:offset(0, stepDownOffset))
	elseif (direction == "left") then
		click(unitLocation:offset(stepLeftOffset, 0))
	elseif (direction == "right") then
		click(unitLocation:offset(stepRightOffset, 0)) end
end

-- check if we're in battle
function explorationCheckBattle()
	if (explorationOptionsRegion:exists(explorationMenu) == nil) then
		toast("we're in battle")

		checkForConnectionError(repeatButton, combatButtonsRegion)
		doBattle()

		toast("we're out of battle")

		while (explorationOptionsRegion:exists(explorationMenu) == nil) do
			click(combatButtonsRegion)
			wait(2) end

		wait(2)

		if (explorationRunOptions == 0) then moveRun(direction, length) end
	end
end

function toMs(seconds)
	return seconds / 1000
end

-- converted this from an example
function split(inputString, delim)
	local delim = delim or '%s'
	local t = {}

	for field, s in string.gmatch(inputString, "([^" .. delim .. "]*)(" .. delim .. "?)") do
		table.insert(t, field)
		
		if s == "" then return t end
	end
end


function cactuarFusion()
	toast(CFUSE_TOAST_DESCRIPTION .. loopCounter .. "\n" .. CFUSE2_TOAST_DESCRIPTION .. maxedCactuarsCounter)

	while (state == 0) do -- select base, select material
		snapshot()
		if (labelRegion:exists(cfSelectBase)) then click(cfClick)
		elseif (labelRegion:exists(cfEnhanceUnits)) then click(cfFuseUnit)
		elseif (labelRegion:exists(cfMaterialUnits) and
			(cfFirstMaterialRegion:exists(cfMetalGigantuar) or cfFirstMaterialRegion:exists(cfKingMetalMinituar))) then
			click(cfClick)
			state = 1
		end
		usePreviousSnap(false)
	end

	while (state == 1) do -- fuse
		snapshot()
		if (cfFirstMaterialRegion:exists(cfFirstSelect)) then nextButtonRegion:existsClick(arenaRewards)
		elseif (labelRegion:exists(cfEnhanceUnits) and
			(cfFirstFuseRegion:exists(cfMetalGigantuar) or cfFirstFuseRegion:exists(cfKingMetalMinituar))) then
			nextButtonRegion:existsClick(cfFuseButton)
			state = 3
		end
		usePreviousSnap(false)
	end

	while (state == 3) do -- resolve
		snapshot()
		if (labelRegion:exists(cfEnhanceUnits) and cfDetailRegion:exists(cfZeroXpGil)) then
			topRegion:existsClick(backButton)
			state = 4
		elseif (labelRegion:exists(cfSelectBase)) then
			maxedCactuarsCounter = maxedCactuarsCounter + 1
			state = 4
		else click(labelRegion) end
		usePreviousSnap(false)
	end
end

function multiSummon()
	while (state == 0) do
		if (not multiSummonRegion:existsClick(msButton2)) then scriptExit(SCRIPTEXIT_FINISHED_DESCRIPTION) end
		if (middleRegion:existsClick(msButton2)) then state = 1 end
	end

	while (state == 1) do
		if (labelRegion:exists(msRewards)) then state = 2 else click(labelRegion) end
	end

	while (state == 2) do
		click(labelRegion)
		nextButtonRegion:existsClick(msNext)
		if (multiSummonRegion:exists(msButton)) then state = 3 end

		wait(1)
	end
end

function chainAssist() -- TODO: try to streamline and optimize
	if (options == FARM_CASSIST_OPTION and caLoopFlag) then --battlePrep()
		while (not getBattleUnitStatus()) do wait(1) end

		combatButtonsRegion:existsClick(reloadButton)
		wait(0.50)
	end

	local max = 0

	if (caUnit1 and (max < caUnit1Order)) then max = caUnit1Order end
	if (caUnit2 and (max < caUnit2Order)) then max = caUnit2Order end
	if (caUnit3 and (max < caUnit3Order)) then max = caUnit3Order end
	if (caUnit4 and (max < caUnit4Order)) then max = caUnit4Order end
	if (caUnit5 and (max < caUnit5Order)) then max = caUnit5Order end
	if (caUnit6 and (max < caUnit6Order)) then max = caUnit6Order end

	for i = 1, max, 1 do
		if (caUnit1 and caUnit1Order == i) then wait(toMs(caUnit1Delay)); click(unit1) end
		if (caUnit2 and caUnit2Order == i) then wait(toMs(caUnit2Delay)); click(unit2) end
		if (caUnit3 and caUnit3Order == i) then wait(toMs(caUnit3Delay)); click(unit3) end
		if (caUnit4 and caUnit4Order == i) then wait(toMs(caUnit4Delay)); click(unit4) end
		if (caUnit5 and caUnit5Order == i) then wait(toMs(caUnit5Delay)); click(unit5) end
		if (caUnit6 and caUnit6Order == i) then wait(toMs(caUnit6Delay)); click(unit6) end

		if (caReloadFlag and (i < max)) then
			wait(toMs(caReloadWait))
			combatButtonsRegion:existsClick(reloadButton)
		end
	end

	if (options == FARM_CASSIST_OPTION and (not caLoopFlag)) then scriptExit(SCRIPTEXIT_FINISHED_DESCRIPTION) end
end

function maintanence() -- TODO: extremely early WIP
	-- global presets
	companionOptions = COMPANION_BONUS
	runOptions = RUN_CASSIST_OPTION -- always run chain assist with maint templates

	if (maintAdsFlag) then
		maintState = 1

		navigateToHomeScreen()

		wait(1)

		-- check for ads
		if (topRegion:exists(maxAds)) then
			click(Location(200, 460)) -- location of ads
			wait(2)
			doAds()
		end
	end

	if (maintArenaFlag) then
		maintState = 2

		-- go to arena
		newNavigateToHomeScreen(arenaSetup, nextButtonRegion, homeScreenArena, homeScreenBottomRegion)
		--[[navigateToHomeScreen()
		homeScreenBottomRegion:existsClick(homeScreenArena)--]]

		-- arena
		farmOptions = FARM_ARENA_OPTION
		if (vmFlag) then setChainAssistVariables(vmCaMaintArena)
		else setChainAssistVariables(caMaintArena) end
		state = 0
		caCurrentTurn = 0

		farm()
	end

	-- temp disabled
	if (false and maintMkFlag and (loopCounter % maintMkFrequency == 0)) then
		maintState = 3

		navigateToHomeScreen()

		-- this assumes MK even is the main bubble on top of vortex
		wait(1)
		click(defaultRaid)

		-- search for dungeon
		while (dungeonIconRegion:exists(dungeonIcon) == nil) do wait(2) end
		if (maintMk == 0) then
			findDungeons()
			maintMk = selectedDungeon
		else selectedDungeon = maintMk end

		-- dungeon
		farmOptions = FARM_DUNGEON_OPTION
		setChainAssistVariables(caMaintDungeon)
		state = 0
		caCurrentTurn = 0

		farm()
	end

	if (maintRaidFlag) then
		maintState = 4

		-- go to raid
		navigateToHomeScreen()
		if (not topRegion:existsClick(homeScreenRaidBubble, 2)) then click(defaultRaid) end

		-- attempting to remove the popups on a slow device
		if (vmFlag) then
			navigateToHomeScreen()
			if (not topRegion:existsClick(homeScreenRaidBubble, 2)) then click(defaultRaid) end
		end

		-- search for dungeon
		while (dungeonIconRegion:exists(dungeonIcon) == nil) do wait(2) end
		if (maintRaid == 0) then
			findDungeons()
			maintRaid = selectedDungeon
		else selectedDungeon = maintRaid end

		-- raid
		farmOptions = FARM_DUNGEON_OPTION
		if (vmFlag) then setChainAssistVariables(vmCaMaintRaid)
		else setChainAssistVariables(caMaintRaid) end
		state = 0
		caCurrentTurn = 0

		farm()
	end
end

function navigateToHomeScreen()
	while (not areWeAtHomeScreen()) do
		snapshot()
		topRegion:existsClick(homeButton) -- priority
		topRegion:existsClick(backButton)
		topRegion:existsClick(xButton)

		bottomRegion:existsClick(closeButton)
		bottomRegion:existsClick(dailyPopup)
		bottomRegion:existsClick(okButton)
		usePreviousSnap(false)

		if (vmFlag) then wait(10)
		else wait(2) end
	end
end

function areWeAtHomeScreen()
	return (homeScreenTopRegion:exists(homeScreenMenu) ~= nil
		and homeScreenBottomRegion:exists(homeScreenArena) ~= nil
		and homeScreenBottomRegion:exists(homeScreenExpedition) ~= nil
		and homeScreenBottomRegion:exists(homeScreenWorld) ~= nil)
end

function newNavigateToHomeScreen(image, region, destination, destinationRegion)
	while (not (region:exists(image) ~= nil)) do
		snapshot()
		destinationRegion:existsClick(destination)

		topRegion:existsClick(homeButton) -- priority
		topRegion:existsClick(backButton)
		topRegion:existsClick(xButton)

		bottomRegion:existsClick(closeButton)
		bottomRegion:existsClick(dailyPopup)
		bottomRegion:existsClick(okButton)
		usePreviousSnap(false)

		if (vmFlag) then wait(10)
		else wait(2) end
	end
end


----------------------------
---------- ELPERS ----------
----------------------------
function findDungeons() -- finds all dungeons, and then lists them
	local dungeons = regionFindAllNoFindException(dungeonIconRegion, dungeonIcon)
	
	dialogInit()
	addTextView(DUNGEON_SELECT_LABEL)
	newRow()
	addRadioGroup("availableDungeons", 3)
	for i = 1, #dungeons do addRadioButton(DUNGEONS_FOUND_DESCRIPTION .. i, i) end

	if (table.getn(dungeons) > 0) then
		if ((options == FARM_OPTION and caPresets == "Scorn Doll Farm") or
			(options == MAINTENANCE_OPTION and (not maintChooseDungeon))) then selectedDungeon = dungeons[1]
		else
			dialogShow(TITLE_FINDDUNGEON)

			selectedDungeon = dungeons[availableDungeons]
		end
	else
		setStopMessage(DUNGEONS_NONE_DESCRIPTION)
		scriptExit()
	end
end

-- handles all the battle stuff
function doBattle()
	while (combatButtonsRegion:exists(reloadButton) or combatButtonsRegion:exists(repeatButton)) do
		if (getBattleUnitStatus()) then
			if (runOptions == RUN_REPEAT_OPTION) then
				combatButtonsRegion:existsClick(repeatButton)
				wait(5)
			elseif (runOptions == RUN_CASSIST_OPTION) then
				combatButtonsRegion:existsClick(reloadButton)
				if (maintPostTurnOne and (maintState == 4) and caCurrentTurn > 0) then
					setChainAssistVariables(caMaintRaid2) end
				wait(1)
				chainAssist()
				wait(10)
			end

			if (farmOptions == 4) then click(labelRegion) end

			caCurrentTurn = caCurrentTurn + 1
		end

		wait(3)
	end
end

function getBattleUnitCount()
	local units = regionFindAllNoFindException(combatUnitRegion, mpText)
	local unitsDead = regionFindAllNoFindException(combatUnitRegion, unitZeroHp)

	return (table.getn(units) - table.getn(unitsDead))
end

function getBattleUnitStatus()
	snapshot()
	-- total units
	local unitCount = getBattleUnitCount()

	-- units ready for combat
	local unitsL = regionFindAllNoFindException(combatReadyRegion1, combatReady)
	local unitsR = regionFindAllNoFindException(combatReadyRegion2, combatReady)

	-- units with status ailments
	local unitsBerserk = regionFindAllNoFindException(combatUnitRegion, combatBerserk)

	-- total counts for comparison
	local readyUnitCount = unitCount - table.getn(unitsBerserk)
	local combatReadyUnitCount = table.getn(unitsL) + table.getn(unitsR)
	usePreviousSnap(false)

	if ((unitCount > 0 and combatReadyUnitCount > 0) and readyUnitCount == combatReadyUnitCount) then
		return true
	else
		return false
	end
end

-- gets back to arena when an updated opponent is chosen that kicks you to the start screen
function getBackToArena()
	while (state == -1) do
		snapshot()
		middleRegion:existsClick(okButton)
		if (bottomRegion:exists(startScreen)) then click(labelRegion) end
		if (homeScreenBottomRegion:existsClick(homeScreenArena)) then state = 0 end
		usePreviousSnap(false)

		wait(1)
	end
end

-- does ads
function doAds()
	while (middleRegion:exists(spinButton)) do
		while (state == 0) do
			middleRegion:existsClick(spinButton)
			if (topRegion:exists(backButton) == nil) then state = 1 end
		end

		while (state == 1) do
			wait(5)
		
			if (xButtonRegion:existsClick(xButton1) or xButtonRegion:existsClick(xButton2) or xButtonRegion:existsClick(xButton3)) then
				wait(1)

				if (middleRegion:exists(resumeAds) == nil) then state = 2
				else click(middleRegion:getLastMatch()) end
			end
		end

		while (state == 2) do
			click(labelRegion)
			nextButtonRegion:existsClick(dungeonReward)

			if (topRegion:exists(backButton)) then state = 0 end
		end

		wait(2)
	end
end

-- TODO: generalize? might not be needed
-- checks for the connection error ok button during loading screens
function checkForConnectionError(target, region)
	if (region == nil) then region = screen end

	while true do
		if (region:exists(target)) then
			break
		else
			middleRegion:existsClick(connectionErrorButton)
			wait(1)
		end
	end
end

-- TODO: REDO
-- executes a lapis refill
function lapisRefill()
	wait(1)

	if (lapisRefillFlag) then
		increaseLapisRefillCount()
		toast(LAPISREFILL_TOAST_DESCRIPTION .. lapisRefillCounter)
		click(lapisRefillRegion:getLastMatch())
		lapisRefillRegion:existsClick(lapisConfirmButton)
		if (options == FARM_ARENA_OPTION) then
			wait(3)
			nextButtonRegion:existsClick(arenaSetup2)
		elseif (options == MAINTENANCE_OPTION) then
			wait(1)
			middleRegion:existsClick(backButton)
			toast("Not enough energy for Mog King, skipping this time...")
			state = 99
		end
	else scriptExit(SCRIPTEXIT_FINISHED_DESCRIPTION) end
end

-- increases lapis refill count
function increaseLapisRefillCount()
	lapisRefillCounter = lapisRefillCounter + 1
	updateStopMessage()
end

-- increases loop count
function increaseLoopCount()
	loopCounter = loopCounter + 1
	updateStopMessage()

	if (loopCount == loopCounter) then
		return true
	else
		return false
	end
end

-- updates stop message accoring to options
function updateStopMessage()
	if (options == FARM_CFUSE_OPTION) then
		setStopMessage(CFUSE_TOAST_DESCRIPTION .. loopCounter .. "\n" .. CFUSE2_TOAST_DESCRIPTION .. maxedCactuarsCounter)
	elseif (options == FARM_MSUMMON_OPTION) then
		setStopMessage(STOPMSG_TIMESSUMMONED_DESCRIPTION .. loopCounter)
	else
		setStopMessage(STOPMSG_LOOPCOUNT_DESCRIPTION .. loopCounter .. "\n" .. STOPMSG_LAPISREFILL_DESCRIPTION .. lapisRefillCounter)
	end
end

-- visual timer type of thing to keep track of wait time
function waitHandler()
	toast(whTime .. WHANDLER_TOAST_DESCRIPTION)

	for i = 0, whTime, whIncrement do
		wait(whIncrement)

		if ((math.fmod(i, whTimeInterval) == 0) and ((whTime - i) > 0)) then
			toast(WHANDLER_TIMER_TOAST_DESCRIPTION .. (whTime - i))
		end
	end

	toast(WHFINISHED_DESCRIPTION)
end

function tabText(inputString)
	return TEXT_TAB_BUFFER .. inputString
end

function spaceText(inputString)
	return TEXT_SPACE_BUFFER .. inputString
end

function checkForUpdates()
	local sourceUpdated = false
	local imageUpdated = false

	local httpGetAvailable, httpGetResult = pcall(httpGet, VERSION_FILE)

	if (httpGetAvailable) then
		local localPath = scriptPath()

		local output = loadstring(httpGetResult)
		local sourceVersion, imageVersion, sourceNotes, imageNotes = output()

		-- source
		if (tonumber(SOURCE_CURRENTVERSION) < tonumber(sourceVersion)) then
			updateSource(localPath)
			sourceUpdated = true end

		-- images
		if (tonumber(IMAGE_CURRENTVERSION) < tonumber(imageVersion)) then
			updateImage(localPath, sourceUpdated)
			imageUpdated = true end

		if (sourceUpdated or imageUpdated) then scriptExit()
		elseif (not sourceUpdated and not imageUpdated) then toast("No source or image update found!")
		elseif (not sourceUpdated) then toast("No source updates found!")
		elseif (not imageUpdated) then toast("No image updates found!") end
	else
		toast("Either network functions are off or a path is invalid!")
	end
end

function updateSource(localPath)
	httpDownload(SOURCE_FILE, localPath .. SOURCE_FILENAME)

	toast("Updated source!")

	print("- Updated source version: " .. sourceVersion
		.. "\nPatch notes:\n" .. sourceNotes .. "\n\nSource file updated!")
end

function updateImage(localPath, sourceUpdated)
	if (not sourceUpdated) then
		httpDownload(SOURCE_FILE, localPath .. SOURCE_FILENAME)
		print("Source updated to bump version numbers!")
	end

	httpDownload(IMAGE_FILE, localPath .. IMAGE_FILENAME)

	dofile(localPath .. IMAGE_FILENAME)

	print("\n- Updated image version: " .. imageVersion
		.. "\nPatch notes:\n" .. imageNotes .. "\n\nImage folder updated!")
end


----------------------------------------
---------- SPECIALIZED ELPERS ----------
----------------------------------------
function setChainAssistPreset() -- TODO: maybe, somewhat redone
	if (caPresets == "1/4") then
		setChainAssistVariables(caPresets14)
	elseif (caPresets == "2/5") then
		setChainAssistVariables(caPresets25)
	elseif (caPresets == "3/6") then
		setChainAssistVariables(caPresets36)
	elseif (caPresets == "All") then
		setChainAssistVariables(caPresetsAll)
	elseif (caPresets == "Scorn Doll Farm") then
		setChainAssistVariables(caPresetsDoll)

		caReloadFlag 	= true
		caReloadWait 	= 1000
	elseif (caPresets == "caMaintArena") then
		setChainAssistVariables(caMaintArena)
	elseif (caPresets == "caMaintMk") then
		setChainAssistVariables(caMaintMk)
	elseif (caPresets == "caMaintRaid") then
		setChainAssistVariables(caMaintRaid)
	end
end

function setChainAssistVariables(presets) -- might not replace setChainAssistPreset, always pass an array with 6 (12) arguments
	if (presets == nil) then scriptExit(CASSIST_EXIT_DESCRIPTION) end

	caUnit1 = false
	caUnit2 = false
	caUnit3 = false
	caUnit4 = false
	caUnit5 = false
	caUnit6 = false

	caUnit1Order 	= presets[1]
	caUnit1Delay 	= presets[2]
	caUnit2Order 	= presets[3]
	caUnit2Delay 	= presets[4]
	caUnit3Order 	= presets[5]
	caUnit3Delay 	= presets[6]
	caUnit4Order 	= presets[7]
	caUnit4Delay 	= presets[8]
	caUnit5Order 	= presets[9]
	caUnit5Delay 	= presets[10]
	caUnit6Order 	= presets[11]
	caUnit6Delay 	= presets[12]

	if (presets[1] ~= 0) then caUnit1 = true end
	if (presets[3] ~= 0) then caUnit2 = true end
	if (presets[5] ~= 0) then caUnit3 = true end
	if (presets[7] ~= 0) then caUnit4 = true end
	if (presets[9] ~= 0) then caUnit5 = true end
	if (presets[11] ~= 0) then caUnit6 = true end
end


------------------------------------
---------- ADDITIONAL UIs ----------
------------------------------------
function setFarm()
	dialogInit()

	addTextView(spaceText(OPTIONS_LABEL))
	newRow()
	addRadioGroup("farmOptions", 1)
	addRadioButton(ARENA, 1)
	addRadioButton(DUNGEON, 2)
	addRadioButton("Exploration (testing)", 4) -- note: stringify
	addRadioButton(STEELCASTLE, 3)
	newRow()
	addTextView("")
	newRow()
	addTextView(spaceText(RUNOPTIONS_LABEL))
	newRow()
	addTextView(tabText(""))
	addRadioGroup("runOptions", 2)
	addRadioButton(REPEAT, 1)
	addRadioButton(CHAINASSIST, 2)
	newRow()
	addTextView("")
	newRow()
	addTextView(spaceText(COMPANION_OPTIONS_LABEL))
	newRow()
	addTextView(tabText(""))
	addRadioGroup("companionOptions", 4)
	addRadioButton(COMPANION_DEFAULT_DESCRIPTION, 1)
	addRadioButton(COMPANION_BONUS_DESCRIPTION, 2)
	--addRadioButton(COMPANION_NONE_DESCRIPTION, 3)
	newRow()
	addTextView(spaceText(FLAGS_LABEL))
	newRow()
	addCheckBox("farmKeyFlag", "Requires key", false)
	newRow()
	addCheckBox("whFlag", FARM_WAIT_DESCRIPTION, false)
	addEditNumber("whTime", standardWhWait)
	newRow()

	dialogShow(TITLE_FARM)
end

function setSteelCastle() -- note: stringify
	dialogInit()

	addTextView(spaceText("Steel Castle options: "))
	newRow()
	addRadioGroup("scRunOptions", 5)
	addRadioButton("Manually select", 1)
	addRadioButton("Auto select (WIP)", 2)
	addSeparator()
	addTextView(tabText("Auto select priority:"))
	newRow()
	addCheckBox("stat1Flag", "Stat 1: ", false)
	addSpinner("stat1", scStatSelection, scStatSelection[1])

	newRow()
	addCheckBox("stat2Flag", "Stat 2: ", false)
	addSpinner("stat2", scStatSelection, scStatSelection[1])

	newRow()
	addCheckBox("stat3Flag", "Stat 3: ", false)
	addSpinner("stat3", scStatSelection, scStatSelection[1])

	newRow()
	addCheckBox("stat4Flag", "Stat 4: ", false)
	addSpinner("stat4", scStatSelection, scStatSelection[1])

	dialogShow("ffbeAssistant - Steel Castle")
end

function setChainAssist()
	dialogInit()

	addCheckBox("caPresetsFlag", CAPRESETS_LABEL, false)
	addSpinner("caPresets", caPresets, caPresets[1])
	newRow()
	addSeparator()
	addTextView(spaceText(CA_MANUAL_LABEL))

	newRow()
	addCheckBox("caUnit1", CAUNIT1_LABEL, false)
	addTextView(tabText(ORDER_LABEL))
	addSpinner("caUnit1Order", caUnitOrder, caUnitOrder[1])
	addTextView(tabText(DELAY_LABEL))
	addEditNumber("caUnit1Delay", 0)

	newRow()
	addCheckBox("caUnit2", CAUNIT2_LABEL, false)
	addTextView(tabText(ORDER_LABEL))
	addSpinner("caUnit2Order", caUnitOrder, caUnitOrder[1])
	addTextView(tabText(DELAY_LABEL))
	addEditNumber("caUnit2Delay", 0)

	newRow()
	addCheckBox("caUnit3", CAUNIT3_LABEL, false)
	addTextView(tabText(ORDER_LABEL))
	addSpinner("caUnit3Order", caUnitOrder, caUnitOrder[1])
	addTextView(tabText(DELAY_LABEL))
	addEditNumber("caUnit3Delay", 0)

	newRow()
	addCheckBox("caUnit4", CAUNIT4_LABEL, false)
	addTextView(tabText(ORDER_LABEL))
	addSpinner("caUnit4Order", caUnitOrder, caUnitOrder[1])
	addTextView(tabText(DELAY_LABEL))
	addEditNumber("caUnit4Delay", 0)

	newRow()
	addCheckBox("caUnit5", CAUNIT5_LABEL, false)
	addTextView(tabText(ORDER_LABEL))
	addSpinner("caUnit5Order", caUnitOrder, caUnitOrder[1])
	addTextView(tabText(DELAY_LABEL))
	addEditNumber("caUnit5Delay", 0)

	newRow()
	addCheckBox("caUnit6", CAUNIT6_LABEL, false)
	addTextView(tabText(ORDER_LABEL))
	addSpinner("caUnit6Order", caUnitOrder, caUnitOrder[1])
	addTextView(tabText(DELAY_LABEL))
	addEditNumber("caUnit6Delay", 0)

	newRow()
	addTextView("")
	newRow()
	addCheckBox("caPersistManualPresets", "Keep manual presets", true)

	addSeparator()
	addTextView(spaceText(FLAGS_LABEL))
	
	if (options == FARM_CASSIST_OPTION) then
		newRow()
		addCheckBox("caLoopFlag", "Abide by loop counter", false)
	end

	newRow()
	addCheckBox("caReloadFlag", CASSIST_RELOAD_DESCRIPTION, false)
	addEditNumber("caReloadWait", 250)
	newRow()
	addTextView("")

	dialogShow(TITLE_CHAINASSIST)

	-- TODO: possibly change from/to "deeper" spinners?
	caUnit1Order = tonumber(caUnit1Order)
	caUnit2Order = tonumber(caUnit2Order)
	caUnit3Order = tonumber(caUnit3Order)
	caUnit4Order = tonumber(caUnit4Order)
	caUnit5Order = tonumber(caUnit5Order)
	caUnit6Order = tonumber(caUnit6Order)
end

function setMaintenance()
	dialogInit()
	addTextView(spaceText(MAINTENANCE_LABEL))
	newRow()
	addCheckBox("maintAdsFlag", "Ads", false) -- note: ads
	newRow()
	addCheckBox("maintArenaFlag", ARENA, false)
	newRow()
	addCheckBox("maintMkFlag", MOGKING, false)
	newRow()
	addCheckBox("maintRaidFlag", RAID, false)
	newRow()
	addTextView("")
	newRow()
	addTextView(spaceText(FLAGS_LABEL))
	newRow()
	addCheckBox("maintMkFrequencyFlag", "(MK) Run MK every (turn(s)) ", false)
	addEditNumber("maintMkFrequency", 5)
	newRow()
	addCheckBox("maintChooseDungeon", "(MK/Raid) Choose dungeon", false) -- note: stringify
	newRow()
	addCheckBox("maintPostTurnOne", "(MK/Raid) Different chaining setup post turn one", false) -- note: stringify
	newRow()
	addCheckBox("whFlag", FARM_WAIT_DESCRIPTION, false)
	addEditNumber("whTime", standardWhWait)

	dialogShow(TITLE_MAINTENANCE)
end

function setExploration()
	dialogInit()
	addTextView(spaceText("Set exploration options:"))
	newRow()
	addTextView(spaceText("Select exploration map: "))
	addSpinner("explorationMapSelection", explorationMapSelections, explorationMapSelections[1])
	newRow()
	addTextView(spaceText("Set step interval (do not set this too low) (ms): "))
	addEditNumber("stepInterval", 500)


	dialogShow("ffbeAssistant - Exploration")
end



-------------------------------------------
--------------- PREFERENCES ---------------
preferencePutNumber("qOptions", 0);
preferencePutBoolean("lapisRefillFlag", false)

preferencePutNumber("loopCount", 0)
--preferencePutNumber("companionOptions", 1)
preferencePutBoolean("farmKeyFlag", false)
preferencePutNumber("availableDungeons", 1)

if (not preferenceGetBoolean("caPersistManualPresets", true)) then
	preferencePutBoolean("caUnit1", false)
	preferencePutBoolean("caUnit2", false)
	preferencePutBoolean("caUnit3", false)
	preferencePutBoolean("caUnit4", false)
	preferencePutBoolean("caUnit5", false)
	preferencePutBoolean("caUnit6", false)

	preferencePutNumber("caUnit1Order", 1)
	preferencePutNumber("caUnit2Order", 1)
	preferencePutNumber("caUnit3Order", 1)
	preferencePutNumber("caUnit4Order", 1)
	preferencePutNumber("caUnit5Order", 1)
	preferencePutNumber("caUnit6Order", 1)

	preferencePutNumber("caUnit1Delay", 0)
	preferencePutNumber("caUnit2Delay", 0)
	preferencePutNumber("caUnit3Delay", 0)
	preferencePutNumber("caUnit4Delay", 0)
	preferencePutNumber("caUnit5Delay", 0)
	preferencePutNumber("caUnit6Delay", 0)
end
-------------------------------------------
-------------------------------------------

--if (combatButtonsRegion:exists(repeatButton)) then toast("repeat found") else toast("repeat not found") end

--if (exists(explorationRainUp)) then toast("found rain up") else toast("not found rain up") end
--if (exists(explorationRainDown)) then toast("found rain down") else toast("not found rain down") end
--if (exists(explorationRainLeft)) then toast("found rain left") else toast("not found rain left") end
--if (exists(explorationRainRight)) then toast("found rain right") else toast("not found rain right") end

--exists(explorationRainUp)
--exists(explorationRainDown)
--exists(explorationRainLeft)
--exists(explorationRainRight)
--tempLocation = getLastMatch():getTarget()

--[[setDragDropTiming(100, 100)

tempLocation = Location(720, 1280)

dragDrop(tempLocation, tempLocation:offset(0, -500))--]]

--direction = "up"
--moveStep(tempLocation)
--direction = "down"
--moveStep(tempLocation)
--direction = "left"
--moveStep(tempLocation)
--direction = "right"
--moveStep(tempLocation)


-------------------------------
---------- MAIN (UI) ----------
-------------------------------
--if (getBattleUnitStatus()) then toast("ready") else toast("not ready") end

-- stuff?
if (preferenceGetBoolean("enableAutoUpdate", true)) then checkForUpdates() end
setStopMessage(SCRIPTEXIT_DEFAULT_DESCRIPTION)

dialogInit()

--[[addTextView("Version: " .. SOURCE_CURRENTVERSION)
addSeparator()--]]
addTextView(spaceText("Quick Options:"))
newRow()
addRadioGroup("qOptions", 6)
addRadioButton("Arena", 1)
addRadioButton("Steel Castle", 2)
newRow()
addTextView(spaceText(OPTIONS_LABEL))
newRow()
addRadioGroup("options", 0)
addRadioButton(FARM, 1)
addRadioButton(CACTUARFUSION, 2)
addRadioButton(MULTISUMMON, 3)
addRadioButton(CHAINASSIST, 4)
addRadioButton("(WIP) " .. MAINTENANCE, 5)
newRow()
addTextView(spaceText(LOOPCOUNT_DESCRIPTION))
addEditNumber("loopCount", 0)
newRow()
addTextView(spaceText(FLAGS_LABEL))
newRow()
addCheckBox("lapisRefillFlag", FARM_LAPISREFILL_DESCRIPTION, false)
newRow()
addCheckBox("scIntervalFlag", SCANRATE_DESCRIPTION, false)
addEditNumber("scIntervalAmount", 300)
newRow()
addCheckBox("vmFlag", "(DEV) VM?", false) -- note: stringify
addSeparator()
addTextView(spaceText("App Settings:"))
newRow()
addCheckBox("enableAutoUpdate", "Enable auto update", true) -- note: stringify

dialogShow(TITLE)

-- Setup
if (qOptions > 0) then
	options = 1
	-- set arena options
	if (qOptions == 1) then
		farmOptions = 1
		runOptions = 2

		setChainAssistVariables(caMaintArena)
	else -- steel castle options
		farmOptions = 3
		runOptions = 1
	end
end

if (qOptions == -1 and options == FARM_OPTION) then setFarm() end

if (farmOptions == FARM_SCASTLE_OPTION) then setSteelCastle() end

if (qOptions ~= 1 and (options == FARM_CASSIST_OPTION or
	(options == FARM_OPTION and runOptions == RUN_CASSIST_OPTION))) then setChainAssist() end
if (options == MAINTENANCE_OPTION) then setMaintenance() end

if (farmOptions == FARM_DUNGEON_OPTION) then findDungeons()
elseif (farmOptions == 4) then setExploration() end

-- Chain assist presets
if (caPresetsFlag) then setChainAssistPreset() end

-- Flags
if (scIntervalFlag) then setScanInterval(toMs(scIntervalAmount)) end

-- Main loop
while true do
	state = 0
	maintState = 0

	if (options == FARM_OPTION and farmOptions ~= 4) then farm()
	elseif (options == FARM_OPTION and farmOptions == 4) then exploration()
	elseif (options == FARM_CFUSE_OPTION) then cactuarFusion()
	elseif (options == FARM_MSUMMON_OPTION) then multiSummon()
	elseif (options == FARM_CASSIST_OPTION) then chainAssist()
	elseif (options == MAINTENANCE_OPTION) then maintanence() end

	if (increaseLoopCount()) then scriptExit(SCRIPTEXIT_FINISHED_DESCRIPTION) end

	if (whFlag) then waitHandler() end
end