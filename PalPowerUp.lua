localPath = scriptPath()
setImagePath(localPath .. "images")
Settings:setScriptDimension(true, 1920)
Settings:setCompareDimension(true, 1920)
commonLib = loadstring(httpGet("https://raw.githubusercontent.com/AnkuLua/commonLib/master/commonLib.lua"))()

        --- This checks the version number on github to see if an update is needed ---
getNewestVersion = loadstring(httpGet("https://raw.githubusercontent.com/Paladiex/PalPowerUp/master/version.lua"))
latestVersion = getNewestVersion()
currentVersion = dofile(localPath .."version.lua")
print (currentVersion)
print (latestVersion)
if currentVersion == latestVersion then
    toast ("You are running the most current version!")
else
    httpDownload("https://raw.githubusercontent.com/Paladiex/PalPowerUp/master/version.lua", localPath .."version.lua")
    httpDownload("https://raw.githubusercontent.com/Paladiex/PalPowerUp/master/PalPowerUp.lua", localPath .."PalPowerUp.lua")
    httpDownload("https://raw.githubusercontent.com/Paladiex/PalPowerUp/master/imageupdater.lua", localPath .."imageupdater.lua")
    scriptExit("You have Updated PalPowerUp bot!")
end

local loc1 = Location(798, 338)
local loc2 = Location(774, 338)
local loc3 = Location(750, 338)
local loc4 = Location(726, 338)
local loc5 = Location(702, 338)
local loc6 = Location(678, 338)
local r1, g1, b1 = getColor(loc1)
local r2, g2, b2 = getColor(loc2)
local r3, g3, b3 = getColor(loc3)
local r4, g4, b4 = getColor(loc4)
local r5, g5, b5 = getColor(loc5)
local r6, g6, b6 = getColor(loc6)
print (r1 .. " " .. g1 .. " " .. b1)
print (r2 .. " " .. g2 .. " " .. b2)
print (r3 .. " " .. g3 .. " " .. b3)
print (r4 .. " " .. g4 .. " " .. b4)
print (r5 .. " " .. g5 .. " " .. b5)
print (r6 .. " " .. g6 .. " " .. b6)

--- These are the regions at the "Rune Power-up" screen ---
mainStatRegion = Region(1230, 350, 90, 50)
subStat1Region = Region(1230, 410, 90, 50)
subStat2Region = Region(1230, 460, 90, 50)
subStat3Region = Region(1230, 510, 90, 50)
subStat4Region = Region(1230, 560, 90, 50)
subStat5Region = Region(1230, 610, 90, 50)
mainStatValueRegion = Region(1330, 350, 200, 50)
subStatValue1Region = Region(1330, 410, 200, 50)
subStatValue2Region = Region(1330, 460, 200, 50)
subStatValue3Region = Region(1330, 510, 200, 50)
subStatValue4Region = Region(1330, 560, 200, 50)
subStatValue5Region = Region(1330, 610, 200, 50)
runeRankRegion = Region(660, 310, 160, 50)
runeLvlRegion = Region(770, 770, 130, 60)
runeRarityRegion = Region(645, 315, 195, 195)

--- These are the possible Rune Rank Images ---
starRuneImages = {  "6starRunePowerUp.png", "5starRunePowerUp.png", "4starRunePowerUp.png",
                    "3starRunePowerUp.png", "2starRunePowerUp.png", "1starRunePowerUp.png"}

--- These are the possible Rune Level Images ---
sixStarImages = {   "6starLvl0.png", "6starLvl1.png", "6starLvl2.png", "6starLvl3.png",
                    "6starLvl4.png", "6starLvl5.png", "6starLvl6.png", "6starLvl7.png",
                    "6starLvl8.png", "6starLvl9.png", "6starLvl10.png", "6starLvl11.png",
                    "6starLvl12.png", "6starLvl13.png", "6starLvl14.png", "6starLvl15.png"}
fiveStarImages ={   "5starLvl0.png", "5starLvl1.png", "5starLvl2.png", "5starLvl3.png",
                    "5starLvl4.png", "5starLvl5.png", "5starLvl6.png", "5starLvl7.png",
                    "5starLvl8.png", "5starLvl9.png", "5starLvl10.png", "5starLvl11.png",
                    "5starLvl12.png", "5starLvl13.png", "5starLvl14.png", "5starLvl15.png" }
