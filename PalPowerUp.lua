localPath = scriptPath()
setImagePath(localPath .. "images")
Settings:setScriptDimension(true, 1920)
Settings:setCompareDimension(true, 1920)
commonLib = loadstring(httpGet("https://raw.githubusercontent.com/AnkuLua/commonLib/master/commonLib.lua"))()

        --- This checks the version number on github to see if an update is needed, then downloads the newest files ---
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

--- These are the base values that need to be set to an initial value ---
runeX = 0
runeY = 0
flats = 0
runeSoldHid = 0

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
runeRankRegion = Region(660, 320, 155, 30)
runeLvlRegion = Region(770, 770, 130, 60)
runeRarityRegion = Region(790, 470, 20, 20)
closeButtonRegion = Region(860, 940, 300, 110)
powerUpButtonRegion = Region (1670, 320, 230, 85)
sellButtonRegion = Region (1670, 420, 230, 85)
yesButtonRegion = Region (655, 590, 280, 120)
yesButtonRegion2 = Region (655, 655, 280, 120)

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
threeStarImages ={  "3starLvl0.png", "3starLvl1.png", "3starLvl2.png", "3starLvl3.png",
                    "3starLvl4.png", "3starLvl5.png", "3starLvl6.png", "3starLvl7.png",
                    "3starLvl8.png", "3starLvl9.png", "3starLvl10.png", "3starLvl11.png",
                    "3starLvl12.png", "3starLvl13.png", "3starLvl14.png", "3starLvl15.png" }
twoStarImages ={    "2starLvl0.png", "2starLvl1.png", "2starLvl2.png", "2starLvl3.png",
                    "2starLvl4.png", "2starLvl5.png", "2starLvl6.png", "2starLvl7.png",
                    "2starLvl8.png", "2starLvl9.png", "2starLvl10.png", "2starLvl11.png",
                    "2starLvl12.png", "2starLvl13.png", "2starLvl14.png", "2starLvl15.png" }
oneStarImages ={    "1starLvl0.png", "1starLvl1.png", "1starLvl2.png", "1starLvl3.png",
                    "1starLvl4.png", "1starLvl5.png", "1starLvl6.png", "1starLvl7.png",
                    "1starLvl8.png", "1starLvl9.png", "1starLvl10.png", "1starLvl11.png",
                    "1starLvl12.png", "1starLvl13.png", "1starLvl14.png", "1starLvl15.png" }

--- These are the possible Mainstat Images ---
mainStatImages = {  "hpMain.png", "defMain.png", "atkMain.png", "spdMain.png", "criRateMain.png",
                    "criDmgMain.png", "resMain.png", "accMain.png"}

--- These are the possible Substat Images ---
subStatImages = {   "hpSub.png", "defSub.png", "atkSub.png", "spdSub.png", "criRateSub.png",
                    "criDmgSub.png", "resSub.png", "accSub.png"}

--- This is the dialog box ---
function dialogBox()
    dialogInit()
    addTextView("How many runes?")
    addEditNumber("RuneQuantity", 1)
    newRow()
    addTextView("Upgrade Normal to: ")
    addEditNumber("upgradeNormalLmt", 0)
    addTextView("  ")
    addTextView("How many flat substats to sell?")
    addEditNumber("normalFlats", 4)
    addTextView("(0 will sell all, 4 will sell none)")
    newRow()
    addTextView("Upgrade Magic to: ")
    addEditNumber("upgradeMagicLmt", 0)
    addTextView("  ")
    addTextView("How many flat substats to sell?")
    addEditNumber("magicFlats", 4)
    addTextView("(0 will sell all, 4 will sell none)")
    newRow()
    addTextView("Upgrade Rare to: ")
    addEditNumber("upgradeRareLmt", 3)
    addTextView("  ")
    addTextView("How many flat substats to sell?")
    addEditNumber("rareFlats", 4)
    addTextView("(0 will sell all, 4 will sell none)")
    newRow()
    addTextView("Upgrade Hero to: ")
    addEditNumber("upgradeHeroLmt", 9)
    addTextView("  ")
    addTextView("How many flat substats to sell?")
    addEditNumber("heroFlats", 4)
    addTextView("(0 will sell all, 4 will sell none)")
    newRow()
    addTextView("Upgrade Legendary to: ")
    addEditNumber("upgradeLegendaryLmt", 12)
    addTextView("  ")
    addTextView("How many flat substats to sell?")
    addEditNumber("legendaryFlats", 4)
    addTextView("(0 will sell all, 4 will sell none)")
    dialogShowFullScreen("PalPowerUp Summoners War")
end

--- This scans the pixels at the location to determine the rarity of the rune based on background color ---
function findRuneRarity()
    runeRarityRegion:highlight()
    local loc = Location(800, 480)
    local r,g,b = getColor(loc)
    if (r > 40 and b < 40 and g < 40) then
        runeRarity = "Legendary"
    elseif (r > 40 and b > 40 and g < 40) then
        runeRarity = "Hero"
    elseif (r < 40 and b > 40 and g > 40) then
        runeRarity = "Rare"
    elseif (r < 40 and b < 40 and g > 40) then
        runeRarity = "Magic"
    elseif (r > 40 and b < 40 and g > 40) then
        runeRarity = "Normal"
    else
        runeRarity = "NONE"
        scriptExit ( "This rune's rarity cannot be determined")
    end
    runeRarityRegion:highlight()
