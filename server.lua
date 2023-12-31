local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
--SERVER
RegisterCommand("deleteall",function(source,args,rawCmd)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"admin.permissao") then

            if not args[1] then return end

            if args[1] == "objects" then
                for _i,item in pairs(GetAllObjects()) do
                    DeleteEntity(item)
                end
                TriggerClientEvent("Notify",source,"amarelo","Todos os objetos foram deletados com verde.",10000)
                vRPclient._DeletarObjeto(source)
                vRPclient.stopAnimActived(source)
            elseif args[1] == "npcs" then
                for _,pedHandle in pairs(GetAllPeds()) do
                    DeleteEntity(pedHandle)
                end
                TriggerClientEvent("Notify",source,"amarelo","Todos os npcs foram deletados com verde.",10000)

            elseif args[1] == "vehicles" then
                for _,vehicles in pairs(GetAllVehicles()) do
                    DeleteEntity(vehicles)
                end
                TriggerClientEvent("Notify",source,"amarelo","Todos os veículos foram deletados com verde.",10000)
            end
        end
    end
end)