fourStarImages ={   "4starLvl0.png", "4starLvl1.png", "4starLvl2.png", "4starLvl3.png",
                    "4starLvl4.png", "4starLvl5.png", "4starLvl6.png", "4starLvl7.png",
                    "4starLvl8.png", "4starLvl9.png", "4starLvl10.png", "4starLvl11.png",
                    "4starLvl12.png", "4starLvl13.png", "4starLvl14.png", "4starLvl15.png" }
threeStarImages ={   "3starLvl0.png", "3starLvl1.png", "3starLvl2.png", "3starLvl3.png",
                    "3starLvl4.png", "3starLvl5.png", "3starLvl6.png", "3starLvl7.png",
                    "3starLvl8.png", "3starLvl9.png", "3starLvl10.png", "3starLvl11.png",
                    "3starLvl12.png", "3starLvl13.png", "3starLvl14.png", "3starLvl15.png" }
twoStarImages ={   "2starLvl0.png", "2starLvl1.png", "2starLvl2.png", "2starLvl3.png",
                    "2starLvl4.png", "2starLvl5.png", "2starLvl6.png", "2starLvl7.png",
                    "2starLvl8.png", "2starLvl9.png", "2starLvl10.png", "2starLvl11.png",
                    "2starLvl12.png", "2starLvl13.png", "2starLvl14.png", "2starLvl15.png" }
oneStarImages ={   "1starLvl0.png", "1starLvl1.png", "1starLvl2.png", "1starLvl3.png",
                    "1starLvl4.png", "1starLvl5.png", "1starLvl6.png", "1starLvl7.png",
                    "1starLvl8.png", "1starLvl9.png", "1starLvl10.png", "1starLvl11.png",
                    "1starLvl12.png", "1starLvl13.png", "1starLvl14.png", "1starLvl15.png" }

--- These are the possible Mainstat Images ---
mainStatImages = {  "hpMain.png", "defMain.png", "atkMain.png", "spdMain.png", "criRateMain.png",
                    "criDmgMain.png", "resMain.png", "accMain.png"}

--- These are the possible Substat Images ---
subStatImages = {   "hpSub.png", "defSub.png", "atkSub.png", "spdSub.png", "criRateSub.png",
                    "criDmgSub.png", "resSub.png", "accSub.png"}

--- This scans the pixels at the location to determine the rarity of the rune ---
function findRuneRarity()
    runeRarityRegion:highlight()
    local loc = Location(800, 480)
    local r,g,b = getColor(loc)
    if (r == 134 and b == 23 and g == 16) then
        runeRarity = "Legendary"
    elseif (r == 83 and b == 60 and g == 15) then
        runeRarity = "Hero"
    elseif (r == 19 and b == 70 and g == 45) then
        runeRarity = "Rare"
    elseif (r == 29 and b == 27 and g == 57) then
        runeRarity = "Magic"
    elseif (r ==57 and b == 38 and g == 45) then
        runeRarity = "Normal"
    else
        runeRarity = "NONE"
    end
    runeRarityRegion:highlight()
    statRegion9:highlight("Rune Rarity: " .. runeRarity)
end

--- This scans the rank/stars of the rune ---
function findRuneRank()
    runeRankRegion:highlight()
    local bestMatchIndex = existsMultiMax(starRuneImages, runeRankRegion)
    if bestMatchIndex == 1 then
        runeRank = 6
    elseif bestMatchIndex == 2 then
        runeRank = 5
    elseif bestMatchIndex == 3 then
        runeRank = 4
    elseif bestMatchIndex == 4 then
        runeRank = 3
    elseif bestMatchIndex == 5 then
        runeRank = 2
    elseif bestMatchIndex == 6 then
        runeRank = 1
    else runeRank = "NONE"
    end
    runeRankRegion:highlight()
    statRegion7:highlight("Rune Rank: " .. runeRank)
end

