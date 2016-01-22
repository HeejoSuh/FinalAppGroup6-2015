----StarsCollect
---created by Heejo Suh
---Created in 2015
---Created for the ICS2O
---This folder determines the number of stars given

StarsCollect= class()


local starFilledIn
local starBlank

local firstStarPosition= vec2(WIDTH/2-300, HEIGHT-250)
local secondStarPosition= vec2(WIDTH/2, HEIGHT-250)
local thirdStarPosition= vec2(WIDTH/2+300, HEIGHT-250)

local playAgainButton  ---goes back and play the game again
local levelsButton  ---goes to levels
local settingsButton  ---goes to settings
local mainScreenButton --goes to main/home screen

local numberOfCoinsGiven
local numberOfStarsGiven

----init
function StarsCollect:init()
    
    starFilledIn= SpriteObject("Dropbox:Star Gold")
    starBlank= SpriteObject("Dropbox:Star Black") 
    starFilledIn.draggable= false
    starBlank.draggable= false
    
      ---buttons
    mainScreenButton= Button("Dropbox:Teal Forward Buttokkin", vec2(WIDTH/2-100, HEIGHT/2-100))
    playAgainButton= Button("Dropbox:Teal Redo Button", vec2(WIDTH/2+100, HEIGHT/2-100))
    settingsButton= Button("Dropbox:Teal Settings Button", vec2(WIDTH/2+300, HEIGHT/2-200))
    levelsButton= Button("Dropbox:Teal Level Menu Button", vec2(WIDTH/2-300, HEIGHT/2-200))
    
    if numberOfQuestionsGotRight-numberOfQuestionsGotWrong>highScore then
    saveLocalData("highScore", numberOfQuestionsGotRight-numberOfQuestionsGotWrong)
    gamecenter.submitScore(math.floor(highScore), "NameThatShapeLeaderboard")
    end
    
    --easy mode
    if (selectedLevel<=10) then
        numberOfCoinsGiven= tonumber(string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*1.6))
        numberOfStarsGiven= tonumber(string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*0.8))
    
    ---medium
    elseif (selectedLevel>=11) and (selectedLevel<=20) then
        numberOfCoinsGiven= tonumber(string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*1.3))
        numberOfStarsGiven= tonumber(string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*0.5))
    
    ---hard
    elseif (selectedLevel>=21) then 
        numberOfCoinsGiven= tonumber(string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*1.1))
        numberOfStarsGiven= tonumber(string.format("%d", (numberOfQuestionsGotRight-numberOfQuestionsGotWrong)*0.3))
     end
end


---draw
function StarsCollect:draw()
    background(66, 126, 131, 255)
      ---number of stars the player has achieved so far
    fontSize (50)
    fill(229, 220, 95, 255)
    font("Noteworthy-Bold")
    textMode (CENTER)
    pushStyle ()
    if (numberOfCoinsGiven~=0) then
      ---add in the achieved stars to the number of stars the player has collected
    numberOfCoinsOwned= numberOfCoinsOwned + numberOfCoinsGiven
    saveLocalData("coinsOwned", numberOfCoinsOwned) 
    end
    text(coins, 350, 380)
    sprite("Platformer Art:Coin", 315, 380)
    
    
    fontSize (80)
    fill(18, 21, 26, 255)
    font("Verdana-Bold")
    
     --- The stars actually given(now) to the player 
    ---zero star
    if (numberOfStarsGiven==0) then
        starBlank:draw(firstStarPosition.x,firstStarPosition.y)
        starBlank:draw(secondStarPosition.x,secondStarPosition.y)
        starBlank:draw(thirdStarPosition.x, thirdStarPosition.y)
        text("Nice!", WIDTH/2, HEIGHT-150)
    end
    ---one star
    if (numberOfStarsGiven==1) then
        starFilledIn:draw(firstStarPosition.x,firstStarPosition.y)
        starBlank:draw(secondStarPosition.x,secondStarPosition.y)
        starBlank:draw(thirdStarPosition.x, thirdStarPosition.y)
        text("Good!", WIDTH/2, HEIGHT-150)
        table.insert("stars", selectedLevel, 1)
    end
    ---two stars
    if (numberOfStarsGiven==2) then
        starFilledIn:draw(firstStarPosition.x,firstStarPosition.y)
        starFilledIn:draw(secondStarPosition.x,secondStarPosition.y)
        starBlank:draw(thirdStarPosition.x, thirdStarPosition.y)
        text("Great!", WIDTH/2, HEIGHT-150)
        table.insert("stars", selectedLevel, 2)
    end
    ---three stars
    if (numberOfStarsGiven>=3) then
        starFilledIn:draw(firstStarPosition.x,firstStarPosition.y)
        starFilledIn:draw(secondStarPosition.x,secondStarPosition.y)
        starFilledIn:draw(thirdStarPosition.x, thirdStarPosition.y)
        text("Awesome!", WIDTH/2, HEIGHT-150)
        table.insert("stars", selectedLevel, 3)
    end
    
    playAgainButton:draw()
    settingsButton:draw()
    levelsButton:draw()
    mainScreenButton:draw()
    
end
---touch
    
function StarsCollect:touched(touch)
    ---Get the stars
    
    starFilledIn:touched(touch)
    starBlank:touched(touch)
    
    playAgainButton:touched(touch)
    if (playAgainButton.selected==true) then
        sound(SOUND_PICKUP, 0.3)
        Scene.Change("main")
    end
    
    settingsButton:touched(touch)
    if (settingsButton.selected==true)then
        sound(SOUND_PICKUP, 0.3)
        Scene.Change("settings")
    end
    
    levelsButton:touched(touch)
    if (levelsButton.selected==true) then
        sound(SOUND_PICKUP, 0.3)
        Scene.Change("levels")
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
    mainScreenButton:touched(touch)
    if (mainScreenButton.selected==true) then
        sound(SOUND_PICKUP, 0.3)
        Scene.Change("gamePlay")
    end
end

