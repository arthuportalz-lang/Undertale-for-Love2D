local sprites = {}
local mainfont
local fullscr = false
local tick = require("libs.tick")
local music = love.audio.newSource("assets/sounds/music/mus_lancer.wav", "stream")
local looped = true
local player = require 'scr.player'

function love.load()
	love.mouse.setVisible(false)
	love.window.setIcon(love.image.newImageData("icon.png"))
	love.window.setTitle("UNDERTABLE Framework for Love2D")
	love.graphics.setDefaultFilter("nearest", "nearest")
	mainfont = love.graphics.newFont("assets/fonts/mainfont.ttf", 16)

	sprites.bg_firstroom = love.graphics.newImage("assets/maps/bg_firstroom.png")
	sprites.left = love.graphics.newImage("assets/sprites/player/playerl/playerl0.png")
	sprites.right = love.graphics.newImage("assets/sprites/player/playerr/playerr0.png")
	sprites.up = love.graphics.newImage("assets/sprites/player/playeru/playeru0.png")
	sprites.down = love.graphics.newImage("assets/sprites/player/playerd/playerd0.png")
end

function love.update(dt)
	player.update(dt)
	player.spr_player = sprites[player.dir]

	if not music:isPlaying() then
		love.audio.play(music)
	end
end

function love.draw()
	love.graphics.setFont(mainfont)
	love.graphics.print("hello undertale", 0, 0)
	love.graphics.draw(sprites.bg_firstroom, 0, 0, 0, 2, 2, 0, 0)
	love.graphics.draw(player.spr_player, player.x, player.y, 0, 2, 2, 0, 0)
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end