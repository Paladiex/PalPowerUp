localPath = scriptPath()
setImagePath(localPath .. "images")
Settings:setScriptDimension(true, 1920)
Settings:setCompareDimension(true, 1920)
setScanInterval(1/120)

        --- This checks the version number on github to see if an update is needed ---
latestVersion = httpGet("https://raw.githubusercontent.com/Paladiex/PalPowerUp/master/version.lua")
currentVersion = dofile(localPath .."version.lua")
print (latestVersion)
print (currentVersion)
if current_version == http_version then print ("You are up to date!") else print ("You need to update!") end

--- These are the regions at the "Rune Power-up" screen ---
mainStatRegion = Region(1230, 350, 90, 50)
subStat1Region = Region(1230, 410, 90, 50)
subStat2Region = Region(1230, 460, 90, 50)
subStat3Region = Region(1230, 510, 90, 50)
subStat4Region = Region(1230, 560, 90, 50)
mainStatValueRegion = Region(1330, 350, 200, 50)
subStatValue1Region = Region(1330, 410, 200, 50)
subStatValue2Region = Region(1330, 460, 200, 50)
subStatValue3Region = Region(1330, 510, 200, 50)
subStatValue4Region = Region(1330, 560, 200, 50)
runeRankRegion = Region(660, 310, 160, 30)
runeLvlRegion = Region(770, 770, 130, 60)


--- These are the possible Rune Rank Images ---
sixStarRune = (Pattern("6starRunePowerUp.png"):similar(.80))
fiveStarRune = (Pattern("5starRunePowerUp.png"):similar(.70))

--- These are the possible Rune Level Images ---
sixStarLvl0 = (Pattern("6starLvl0.png"):similar(.70))
sixStarLvl1 = (Pattern("6starLvl1.png"):similar(.70))
sixStarLvl2 = (Pattern("6starLvl2.png"):similar(.70))
sixStarLvl3 = (Pattern("6starLvl3.png"):similar(.70))
sixStarLvl4 = (Pattern("6starLvl4.png"):similar(.70))
sixStarLvl5 = (Pattern("6starLvl5.png"):similar(.70))
sixStarLvl6 = (Pattern("6starLvl6.png"):similar(.70))
sixStarLvl7 = (Pattern("6starLvl7.png"):similar(.70))
sixStarLvl8 = (Pattern("6starLvl8.png"):similar(.70))
sixStarLvl9 = (Pattern("6starLvl9.png"):similar(.70))
sixStarLvl10 = (Pattern("6starLvl10.png"):similar(.70))
sixStarLvl11 = (Pattern("6starLvl11.png"):similar(.70))
sixStarLvl12 = (Pattern("6starLvl12.png"):similar(.70))
sixStarLvl13 = (Pattern("6starLvl13.png"):similar(.70))
sixStarLvl14 = (Pattern("6starLvl14.png"):similar(.70))
sixStarLvl15 = (Pattern("6starLvl15.png"):similar(.70))
fiveStarLvl0 = (Pattern("5starLvl0.png"):similar(.70))
fiveStarLvl1 = (Pattern("5starLvl1.png"):similar(.70))
fiveStarLvl2 = (Pattern("5starLvl2.png"):similar(.70))
fiveStarLvl3 = (Pattern("5starLvl3.png"):similar(.70))
fiveStarLvl4 = (Pattern("5starLvl4.png"):similar(.70))
fiveStarLvl5 = (Pattern("5starLvl5.png"):similar(.70))
fiveStarLvl6 = (Pattern("5starLvl6.png"):similar(.70))
fiveStarLvl7 = (Pattern("5starLvl7.png"):similar(.70))
fiveStarLvl8 = (Pattern("5starLvl8.png"):similar(.70))
fiveStarLvl9 = (Pattern("5starLvl9.png"):similar(.70))
fiveStarLvl10 = (Pattern("5starLvl10.png"):similar(.70))
fiveStarLvl11 = (Pattern("5starLvl11.png"):similar(.70))
fiveStarLvl12 = (Pattern("5starLvl12.png"):similar(.70))
fiveStarLvl13 = (Pattern("5starLvl13.png"):similar(.70))
fiveStarLvl14 = (Pattern("5starLvl14.png"):similar(.70))
fiveStarLvl15 = (Pattern("5starLvl15.png"):similar(.70))

