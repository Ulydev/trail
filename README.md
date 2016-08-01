trail
==============

trail is a LÖVE library that... generates trails, you guessed it!

![demo][demo]

Setup
----------------

```lua
local trail = require "trail" --require the library
```

Usage
----------------

Create new trail
```lua
function love.load()
  myTrail = trail:new({
      type = "mesh",
      content = {
        source = love.graphics.newImage("image.png"),
        width = 26,
        mode = "stretch"
      },
      duration = .4
    })
  myTrail:setMotion(600, 0)
  myTrail:setPosition(x, y)
end
```

Update library
```lua
function love.update(dt)
  trail:update(dt)
end
```

Draw trail
```lua
function love.draw()
  myTrail:draw()
end
```

Trail settings
----------------

```lua
settings = {
  type,
  content = {}, --depends on trail type
  duration,
  amount,
  fade
}
```



Trail types
----------------

Point
```lua
settings = {
  type = "point",
  content = {
    --
    type = "image",
    source,
    --
    type = "rectangle",
    width,
    height,
    --
    type = "circle",
    radius
    --
  },
  fade --"shrink" or "grow"
}
```

Mesh
```lua
settings = {
  type = "mesh",
  content = {
    source, --image
    width,
    mode
  }
}
```

Methods
----------------

Methods can be chained.
```lua
myTrail:setPosition(...):setMotion(...)
```

Update trails
```lua
trail:update(dt)
--or update each trail separately
myTrail:update(dt)
```

Draw trail
```lua
--affected by love.graphics.setColor
myTrail:draw()
```

Create trail
```lua
myTrail = trail:new(settings)
```

Set trail position
```lua
myTrail:setPosition(x, y)
```

Set trail motion
```lua
myTrail:setMotion(x, y, vx, vy)
```

Set trail width (mesh)
```lua
myTrail:setWidth(width)
```

Enable/disable trail
```lua
myTrail:enable()
myTrail:disable()

myTrail:toggle()
```

----------

Thanks to Spyro and Taehl for their work on [trail meshes](https://love2d.org/forums/viewtopic.php?f=5&t=77608).

[demo]: http://img4.hostingpics.net/pics/43495675et.gif
