CreateThread(function()
  while not Core do Wait(500); end 
  while not Core.Player.Ready() do Wait(500); end 

  Core.Callback("Dirk-Blockades:GetBlockades", function(blockades)
    for name, enabled in pairs(blockades) do 
      local blockInfo = Config.Blockades[name]
      if blockInfo then 
        for k,v in pairs(blockInfo.Objects) do 
          Core.Objects.Register(string.format("%s:%s:Blockade", name, k),  {
            Type         = "object",
            Pos          = vector4(v.Pos.x, v.Pos.y, v.Pos.z - 1.0, v.Pos.w),
            Model        = v.Model,
            RenderDist   = 50.0, 
            
            },function(callback, data)
            if callback == "spawn" then 
              SetEntityHeading(data.entity, v.Pos.w)
              FreezeEntityPosition(data.entity, true)
              SetEntityInvincible(data.entity, true)
              SetBlockingOfNonTemporaryEvents(data.entity, true)
              SetPedCanBeTargetted(data.entity, false)
            elseif callback == "despawn" then
          
            end  
          end)
        end
      end
    end
  end)
end)