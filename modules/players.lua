function playersLoad()
    player1 = {}
    player1.x = 400
    player1.y = 300
    player1.speed = 200
    player1.size = 50
    player1.collider = world:newCircleCollider(player1.x, player1.y, player1.size)

    player2 = {}
    player2.x = 1000
    player2.y = 300
    player2.speed = 200
    player2.size = 50
    player2.collider = world:newCircleCollider(player2.x, player2.y, player2.size)
end

function playerMovement(dt)
    -- movement code for player 1
    local XVelocity1 = 0
    local YVelocity1 = 0

    if love.keyboard.isDown("a") then
        XVelocity1 = player1.speed * -1
    end

    if love.keyboard.isDown("d") then
        XVelocity1 = player1.speed * 1
    end

    if love.keyboard.isDown("w") then
        YVelocity1 = player1.speed * -1
    end

    if love.keyboard.isDown("s") then
        YVelocity1 = player1.speed * 1
    end

    player1.collider:setLinearVelocity(XVelocity1, YVelocity1)

    -- movement code for player 2
    local XVelocity2 = 0
    local YVelocity2 = 0

    if love.keyboard.isDown("left") then
        XVelocity2 = player2.speed * -1
    end

    if love.keyboard.isDown("right") then
        XVelocity2 = player2.speed * 1
    end

    if love.keyboard.isDown("up") then
        YVelocity2 = player2.speed * -1
    end

    if love.keyboard.isDown("down") then
        YVelocity2 = player2.speed * 1
    end

    player2.collider:setLinearVelocity(XVelocity2, YVelocity2)
end