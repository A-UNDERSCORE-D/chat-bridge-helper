--[[
-- This is the main file for the mod, it adds the commands, and does execution when needed
--]]
--

local function cmdHandler(cmdEvent)
  if cmdEvent.player_index ~= nil then
    return -- No running this for players
  end
  game.print(cmdEvent.parameter)
end

local function get_player(id)
  if id == nil then
    log("warning: got an id that is nil")
    return nil
  end
  player = game.get_player(id)
  if player == nil then
    log("warning: got a player id that doesnt exist in the player list")
    return nil
  end
  return player
end

local function on_death(death_event)
  player = get_player(death_event.player_index)
  if player == nil then 
    return
  end
  
  if death_event.cause ~= nil then
    log({"", "[death] " .. player.name .. " was killed by ", death_event.cause.localised_name})
  else
    log("[death] " .. player.name .. " died")
  end
end

local function on_respawn(event) 
  player = get_player(event.player_index)
  if player == nil then
    return
  end
  
  log("[respawn] " .. player.name .. " respawned")

end

local function init()
  commands.add_command("print_to_all", "Writes a line to all players that are online", cmdHandler) 
end

script.on_load(init)
script.on_init(init)
script.on_event(defines.events.on_player_died, on_death)
script.on_event(defines.events.on_player_respawned, on_respawn)