end

--- This scans a pixel starting at the 6th star, then moves to the left to determine the rank/stars of the rune ---
function findRuneRank()
    runeRankRegion:highlight()
    local loc = Location(798, 338)
    local r, g, b = getColor(loc)
    if (r == 253 and g == 208 and b == 12) then
        runeRank = 6
    elseif (r == 244 and g == 58 and b == 222) then
        runeRank = 6
    elseif (r == 244 and g == 59 and b == 223) then
        runeRank = 6
    else
        local loc = Location(774, 338)
        local r, g, b = getColor(loc)
        if (r == 253 and g == 208 and b == 12) then
            runeRank = 5
        elseif (r == 244 and g == 58 and b == 222) then
            runeRank = 5
        elseif (r == 244 and g == 59 and b == 223) then
            runeRank = 5
        else
            local loc = Location(750, 338)
            local r, g, b = getColor(loc)
            if (r == 253 and g == 208 and b == 12) then
                runeRank = 4
            elseif (r == 244 and g == 58 and b == 222) then
                runeRank = 4
            elseif (r == 244 and g == 59 and b == 223) then
                runeRank = 4
            else
                local loc = Location(726, 338)
                local r, g, b = getColor(loc)
                if (r == 253 and g == 208 and b == 12) then
                    runeRank = 3
                elseif (r == 244 and g == 58 and b == 222) then
                    runeRank = 3
                elseif (r == 244 and g == 59 and b == 223) then
                    runeRank = 3
                else
                    local loc = Location(702, 338)
                    local r, g, b = getColor(loc)
                    if (r == 253 and g == 208 and b == 12) then
                        runeRank = 2
                    elseif (r == 244 and g == 58 and b == 222) then
                        runeRank = 2
                    elseif (r == 244 and g == 59 and b == 223) then
                        runeRank = 2
                    else
                        local loc = Location(678, 338)
                        local r, g, b = getColor(loc)
                        if (r == 253 and g == 208 and b == 12) then
                            runeRank = 1
                        elseif (r == 244 and g == 58 and b == 222) then
                            runeRank = 1
                        elseif (r == 244 and g == 59 and b == 223) then
                            runeRank = 1
                        else
                            runeRank = "NONE"
                        end
                    end
                end
            end
        end
    end
    runeRankRegion:highlight()
end

--- This scans the mana cost to upgrade the rune in order to determine it's level ---
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
end

--- These scan each region for a stat, then the stat value area to determine if a percent sign is present ---
function findMainStat()
    mainStatRegion:highlight()
    local bestMatchIndex = existsMultiMax(mainStatImages, mainStatRegion)
    if (bestMatchIndex == 1) then
        if  mainStatValueRegion:exists(Pattern("percentMain.png"):similar(.70), .1) then
            mainStat = ("HP%")
        else
            mainStat = ("HP")
        end
    elseif (bestMatchIndex == 2) then
        if  mainStatValueRegion:exists(Pattern("percentMain.png"):similar(.70), .1) then
            mainStat = ("DEF%")
        else
            mainStat = ("DEF")
        end
    elseif (bestMatchIndex == 3) then
        if  mainStatValueRegion:exists(Pattern("percentMain.png"):similar(.70), .1) then
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
end
function findSubStat1()
    subStat1Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat1Region)
    if (bestMatchIndex == 1) then
        if  subStatValue1Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat1 = ("HP%")
        else
            subStat1 = ("HP")
            flats = flats+1
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue1Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat1 = ("DEF%")
        else
            subStat1 = ("DEF")
            flats = flats+1
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue1Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat1 = ("ATK%")
        else
            subStat1 = ("ATK")
            flats = flats+1
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
    else subStat1 = ("NONE")
    end
    subStat1Region:highlight()
