local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP","seoul_dice")

vRP.defInventoryItem({"dice", "dice", "<img src='https://cdn.discordapp.com/attachments/718420494755430481/722683584170819624/download.jpg' height='200' width='200' />", function(args) 
    local choices = {}
	
	choices["*use"] = {function(player,choice,mod)
		local user_id = vRP.getUserId({player})
        if user_id ~= nil then
          --  vRP.tryGetInventoryItem({user_id, "dice", 1, true}) 
            TriggerClientEvent('seoul_dice', player) --Do not delete seoul_dice If you delete it, the script will not run
            vRPclient.notify(player,{"Use dice"} ) 
            vRP.closeMenu({player})
        end
    end}
   
    return choices
end, 0.05})  