CreditsScene = class()
local backToMainButton
function CreditsScene:init()
    -- you can accept and set parameters here
 backToMainButton = Button("Dropbox:Blue Back Circle Button", vec2(60, 708, 100, 100))   
    --sprite()
end

function CreditsScene:draw()
    -- Codea does not automatically call this method
    --  background(255, 13, 0, 255)
    sprite("Dropbox:GoldGlitterbackground", 512, 384, 1024, 768)
    backToMainButton:draw() 
    fill(255, 255, 255, 255)
    fontSize(100)
    font("HelveticaNeue")
    text("Credits", 512, 680)
    fontSize(50)
    text("People Who Helped Create This", WIDTH/2, 550)
    text("Mars", WIDTH/2, 450)
     text("Sophia", WIDTH/2, 390)
      text("Niamh", WIDTH/2, 320 )
     text("Warsame Egeh",WIDTH/2, 260)
    text("Heejo Suh", WIDTH/2, 190)
    text("Ben Jenkins",WIDTH/2, 120)
    text("Alessandro Iaderosa", WIDTH/2, 50)
end


function CreditsScene:touched(touch)
    -- Codea does not automatically call this method
    backToMainButton:touched(touch)
    if(backToMainButton.selected == true) then
        Scene.Change("play")
    end
end
