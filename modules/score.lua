function scoreInitialize()
    p1Score = 0
    p2Score = 0
    scoreStep = 1
end

function p1Scores()
    p1Score = p1Score + scoreStep

    ball.collider:destroy()
    createBall(((love.graphics.getWidth()/2) + 200), 400)
end

function p2Scores()
    p2Score = p2Score + scoreStep

    ball.collider:destroy()
    createBall(((love.graphics.getWidth()/2) - 200), 400)
end

function drawScores()
    love.graphics.print(p1Score, ((love.graphics.getWidth()/2) - 50), 30)
    love.graphics.print(p2Score, ((love.graphics.getWidth()/2) + 50), 30)
end