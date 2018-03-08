function love.conf(t)
    t.modules.audio = true      --enables audio
    t.modules.keyboard = true   --enables keyboard
    t.modules.event = true      --enables event module
    t.modules.image = true      --same but for image: " " image " "
    t.modules.graphics = true   --""graphics""
    t.modules.timer = true      --""timer""
    t.modules.mouse = true      --""mouse""
    t.modules.sound = true      --""sound""
    t.modules.thread = true     --etc.
    t.modules.physics = true
    t.console = false           --debugging
    t.window.title = "Whiteout"         --Title of the window of the game
    t.window.author = "Melody Coleman" --author of game
    t.window.fullscreen = false  --enable fullscreen
    t.window.vsync = false
    t.window.msaa = 0
    t.window.height = 600
    t.window.width = 800        
end