--- This scans the cost to upgrade the rune in order to determine it's level ---
function findRuneLvl()
    runeLvlRegion:highlight()
    if runeRank == 6 then
        local bestMatchIndex = existsMultiMax(sixStarImages, runeLvlRegion)
        runeLvl = (bestMatchIndex - 1)
    elseif runeRank == 5 then
        local bestMatchIndex = existsMultiMax(fiveStarImages, runeLvlRegion)
        runeLvl = (bestMatchIndex - 1)
    elseif runeRank == 4 then
        local bestMatchIndex = existsMultiMax(fourStarImages, runeLvlRegion)
        runeLvl = (bestMatchIndex - 1)
    elseif runeRank == 3 then
        local bestMatchIndex = existsMultiMax(threeStarImages, runeLvlRegion)
        runeLvl = (bestMatchIndex - 1)
    elseif runeRank == 2 then
        local bestMatchIndex = existsMultiMax(twoStarImages, runeLvlRegion)
        runeLvl = (bestMatchIndex - 1)
    elseif runeRank == 1 then
        local bestMatchIndex = existsMultiMax(oneStarImages, runeLvlRegion)
        runeLvl = (bestMatchIndex - 1)
    else runeLvl = ("NONE")
    end
    runeLvlRegion:highlight()
    statRegion8:highlight("Rune Lvl: " .. runeLvl)
end

--- This scans each region for a stat, then the stat value ---
function findMainStat()
    mainStatRegion:highlight()
    local bestMatchIndex = existsMultiMax(mainStatImages, mainStatRegion)
    if (bestMatchIndex == 1) then
        if  mainStatValueRegion:exists(Pattern("percentMain.png"):similar(.70)) then
            mainStat = ("HP%")
        else
            mainStat = ("HP")
        end
    elseif (bestMatchIndex == 2) then
        if  mainStatValueRegion:exists(Pattern("percentMain.png"):similar(.70)) then
            mainStat = ("DEF%")
        else
            mainStat = ("DEF")
        end
    elseif (bestMatchIndex == 3) then
        if  mainStatValueRegion:exists(Pattern("percentMain.png"):similar(.70)) then
            mainStat = ("ATK%")
        else
            mainStat = ("ATK")
        end
    elseif (bestMatchIndex == 4) then
        mainStat = ("SPD")
    elseif (bestMatchIndex == 5) then
        mainStat = ("CRI Rate")
    elseif (bestMatchIndex == 6) then
        mainStat = ("CRI DMG")
    elseif (bestMatchIndex == 7) then
        mainStat = ("RES")
    elseif (bestMatchIndex == 8) then
        mainStat = ("ACC")
    else mainStat = ("NONE")
    end
    mainStatRegion:highlight()
    statRegion1:highlight("Main Stat: " .. mainStat)
end
function findSubStat1()
    subStat1Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat1Region)
    if (bestMatchIndex == 1) then
        if  subStatValue1Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat1 = ("HP%")
        else
            subStat1 = ("HP")
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue1Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat1 = ("DEF%")
        else
            subStat1 = ("DEF")
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue1Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat1 = ("ATK%")
        else
            subStat1 = ("ATK")
        end
    elseif (bestMatchIndex == 4) then
        subStat1 = ("SPD")
    elseif (bestMatchIndex == 5) then
        subStat1 = ("CRI Rate")
    elseif (bestMatchIndex == 6) then
        subStat1 = ("CRI DMG")
    elseif (bestMatchIndex == 7) then
        subStat1 = ("RES")
    elseif (bestMatchIndex == 8) then
        subStat1 = ("ACC")
    else subStat5 = ("NONE")
    end
    subStat1Region:highlight()
    statRegion2:highlight("Substat 1: " .. subStat1)
end
function findSubStat2()
    subStat2Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat2Region)
    if (bestMatchIndex == 1) then
        if  subStatValue2Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat2 = ("HP%")
        else
            subStat2 = ("HP")
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue2Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat2 = ("DEF%")
        else
            subStat2 = ("DEF")
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue2Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat2 = ("ATK%")
        else
            subStat2 = ("ATK")
        end
    elseif (bestMatchIndex == 4) then
        subStat2 = ("SPD")
    elseif (bestMatchIndex == 5) then
        subStat2 = ("CRI Rate")
    elseif (bestMatchIndex == 6) then
        subStat2 = ("CRI DMG")
    elseif (bestMatchIndex == 7) then
        subStat2 = ("RES")
    elseif (bestMatchIndex == 8) then
        subStat2 = ("ACC")
    else subStat2 = ("NONE")
    end
    subStat2Region:highlight()
    statRegion3:highlight("Substat 2: " .. subStat2)
