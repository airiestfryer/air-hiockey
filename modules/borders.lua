function createBorders()
    local h = love.graphics.getHeight()
    local w = love.graphics.getWidth()
    local p1GoalWidth = 1
    local p2GoalWidth = 1

    net = world:newRectangleCollider((w/2), 0, 1, h)
    net:setType('static')
    net:setCollisionClass('net')

    player1Goal = world:newRectangleCollider(-3, (h/3)-p1GoalWidth, 2, (h/3)+(p1GoalWidth*2))
    player1Goal:setType('static')
    player1Goal:setCollisionClass('goal1')

    player2Goal = world:newRectangleCollider(w+1, h/3, 2, h/3)
    player2Goal:setType('static')
    player2Goal:setCollisionClass('goal2')

    p1GoalX = player1Goal:getX()
    p1GoalHeight = player1Goal:getHeight()
    p2GoalX = player2Goal:getX()
    p2GoalHeight = player2Goal:getHeight()

    upperBorder = world:newRectangleCollider(0, 0, w, 1)
    upperBorder:setType('static')
    upperBorder:setCollisionClass('border')

    leftBorderUpper = world:newRectangleCollider(0, 0, 1, p1GoalX)
    leftBorderUpper:setType('static')
    leftBorderUpper:setCollisionClass('border')

    leftBorderLower = world:newRectangleCollider(0, (p1GoalX + p1GoalHeight), 1, h/3)
    leftBorderLower:setType('static')
    leftBorderLower:setCollisionClass('border')

    rightBorderUpper = world:newRectangleCollider(w-1, 0, 1, p2GoalX)
    rightBorderUpper:setType('static')
    rightBorderUpper:setCollisionClass('border')

    rightBorderLower = world:newRectangleCollider(w-1, (p2GoalX + p2GoalHeight), 1, h/3)
    rightBorderLower:setType('static')
    rightBorderLower:setCollisionClass('border')

    bottomBorder = world:newRectangleCollider(0, h-1, w, 1)
    bottomBorder:setType('static')
    bottomBorder:setCollisionClass('border')
end