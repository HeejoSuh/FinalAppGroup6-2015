--- HardStore Scene
---created by Heejo Suh
---Created in 2015~2016
---Created for the ICS2O
---This folder lists the levels in the world


HardStore = class()

local buttonPos={}
local numbers={}
local goBackButton

local lv1
local lv2
local lv3
local lv4
local lv5
local lv6
local lv7
local lv8
local lv9
local lv10

function HardStore:init()
    -- you can accept and set parameters here
    goBackButton= Button("Dropbox:Teal Back Circle Button", vec2(100, HEIGHT-100))
    
    buttonPos={vec2(WIDTH/6, HEIGHT/2+50), vec2(2*(WIDTH/6), HEIGHT/2+50), vec2(3*(WIDTH/6), HEIGHT/2+50), vec2(4*(WIDTH/6), HEIGHT/2+50), vec2(5*(WIDTH/6), HEIGHT/2+50), vec2(WIDTH/6, HEIGHT/2-200), vec2(2*(WIDTH/6), HEIGHT/2-200), vec2(3*(WIDTH/6), HEIGHT/2-200), vec2(4*(WIDTH/6), HEIGHT/2-200), vec2(5*(WIDTH/6), HEIGHT/2-200)}
    numbers={"21", "22", "23", "24", "25", "26", "27", "28", "29", "30"}
    lv1= Button("Dropbox:Blue Move Scene Forward Button", vec2(WIDTH/6, HEIGHT/2+50))
    lv2= Button("Dropbox:Blue Move Scene Forward Button", vec2(2*(WIDTH/6), HEIGHT/2+50))
    lv3= Button("Dropbox:Blue Move Scene Forward Button", vec2(3*(WIDTH/6), HEIGHT/2+50))
    lv4= Button("Dropbox:Blue Move Scene Forward Button", vec2(4*(WIDTH/6), HEIGHT/2+50))
    lv5= Button("Dropbox:Blue Move Scene Forward Button", vec2(5*(WIDTH/6), HEIGHT/2+50))
    lv6= Button("Dropbox:Blue Move Scene Forward Button", vec2(WIDTH/6, HEIGHT/2-200))
    lv7= Button("Dropbox:Blue Move Scene Forward Button", vec2(2*(WIDTH/6), HEIGHT/2-200))
    lv8= Button("Dropbox:Blue Move Scene Forward Button", vec2(3*(WIDTH/6), HEIGHT/2-200))
    lv9= Button("Dropbox:Blue Move Scene Forward Button", vec2(4*(WIDTH/6), HEIGHT/2-200))
    lv10= Button("Dropbox:Blue Move Scene Forward Button", vec2(5*(WIDTH/6), HEIGHT/2-200))
end

function HardStore:draw()
    -- Codea does not automatically call this method
    background(121, 181, 186, 255)
    fontSize (60)
    fill(74, 97, 104, 255)
    font("Copperplate")
    textMode (CENTER)
    pushStyle ()
    text("Hard World Store", WIDTH/2, HEIGHT-100)
    goBackButton:draw()
    
    lv1:draw()
    lv2:draw()
    lv3:draw()
    lv4:draw()
    lv5:draw()
    lv6:draw()
    lv7:draw()
    lv8:draw()
    lv9:draw()
    lv10:draw()
    
    fontSize(20)
    for i= 1,10 do
        text(numbers[i],buttonPos[i].x, buttonPos[i].y-90)
    end
        for i=21, 30 do
        if levels[i]==false then
        sprite("Dropbox:lock", buttonPos[i-20].x, buttonPos[i-20].y, 150, 110)
        end
    end
end

function HardStore:touched(touch)
    -- Codea does not automatically call this method
    goBackButton:touched(touch)
    if (goBackButton.selected==true) then
        Scene.Change("store")
    end
    
    lv1:touched(touch)
    if (lv1.selected==true) then
        selectedLevel=21
        ask()
    end
    lv2:touched(touch)
    if (lv2.selected==true) then
        selectedLevel=22
        ask()
    end
    lv3:touched(touch)
    if (lv3.selected==true) then
        selectedLevel=23
        ask()
    end
    lv4:touched(touch)
    if (lv4.selected==true) then
        selectedLevel=24
        ask()
    end
    lv5:touched(touch)
    if (lv5.selected==true) then
        selectedLevel=25
        ask()
    end
    lv6:touched(touch)
    if (lv6.selected==true) then
        selectedLevel=26
        ask()
    end
    lv7:touched(touch)
    if (lv7.selected==true) then
        selectedLevel=27
        ask()
    end
    lv8:touched(touch)
    if (lv8.selected==true) then
        selectedLevel=28
        ask()
    end
    lv9:touched(touch)
    if (lv9.selected==true) then
        selectedLevel=29
        ask()
    end
    lv10:touched(touch)
    if (lv10.selected==true) then
        selectedLevel=30
        ask()
    end
end              
    
function ask()
     if (levels[selectedLevel]== true) then
        alert("This world is already unlocked!", "Nope!")
    elseif (levels[selectedLevel]== false) then
        if (levels[selectedLevel-1]== false) then
        alert("You have not unlocked".." the previous level", "Nope!")
        else 
        Scene.Change("unlock")
        end
    end
end