--- These are the possible Mainstat Images ---
hpMain = (Pattern("hpMain.png"):similar(.70))
defMain = (Pattern("defMain.png"):similar(.70))
atkMain = (Pattern("atkMain.png"):similar(.70))
spdMain = (Pattern("spdMain.png"):similar(.70))
criRateMain = (Pattern("criRateMain.png"):similar(.70))
criDmgMain = (Pattern("criDmgMain.png"):similar(.70))
resMain = (Pattern("resMain.png"):similar(.70))
accMain = (Pattern("accMain.png"):similar(.70))
percentMain = (Pattern("percentMain.png"):similar(.70))

--- These are the possible Substat Images ---
hpSub = (Pattern("hpSub.png"):similar(.70))
defSub = (Pattern("defSub.png"):similar(.70))
atkSub = (Pattern("atkSub.png"):similar(.70))
spdSub = (Pattern("spdSub.png"):similar(.70))
criRateSub = (Pattern("criRateSub.png"):similar(.70))
criDmgSub = (Pattern("criDmgSub.png"):similar(.70))
resSub = (Pattern("resSub.png"):similar(.70))
accSub = (Pattern("accSub.png"):similar(.70))
percentSub = (Pattern("percentSub.png"):similar(.70))

--- These are the Stats/Variables we want the bot to find ---
mainStat = "Unknown"
mainStatValue = "Unknown"
subStat1 = "Unknown"
subStatValue1 = "Unknown"
subStat2 = "Unknown"
subStatValue2 = "Unknown"
subStat3 = "Unknown"
subStatValue3 = "Unknown"
subStat4 = "Unknown"
subStatValue4 = "Unknown"

--- This scans the rank/stars of the rune ---
function findRuneRank()
    runeRankRegion:highlight()
    if runeRankRegion:exists(sixStarRune) then
        runeRank = 6
    elseif runeRankRegion:exists(fiveStarRune) then
        runeRank = 5
    else
        runeRank = "Unknown"
    end
    runeRankRegion:highlight()
    statRegion7:highlight("Rune Rank: " .. runeRank)
end

--- This scans the cost to upgrade the rune in order to determine it's level ---
function findRuneLvl()
    runeLvlRegion:highlight()
    if runeRank == 6 then
        if runeLvlRegion:exists(sixStarLvl0) then
            runeLvl = 0
        elseif runeLvlRegion:exists(sixStarLvl1) then
            runeLvl = 1
        elseif runeLvlRegion:exists(sixStarLvl2) then
            runeLvl = 2
        elseif runeLvlRegion:exists(sixStarLvl3) then
            runeLvl = 3
        elseif runeLvlRegion:exists(sixStarLvl4) then
            runeLvl = 4
        elseif runeLvlRegion:exists(sixStarLvl5) then
            runeLvl = 5
        elseif runeLvlRegion:exists(sixStarLvl6) then
            runeLvl = 6
        elseif runeLvlRegion:exists(sixStarLvl7) then
            runeLvl = 7
        elseif runeLvlRegion:exists(sixStarLvl8) then
            runeLvl = 8
        elseif runeLvlRegion:exists(sixStarLvl9) then
            runeLvl = 9
        elseif runeLvlRegion:exists(sixStarLvl10) then
            runeLvl = 10
        elseif runeLvlRegion:exists(sixStarLvl11) then
            runeLvl = 11
        elseif runeLvlRegion:exists(sixStarLvl12) then
            runeLvl = 12
        elseif runeLvlRegion:exists(sixStarLvl13) then
            runeLvl = 13
        elseif runeLvlRegion:exists(sixStarLvl14) then
            runeLvl = 14
        elseif runeLvlRegion:exists(sixStarLvl15) then
            runeLvl = 15
        else
            runeLvl = "Unknown"
        end
    end
    if runeRank == 5 then
        if runeLvlRegion:exists(fiveStarLvl0) then
            runeLvl = 0
        elseif runeLvlRegion:exists(fiveStarLvl1) then
            runeLvl = 1
        elseif runeLvlRegion:exists(fiveStarLvl2) then
            runeLvl = 2
        elseif runeLvlRegion:exists(fiveStarLvl3) then
            runeLvl = 3
        elseif runeLvlRegion:exists(fiveStarLvl4) then
            runeLvl = 4
        elseif runeLvlRegion:exists(fiveStarLvl5) then
            runeLvl = 5
        elseif runeLvlRegion:exists(fiveStarLvl6) then
            runeLvl = 6
        elseif runeLvlRegion:exists(fiveStarLvl7) then
            runeLvl = 7
        elseif runeLvlRegion:exists(fiveStarLvl8) then
            runeLvl = 8
        elseif runeLvlRegion:exists(fiveStarLvl9) then
            runeLvl = 9
        elseif runeLvlRegion:exists(fiveStarLvl10) then
            runeLvl = 10
        elseif runeLvlRegion:exists(fiveStarLvl11) then
            runeLvl = 11
        elseif runeLvlRegion:exists(fiveStarLvl12) then
            runeLvl = 12
        elseif runeLvlRegion:exists(fiveStarLvl13) then
            runeLvl = 13
        elseif runeLvlRegion:exists(fiveStarLvl14) then
            runeLvl = 14
        elseif runeLvlRegion:exists(fiveStarLvl15) then
            runeLvl = 15
        else
            runeLvl = "Unknown"
        end
    end
    runeLvlRegion:highlight()
    statRegion8:highlight("Rune Lvl: " .. runeLvl)
