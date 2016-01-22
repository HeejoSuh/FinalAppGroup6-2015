---Store Scene
---created by Heejo Suh
---Created in 2015~2016
---Created for the ICS2O
---This folder lists the types of worlds

Store = class()

local easy
local medium
local hard
local back

function Store:init()
    -- you can accept and set parameters here
    easy= Button("Dropbox:Easy mode", vec2(WIDTH/2-150, HEIGHT/2))
    medium= Button("Dropbox:Meedium mode", vec2(WIDTH/2, HEIGHT/2))
    hard= Button("Dropbox:Hard mode", vec2(WIDTH/2+150, HEIGHT/2))
    back= Button("Dropbox:Teal Back Circle Button", vec2(100, HEIGHT-100))
end

function Store:draw()
    -- Codea does not automatically call this method
    background(118, 165, 186, 255)
    easy:draw()
    medium:draw()
    hard:draw()
    back:draw()
    fontSize (40)
    fill(21, 21, 21, 255)
    font("Futura-Medium")
    textMode (CENTER)
    pushStyle ()
    text("Store", WIDTH/2, HEIGHT-100)
end

function Store:touched(touch)
    -- Codea does not automatically call this method
    easy:touched(touch)
    if (easy.selected==true) then
        Scene.Change("easyStore")
    end
    medium:touched(touch)
    if (medium.selected==true) then
        Scene.Change("mediumStore")
    end
    
    hard:touched(touch)
    if (hard.selected==true) then
        Scene.Change("hardStore")
    end

    back:touched(touch)
    if (back.selected==true) then
        Scene.Change("play")
    end
end
