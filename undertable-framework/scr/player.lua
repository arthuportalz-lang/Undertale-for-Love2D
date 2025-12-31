local player = {}

player.x = 320
player.y = 240
player.dir = "left"
local speed = 4
local gamera = require("libs.gamera")

function player.update(dt)
    if love.keyboard.isDown("left") then
		player.x = player.x - speed
		player.dir = "left"
	end

	if love.keyboard.isDown("right") then
		player.x = player.x + speed
		player.dir = "right"
	end

	if love.keyboard.isDown("up") then
		player.y = player.y - speed
		player.dir = "up"
	end

	if love.keyboard.isDown("down") then
		player.y = player.y + speed
		player.dir = "down"
    end
end

return player