end

--- This scans each region for a stat, then the stat value ---
function findMainStat()
    mainStatRegion:highlight()
    if mainStatRegion:exists(hpMain) then
        if mainStatValueRegion:exists(percentMain) then
            mainStat = "HP%"
        else
            mainStat = "HP"
        end
    elseif mainStatRegion:exists(defMain) then
        if mainStatValueRegion:exists(percentMain) then
            mainStat = "DEF%"
        else
            mainStat = "DEF"
        end
    elseif mainStatRegion:exists(atkMain) then
        if mainStatValueRegion:exists(percentMain) then
            mainStat = "ATK%"
        else
            mainStat = "ATK"
        end
    elseif mainStatRegion:exists(spdMain) then
        mainStat = "SPD"
    elseif mainStatRegion:exists(criRateMain) then
        mainStat = "CRI Rate"
    elseif mainStatRegion:exists(criDmgMain) then
        mainStat = "CRI DMG"
    elseif mainStatRegion:exists(resMain) then
        mainStat = "RES"
    elseif mainStatRegion:exists(accMain) then
        mainStat = "ACC"
    end
    mainStatRegion:highlight()
    statRegion1:highlight("Main Stat: " .. mainStat)
end
function findSubStat1()
    subStat1Region:highlight()
    if subStat1Region:exists(hpSub) then
        if subStatValue1Region:exists(percentSub) then
            subStat1 = "HP%"
        else
            subStat1 = "HP"
        end
    elseif subStat1Region:exists(defSub) then
        if subStatValue1Region:exists(percentMain) then
            subStat1 = "DEF%"
        else
            subStat1 = "DEF"
        end
    elseif subStat1Region:exists(atkSub) then
        if subStatValue1Region:exists(percentMain) then
            subStat1 = "ATK%"
        else
            subStat1 = "ATK"
        end
    elseif subStat1Region:exists(spdSub) then
        subStat1 = "SPD"
    elseif subStat1Region:exists(criRateSub) then
        subStat1 = "CRI Rate"
    elseif subStat1Region:exists(criDmgSub) then
        subStat1 = "CRI DMG"
    elseif subStat1Region:exists(resSub) then
        subStat1 = "RES"
    elseif subStat1Region:exists(accSub) then
        subStat1 = "ACC"
    end
    subStat1Region:highlight()
    statRegion2:highlight("Substat 1: " .. subStat1)
