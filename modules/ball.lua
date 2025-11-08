function createBall()
    ball = {}
    ball.x = 500
    ball.y = 400
    ball.idealSpeed = 300
    ball.size = 30
    ball.collider = world:newCircleCollider(ball.x, ball.y, 10)
    ball.collider:setCollisionClass('ball')
    ball.collider:setRestitution(1)
    ball.body = ball.collider:getBody()
    ball.moving = false

end

function ballVectorNormalizer()
    ball.vx, ball.vy = ball.body:getLinearVelocity()
    ball.speed = math.sqrt(ball.vx ^ 2 + ball.vy ^ 2)

    if ball.speed < 1 then
        ball.moving = false
    else if ball.speed > 0 then
        ball.moving = true
    end
    end

    if ball.speed < 300 and ball.speed > 300 then
        local vxNew = (ball.vx / ball.speed) * ball.idealSpeed
        local vyNew = (ball.vy / ball.speed) * ball.idealSpeed

        ball.collider:setLinearVelocity(vxNew, vyNew)
        ball.collider:destroy()
    end
end

function drawBall()
    if ball.moving == true then
        love.graphics.print(ball.speed, 200, 200)
        love.graphics.print(ball.vx, 200, 300)
        love.graphics.print(ball.vy, 200, 400)
    end
end