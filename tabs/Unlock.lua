---unlock
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder unlocks a level


Unlock = class()

local numberOfCoinsNeededToUnlockLevel
local yesButton
local noButton

function Unlock:init()
    
    -- different costs for each level
    numberOfCoinsNeededToUnlockLevel= string.format("%d", selectedLevel*1.7)
    yesButton= Button("Dropbox:Green Cancel Button", vec2(WIDTH/2-150, 200))
    noButton= Button("Dropbox:Red Cancel Button", vec2(WIDTH/2+150, 200))
end

function Unlock:draw()
    fontSize (70)
    background(125, 171, 190, 255)
    font("GillSans-Bold")
    textMode (CENTER)
    pushStyle ()
    fill(19, 25, 28, 255)
    text("Do you want to", WIDTH/2, HEIGHT-100)
    text("unlock level "..selectedLevel, WIDTH/2, HEIGHT-200)
    text("for "..numberOfCoinsNeededToUnlockLevel.." coins?", WIDTH/2, HEIGHT-300)
    yesButton:draw()
    noButton:draw()
    
    fontSize(40)
    text("Yes",WIDTH/2-150, 200)
    text("No",WIDTH/2+150, 200)
end
 
function Unlock:touched(touch)
    yesButton:touched(touch)
    noButton:touched(touch)
    
    if (noButton.selected== true) then -- go back to main
        sound(SOUND_PICKUP, 0.3)
        if selectedLevel<=10 then
            Scene.Change("easyStore")
        end
        if selectedLevel>=11 and selectedLevel<=20 then
            Scene.Change("mediumStore")
        end
        if selectedLevel>=21 then
            Scene.Change("hardStore")
        end
        end

        --- if enough stars
        if (yesButton.selected== true) and  (coins>=numberOfStarsNeededToUnlockLevel) then 
        sound(SOUND_PICKUP, 0.3)
        levels[selectedLevel]=true
        numberOfCoinsOwned= numberOfCoinsOwned-numberOfCoinsNeededToUnlockLevel
        saveLocalData ("coinsOwned", numberOfCoinsOwned)
        alert("You unlocked this level!", "Congrats!")
        if selectedLevel<=10 then
            Scene.Change("easyStore")
        end
        if selectedLevel>=11 and selectedLevel<=20 then
            Scene.Change("mediumStore")
        end
        if selectedLevel>=21 then
            Scene.Change("hardStore")
        end
        end
        ---if not enough stars
        if (yesButton.selected== true) and  (coinsOwned>=numberOfCoinsNeededToUnlockLevel) then
        sound(SOUND_PICKUP, 0.3)
        alert("You do not have enough stars!", "Nope!")
        if selectedLevel<=10 then
            Scene.Change("easyStore")
        end
        if selectedLevel>=11 and selectedLevel<=20 then
            Scene.Change("mediumStore")
        end
        if selectedLevel>=21 then
            Scene.Change("hardStore")
        end
    end
end
