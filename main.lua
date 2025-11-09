function love.load()
    -- loading libraries
    wf = require "libraries/windfield"

    require "modules/players"
    require "modules/borders"
    require "modules/ball"
    require "modules/score"

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

    -- initializing score variables
    scoreInitialize()
end

function love.update(dt)
    ------------------------------- MainMenu --------------------------------
    if gamestate == "mainMenu" then

    end

    ------------------------------- Playing --------------------------------
    if gamestate == "playing" then
        ball:speedControl()

        world:update(dt)
        -- player movement
        playerMovement(dt)

        -- score system
        if player1Goal:enter('ball') then
            p2Scores()
        end

        if player2Goal:enter('ball') then
            p1Scores()
        end
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
    elseif gamestate == "paused" then
        if key == "escape" then
            gamestate = "playing"
        end
    elseif gamestate == "mainMenu" then
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
        -- game world / drwa hitboxes or colliders
        world:draw()

        -- user interface
        drawScores()
    end

    ------------------------------- Paused --------------------------------
    if gamestate == "paused" then
        love.graphics.printf("Game Paused\nPress ESCAPE to resume", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
    end
end