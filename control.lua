--[[
-- This is the main file for the mod, it adds the commands, and does execution when needed
--]]
--

local function cmdHandler(cmdEvent)
  if cmdEvent.player_index ~= nil then
    return
  end
  game.print(cmdEvent.parameter)
end
local function init()
  commands.add_command("print_to_all", "Writes a line to all players that are online", cmdHandler) 
end

script.on_load(init)
script.on_init(init)