end
function findSubStat3()
    subStat3Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat3Region)
    if (bestMatchIndex == 1) then
        if  subStatValue3Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat3 = ("HP%")
        else
            subStat3 = ("HP")
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue3Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat3 = ("DEF%")
        else
            subStat3 = ("DEF")
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue3Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat3 = ("ATK%")
        else
            subStat3 = ("ATK")
        end
    elseif (bestMatchIndex == 4) then
        subStat3 = ("SPD")
    elseif (bestMatchIndex == 5) then
        subStat3 = ("CRI Rate")
    elseif (bestMatchIndex == 6) then
        subStat3 = ("CRI DMG")
    elseif (bestMatchIndex == 7) then
        subStat3 = ("RES")
    elseif (bestMatchIndex == 8) then
        subStat3 = ("ACC")
    else subStat3 = ("NONE")
    end
    subStat3Region:highlight()
    statRegion4:highlight("Substat 3: " .. subStat3)
end
function findSubStat4()
    subStat4Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat4Region)
    if (bestMatchIndex == 1) then
        if  subStatValue4Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat4 = ("HP%")
        else
            subStat4 = ("HP")
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue4Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat4 = ("DEF%")
        else
            subStat4 = ("DEF")
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue4Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat4 = ("ATK%")
        else
            subStat4 = ("ATK")
        end
    elseif (bestMatchIndex == 4) then
        subStat4 = ("SPD")
    elseif (bestMatchIndex == 5) then
        subStat4 = ("CRI Rate")
    elseif (bestMatchIndex == 6) then
        subStat4 = ("CRI DMG")
    elseif (bestMatchIndex == 7) then
        subStat4 = ("RES")
    elseif (bestMatchIndex == 8) then
        subStat4 = ("ACC")
    else subStat4 = ("NONE")
    end
    subStat4Region:highlight()
    statRegion5:highlight("Substat 4: " .. subStat4)
end
function findSubStat5()
    subStat5Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat5Region)
    if (bestMatchIndex == 1) then
        if  subStatValue5Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat5 = ("HP%")
        else
            subStat5 = ("HP")
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue5Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat5 = ("DEF%")
        else
            subStat5 = ("DEF")
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue5Region:exists(Pattern("percentSub.png"):similar(.70)) then
            subStat5 = ("ATK%")
        else
            subStat5 = ("ATK")
        end
    elseif (bestMatchIndex == 4) then
        subStat5 = ("SPD")
    elseif (bestMatchIndex == 5) then
        subStat5 = ("CRI Rate")
    elseif (bestMatchIndex == 6) then
        subStat5 = ("CRI DMG")
    elseif (bestMatchIndex == 7) then
        subStat5 = ("RES")
    elseif (bestMatchIndex == 8) then
        subStat5 = ("ACC")
    else subStat5 = ("NONE")
    end
    subStat5Region:highlight()
    statRegion6:highlight("Substat 5: " .. subStat5)
end

--- This is a specified region that displays what the bot thinks it can see ---
statRegion1 = Region(720, 350, 400, 60)
statRegion2 = Region(720, 410, 400, 50)
statRegion3 = Region(720, 460, 400, 50)
statRegion4 = Region(720, 510, 400, 50)
statRegion5 = Region(720, 560, 400, 50)
statRegion6 = Region(720, 610, 400, 50)
statRegion7 = Region(720, 250, 400, 50)
statRegion8 = Region(720, 300, 400, 50)
statRegion9 = Region(720, 200, 400, 50)

--- This calls the functions in order that we posted earlier ---
while true do
    findRuneRarity()
    findRuneRank()
    findRuneLvl()
    findMainStat()
    findSubStat1()
    findSubStat2()
    findSubStat3()
    findSubStat4()
    findSubStat5()
end