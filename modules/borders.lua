function createBorders()
    local h = love.graphics.getHeight()
    local w = love.graphics.getWidth()
    local baseGoalSize = h/3
    local p1GoalSize = 100
    local p2GoalSize = 0

    net = world:newRectangleCollider((w/2), 0, 1, h)
    net:setType('static')
    net:setCollisionClass('net')

    player1Goal = world:newRectangleCollider(-3, (baseGoalSize - p1GoalSize), 2, (baseGoalSize + (p1GoalSize*2)))
    player1Goal:setType('static')
    player1Goal:setCollisionClass('goal1')

    player2Goal = world:newRectangleCollider(w+1, (baseGoalSize - p2GoalSize), 2, (baseGoalSize + (p2GoalSize*2)))
    player2Goal:setType('static')
    player2Goal:setCollisionClass('goal2')

    p1GoalBody = player1Goal:getBody()
    p2GoalBody = player2Goal:getBody()
    p1GoalY = (p1GoalBody:getY() / 1.5)
    p1GoalHeight = h - (p1GoalY + baseGoalSize)
    p2GoalY = (p2GoalBody:getY() / 1.5)
    p2GoalHeight = h - (p2GoalY + baseGoalSize)

    leftBorderUpper = world:newRectangleCollider(0, 0, 1, (p1GoalY))
    leftBorderUpper:setType('static')
    leftBorderUpper:setCollisionClass('border')

    leftBorderLower = world:newRectangleCollider(0, (p1GoalY + p1GoalHeight), 1, h/3)
    leftBorderLower:setType('static')
    leftBorderLower:setCollisionClass('border') 

    rightBorderUpper = world:newRectangleCollider(w-1, 0, 1, (p2GoalY))
    rightBorderUpper:setType('static')
    rightBorderUpper:setCollisionClass('border')

    rightBorderLower = world:newRectangleCollider(w-1, (p2GoalY + p2GoalHeight), 1, h/3)
    rightBorderLower:setType('static')
    rightBorderLower:setCollisionClass('border')    

    upperBorder = world:newRectangleCollider(0, 0, w, 1)
    upperBorder:setType('static')
    upperBorder:setCollisionClass('border')

    bottomBorder = world:newRectangleCollider(0, h-1, w, 1)
    bottomBorder:setType('static')
    bottomBorder:setCollisionClass('border')
end