end
function findSubStat2()
    subStat2Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat2Region)
    if (bestMatchIndex == 1) then
        if  subStatValue2Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat2 = ("HP%")
        else
            subStat2 = ("HP")
            flats = flats+1
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue2Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat2 = ("DEF%")
        else
            subStat2 = ("DEF")
            flats = flats+1
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue2Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat2 = ("ATK%")
        else
            subStat2 = ("ATK")
            flats = flats+1
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
end
function findSubStat3()
    subStat3Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat3Region)
    if (bestMatchIndex == 1) then
        if  subStatValue3Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat3 = ("HP%")
        else
            subStat3 = ("HP")
            flats = flats+1
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue3Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat3 = ("DEF%")
        else
            subStat3 = ("DEF")
            flats = flats+1
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue3Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat3 = ("ATK%")
        else
            subStat3 = ("ATK")
            flats = flats+1
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
end
function findSubStat4()
    subStat4Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat4Region)
    if (bestMatchIndex == 1) then
        if  subStatValue4Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat4 = ("HP%")
        else
            subStat4 = ("HP")
            flats = flats+1
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue4Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat4 = ("DEF%")
        else
            subStat4 = ("DEF")
            flats = flats+1
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue4Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat4 = ("ATK%")
        else
            subStat4 = ("ATK")
            flats = flats+1
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
end
function findSubStat5()
    subStat5Region:highlight()
    local bestMatchIndex = existsMultiMax(subStatImages, subStat5Region)
    if (bestMatchIndex == 1) then
        if  subStatValue5Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat5 = ("HP%")
        else
            subStat5 = ("HP")
            flats = flats+1
        end
    elseif (bestMatchIndex == 2) then
        if  subStatValue5Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat5 = ("DEF%")
        else
            subStat5 = ("DEF")
            flats = flats+1
        end
    elseif (bestMatchIndex == 3) then
        if  subStatValue5Region:exists(Pattern("percentSub.png"):similar(.70), .1) then
            subStat5 = ("ATK%")
        else
            subStat5 = ("ATK")
            flats = flats+1
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
end

--- This combines the various rune functions to an overall function which evaluates the rune ---
function runeEvaluation ()
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

--- This selects the runes in the rune management window ---
function runeSpotter ()
    if runeSoldHid == 1 then
        runeX = runeX - 1
        runeSoldHid = 0
    end
    if runeX > 7 then runeX = 0 runeY = runeY+1
    end
    if runeY > 3 then runeY = 0
        dragDrop(Location(920, 930), Location(920, 550))
    end
    runeSpot = Location(920 + runeX*125, 615 + runeY*125)
    runeX = runeX+1
end

--- This powers up the rune based on the above dialog options ---
function runePowerUp()
    if runeRarity == "Normal" then
        while (runeLvl < upgradeNormalLmt)
            do
                click(Location(550, 675))
                wait (4)
                findRuneLvl()
            end
    elseif runeRarity == "Magic" then
        while (runeLvl < upgradeMagicLmt)
        do
            click(Location(550, 675))
            wait (4)
            findRuneLvl()
        end
    elseif runeRarity == "Rare" then
        while (runeLvl < upgradeRareLmt)
        do
            click(Location(550, 675))
            wait (4)
            findRuneLvl()
        end
    elseif runeRarity == "Hero" then
        while (runeLvl < upgradeHeroLmt)
        do
            click(Location(550, 675))
            wait (4)
            findRuneLvl()
        end
    elseif runeRarity == "Legendary" then
        while (runeLvl < upgradeLegendaryLmt)
        do
            click(Location(550, 675))
            wait (4)
            findRuneLvl()
        end
    elseif runeRarity == "NONE" then
        scriptExit ( "This rune's rarity cannot be determined")
    end
end

--- This accesses the rune powerup screen ---
function goToRuneManagement ()
    Region(1180, 1000, 160, 50):existsClick(Pattern("monsterIsland.png"):similar(.70))
    Region(950, 500, 150, 75):existsClick(Pattern("runeButton.png"):similar(.70))
    Region(1130, 635, 145, 55):existsClick(Pattern("manageButton.png"):similar(.70))
end

--- This determines whether to sell the rune based on the above dialog options ---
function sellGetRune ()
    if runeRarity == "Legendary" and legendaryFlats <= flats then
        sellRune()
        runeSoldHid = 1
    elseif runeRarity == "Hero" and heroFlats <= flats then
        sellRune()
        runeSoldHid = 1
    elseif runeRarity == "Rare" and rareFlats <= flats then
        sellRune()
        runeSoldHid = 1
    elseif runeRarity == "Magic" and magicFlats <= flats then
        sellRune()
        runeSoldHid = 1
    elseif runeRarity == "Normal" and normalFlats <= flats then
        sellRune()
        runeSoldHid = 1
    end
end

--- This how the bot handles selling ---
function sellRune()
    keyevent (4)
    sellButtonRegion:waitClick(Pattern("sell.png"):similar(0.6), 3)
    yesButtonRegion:waitClick(Pattern("yes.png"):similar(0.6), 3)
    yesButtonRegion2:existsClick(Pattern("yes.png"):similar(0.6), 3)
    wait(2.5)
end

--- This combines the above to call into effect the bot ---
function runeManagementSelection()
    repeat
        runeSpotter()
        click(runeSpot)
        powerUpButtonRegion:waitClick(Pattern("powerUp1.png"):similar(0.6), 3)
        closeButtonRegion:wait(Pattern("close.png"):similar(0.6), 3)
        runeEvaluation ()
        sellGetRune ()
        if runeSoldHid == 0 then
            runePowerUp()
            closeButtonRegion:waitClick(Pattern("close.png"):similar(0.6), 3)
        end
        RuneQuantity = RuneQuantity - 1
        flats = 0
    until(RuneQuantity == 0)
end

--- This calls the functions in order that we posted earlier ---
while true do
    dialogBox()
    runeManagementSelection()
    scriptExit("Done evaluating your runes!")
end