end
function findSubStat2()
    subStat2Region:highlight()
    if subStat2Region:exists(hpSub) then
        if subStatValue2Region:exists(percentSub) then
            subStat2 = "HP%"
        else
            subStat2 = "HP"
        end
    elseif subStat2Region:exists(defSub) then
        if subStatValue2Region:exists(percentMain) then
            subStat2 = "DEF%"
        else
            subStat2 = "DEF"
        end
    elseif subStat2Region:exists(atkSub) then
        if subStatValue2Region:exists(percentMain) then
            subStat2 = "ATK%"
        else
            subStat2 = "ATK"
        end
    elseif subStat2Region:exists(spdSub) then
        subStat2 = "SPD"
    elseif subStat2Region:exists(criRateSub) then
        subStat2 = "CRI Rate"
    elseif subStat2Region:exists(criDmgSub) then
        subStat2 = "CRI DMG"
    elseif subStat2Region:exists(resSub) then
        subStat2 = "RES"
    elseif subStat2Region:exists(accSub) then
        subStat2 = "ACC"
    end
    subStat2Region:highlight()
    statRegion3:highlight("Substat 2: " .. subStat2)
end
function findSubStat3()
    subStat3Region:highlight()
    if subStat3Region:exists(hpSub) then
        if subStatValue3Region:exists(percentSub) then
            subStat3 = "HP%"
        else
            subStat3 = "HP"
        end
    elseif subStat3Region:exists(defSub) then
        if subStatValue3Region:exists(percentMain) then
            subStat3 = "DEF%"
        else
            subStat3 = "DEF"
        end
    elseif subStat3Region:exists(atkSub) then
        if subStatValue3Region:exists(percentMain) then
            subStat3 = "ATK%"
        else
            subStat3 = "ATK"
        end
    elseif subStat3Region:exists(spdSub) then
        subStat3 = "SPD"
    elseif subStat3Region:exists(criRateSub) then
        subStat3 = "CRI Rate"
    elseif subStat3Region:exists(criDmgSub) then
        subStat3 = "CRI DMG"
    elseif subStat3Region:exists(resSub) then
        subStat3 = "RES"
    elseif subStat3Region:exists(accSub) then
        subStat3 = "ACC"
    end
    subStat3Region:highlight()
    statRegion4:highlight("Substat 3: " .. subStat3)
end
function findSubStat4()
    subStat4Region:highlight()
    if subStat4Region:exists(hpSub) then
        if subStatValue4Region:exists(percentSub) then
            subStat4 = "HP%"
        else
            subStat4 = "HP"
        end
    elseif subStat4Region:exists(defSub) then
        if subStatValue4Region:exists(percentMain) then
            subStat4 = "DEF%"
        else
            subStat4 = "DEF"
        end
    elseif subStat4Region:exists(atkSub) then
        if subStatValue4Region:exists(percentMain) then
            subStat4 = "ATK%"
        else
            subStat4 = "ATK"
        end
    elseif subStat4Region:exists(spdSub) then
        subStat4 = "SPD"
    elseif subStat4Region:exists(criRateSub) then
        subStat4 = "CRI Rate"
    elseif subStat4Region:exists(criDmgSub) then
        subStat4 = "CRI Dmg"
    elseif subStat4Region:exists(resSub) then
        subStat4 = "RES"
    elseif subStat4Region:exists(accSub) then
        subStat4 = "ACC"
    end
    subStat4Region:highlight()
    statRegion5:highlight("Substat 4: " .. subStat4)
end
function findSubStat5()
    subStat5Region:highlight()
    if subStat5Region:exists(hpSub) then
        if subStatValue5Region:exists(percentSub) then
            subStat5 = "HP%"
        else
            subStat5 = "HP"
        end
    elseif subStat5Region:exists(defSub) then
        if subStatValue5Region:exists(percentMain) then
            subStat5 = "DEF%"
        else
            subStat5 = "DEF"
        end
    elseif subStat5Region:exists(atkSub) then
        if subStatValue5Region:exists(percentMain) then
            subStat5 = "ATK%"
        else
            subStat5 = "ATK"
        end
    elseif subStat5Region:exists(spdSub) then
        subStat5 = "SPD"
    elseif subStat5Region:exists(criRateSub) then
        subStat5 = "CRI Rate"
    elseif subStat5Region:exists(criDmgSub) then
        subStat5 = "CRI Dmg"
    elseif subStat5Region:exists(resSub) then
        subStat5 = "RES"
    elseif subStat5Region:exists(accSub) then
        subStat5 = "ACC"
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

--- This calls the functions in order that we posted earlier ---
while true do
    findRuneRank()
    findRuneLvl()
    findMainStat()
    findSubStat1()
    findSubStat2()
    findSubStat3()
    findSubStat4()
end