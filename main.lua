io.stdout:setvbuf'no' 

trail = require "trail" --require the library

local function lerp(a, b, k) --smooth transitions
  if a == b then
    return a
  else
    if math.abs(a-b) < 0.002 then return b else return a * (1-k) + b * k end
  end
end

function love.load()
  
  love.window.setTitle("Click to enable trail")
  
  image = love.graphics.newImage("icon.png")
  image1 = love.graphics.newImage("1.png")
  image2 = love.graphics.newImage("2.png")
  
  --
  
  x, y = 200, 200
  dx, dy = 0, 0
  
  test = {}
  
  test[1] = trail
    :new({
      type = "mesh",
      content = {
        source = image2,
        width = 26,
        mode = "stretch"
      },
      duration = .4
    })
    :setMotion(600, 0, 0, 0)
    :setPosition(x, y)
    
  test[2] = trail
    :new({
      type = "mesh",
      content = {
        source = image1,
        width = 6,
        mode = "stretch"
      },
      duration = 1.5
    })
    :setPosition(x, y)
    
  test[3] = trail
    :new({
      type = "mesh",
      content = {
        source = image1,
        width = 6,
        mode = "stretch"
      },
      duration = 1.5
    })
    :setPosition(x, y)
    
  test[4] = trail
    :new({
      type = "point",
      content = {
        type = "image",
        source = image
      },
      duration = .4,
      amount = 32,
      fade = "shrink"
    })
    :setMotion(200, 60)
    :setPosition(x, y)
    
  test[5] = trail
    :new({
      type = "point",
      content = {
        type = "image",
        source = image
      },
      duration = .4,
      amount = 32,
      fade = "shrink"
    })
    :setMotion(200, -60)
    :setPosition(x, y)
  
end

function love.update(dt)
  
  dx, dy = x, y
  x, y = lerp(x, love.mouse.getX(), 4*dt), lerp(y, love.mouse.getY(), 4*dt)
  dx, dy = x - dx, y - dy
  
  local time = love.timer.getTime()
  
  test[1]
    :setMotion(600, 0, 0, math.sin(time * math.pi * 4) * 100)
    :setPosition(x, y)
    
  test[2]
    :setPosition(x + math.cos(time * 3.2) * 160 * math.cos(time * .2), y + math.sin(time * 3.2) * 160 * math.sin(time * .2))
    
  test[3]
    :setPosition(x - math.cos(time * 3.2) * 160 * math.cos(time * .2), y - math.sin(time * 3.2) * 160 * math.sin(time * .2))
    
  test[4]:setPosition(x, y)
  test[5]:setPosition(x, y)
    
  trail:update(dt)
  
end

function love.draw()
  
  love.graphics.setColor(255, 255, 255, 100)
  test[4]:draw()
  test[5]:draw()
  
  love.graphics.setColor(255, 255, 255)
  test[1]:draw()
  test[2]:draw()
  test[3]:draw()
  
  local time = love.timer.getTime()
  
  local rotation = math.cos(time * math.pi * 2) * .2
  local size = math.cos(time * math.pi * 4) * .02 + 1.02
  love.graphics.draw(image, x, y, rotation, size, size, 32, 32)
  
end

function love.mousepressed(x, y, button)
  
  test[4]:toggle()
  test[5]:toggle()
  
end