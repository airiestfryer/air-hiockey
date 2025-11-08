function love.load()
    -- loading libraries
    wf = require "libraries/windfield"

    require "modules/players"
    require "modules/borders"
    require "modules/ball"

    -- gamestate
    gamestate = "mainMenu"
    
    -- initializing world
    world = wf.newWorld(0, 0, false)
    world:addCollisionClass('player')
    world:addCollisionClass('border')
    world:addCollisionClass('ball')
    world:addCollisionClass('net', {ignores = {'ball'}})
    world:addCollisionClass('goal1', {ignores = {'ball'}})
    world:addCollisionClass('goal2', {ignores = {'ball'}})

    -- setting window title and size
    love.window.setTitle("Air Hockey")
    love.window.setMode(1366, 768)
    --love.window.setMode(0, 0)

    -- loading players
    playersLoad()

    -- setting map borders
    createBorders()

    -- loading ball
    createBall()
end

function love.update(dt)
    ------------------------------- MainMenu --------------------------------
    if gamestate == "mainMenu" then

    end

    ------------------------------- Playing --------------------------------
    if gamestate == "playing" then
        ballVectorNormalizer()

        world:update(dt)
        -- player movement
        playerMovement(dt)
    end

    ------------------------------- Paused --------------------------------
    if gamestate == "paused" then

    end
end

function love.keypressed(key)                   --gamestate manager (?)
    if gamestate == "playing" then
        if key == "escape" then
            gamestate = "paused"
        end
    else if gamestate == "paused" then
        if key == "escape" then
            gamestate = "playing"
        end
    else if gamestate == "mainMenu" then
        if love.keyboard.isDown("space") then
            gamestate = "playing"
        end
    end
end

function love.draw()
    ------------------------------- MainMenu --------------------------------
    if gamestate == "mainMenu" then
        love.graphics.printf("Press SPACE to start", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
    end

    ------------------------------- Playing --------------------------------
    if gamestate == "playing" then
        -- game world
        world:draw()

        -- user interface
        love.graphics.print(tostring(ball.moving), 100, 100)
        drawBall()
    end

    ------------------------------- Paused --------------------------------
    if gamestate == "paused" then
        love.graphics.printf("Game Paused\nPress ESCAPE to resume", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
    end
end

end
end     --?????