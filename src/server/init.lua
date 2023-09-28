local thisBlocks = {}
local dataLoaded = false
CreateThread(function()
  while not Core do Wait(500); end
  for k,v in pairs(Config.Blockades) do 
    math.randomseed(os.time() * math.random(3,50))
    local chance = math.random(100)
    if chance <= v.ChanceBlocked then 
      thisBlocks[k] = true
      print("^2Dirk-Blockades^7 | "..k.." blockade has been enabled this server start^7")
    else
      print("^2Dirk-Blockades^1 | "..k.." blockade has been disabled this server start^7") 
    end
  end
  
  dataLoaded = true
  Core.Callback("Dirk-Blockades:GetBlockades", function(src,cb)
    -- while not dataLoaded do Wait(500); end 
    cb(thisBlocks)
  end)
end)