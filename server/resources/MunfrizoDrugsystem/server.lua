
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "vrp_hackatms") 
vRP = Proxy.getInterface("vRP")  

RegisterServerEvent('kokain')
AddEventHandler('kokain', function()
    local user_id = vRP.getUserId({source})
    
    vRP.giveInventoryItem({user_id,"kokainblade",1,true})
    
   end)

   RegisterServerEvent('kokain2')
AddEventHandler('kokain2', function()
    local user_id = vRP.getUserId({source})
    
    vRP.giveInventoryItem({user_id,"kokainblade",10,true})
    
   end)

   RegisterServerEvent('Fremstill')
   AddEventHandler('Fremstill', function()
       local user_id = vRP.getUserId({source})
       local money = 500
       if vRP.tryGetInventoryItem({user_id, "kokainblade", 3, true}) then
        vRP.giveInventoryItem({user_id,"kokain",1,true})
        
       end
      end)

      RegisterServerEvent('Fremstill2')
      AddEventHandler('Fremstill2', function()
          local user_id = vRP.getUserId({source})
          local money = 500
          if vRP.tryGetInventoryItem({user_id, "kokainblade", 30, true}) then
           vRP.giveInventoryItem({user_id,"kokain",10,true})
           
          end
         end)      

      RegisterServerEvent('saalg')
      AddEventHandler('saalg', function()
          local user_id = vRP.getUserId({source})
          local money = 850
          if vRP.tryGetInventoryItem({user_id, "kokain", 1, true}) then
            vRP.giveInventoryItem({user_id,"dirty_money",850,true})
            TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
          end
         end)

         RegisterServerEvent('saalg2')
         AddEventHandler('saalg2', function()
             local user_id = vRP.getUserId({source})
             local money = 8500
             if vRP.tryGetInventoryItem({user_id, "kokain", 10, true}) then
              vRP.giveInventoryItem({user_id,"dirty_money",8500,true})
               TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
             end
            end)         

         -- Hash/Skunk

RegisterServerEvent('LavHash')
AddEventHandler('LavHash', function()
    local user_id = vRP.getUserId({source})
    
    vRP.giveInventoryItem({user_id,"hampblade",1,true})
    
   end)

   RegisterServerEvent('LavHash2')
AddEventHandler('LavHash2', function()
    local user_id = vRP.getUserId({source})
    
    vRP.giveInventoryItem({user_id,"hampblade",10,true})
    
   end)

   RegisterServerEvent('FremstillHash')
   AddEventHandler('FremstillHash', function()
       local user_id = vRP.getUserId({source})
       local money = 500
       if vRP.tryGetInventoryItem({user_id, "hampblade", 2, true}) then
        vRP.giveInventoryItem({user_id,"skunk",1,true})
        
       end
      end)

      RegisterServerEvent('FremstillHash2')
      AddEventHandler('FremstillHash2', function()
          local user_id = vRP.getUserId({source})
          local money = 500
          if vRP.tryGetInventoryItem({user_id, "hampblade", 20, true}) then
           vRP.giveInventoryItem({user_id,"skunk",1,true})
           
          end
         end)     

      RegisterServerEvent('Hsaalg')
      AddEventHandler('Hsaalg', function()
          local user_id = vRP.getUserId({source})
          local money = 400
          if vRP.tryGetInventoryItem({user_id, "skunk", 1, true}) then
            vRP.giveInventoryItem({user_id,"dirty_money",400,true})
            TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
          end
         end)

         RegisterServerEvent('Hsaalg2')
         AddEventHandler('Hsaalg2', function()
             local user_id = vRP.getUserId({source})
             local money = 4000
             if vRP.tryGetInventoryItem({user_id, "skunk", 10, true}) then
              vRP.giveInventoryItem({user_id,"dirty_money",4000,true})
               TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
             end
            end)         

        -- Syre

         RegisterServerEvent('LavSyre')
         AddEventHandler('LavSyre', function()
             local user_id = vRP.getUserId({source})
             
             vRP.giveInventoryItem({user_id,"syre",1,true})
             
            end)

            
         RegisterServerEvent('LavSyre2')
         AddEventHandler('LavSyre2', function()
             local user_id = vRP.getUserId({source})
             
             vRP.giveInventoryItem({user_id,"syre",10,true})
             
            end)
         
            RegisterServerEvent('FremstillLSD')
            AddEventHandler('FremstillLSD', function()
                local user_id = vRP.getUserId({source})
                local money = 1300
                if vRP.tryGetInventoryItem({user_id, "syre", 2, true}) then
                 vRP.giveInventoryItem({user_id,"lsd",1,true})
                 
                end
               end)

               RegisterServerEvent('FremstillLSD2')
               AddEventHandler('FremstillLSD2', function()
                   local user_id = vRP.getUserId({source})
                   local money = 1300
                   if vRP.tryGetInventoryItem({user_id, "syre", 20, true}) then
                    vRP.giveInventoryItem({user_id,"lsd",10,true})
                    
                   end
                  end)        
         
               RegisterServerEvent('LSDsaalg')
               AddEventHandler('LSDsaalg', function()
                   local user_id = vRP.getUserId({source})
                   local money = 300
                   if vRP.tryGetInventoryItem({user_id, "lsd", 1, true}) then
                    vRP.giveInventoryItem({user_id,"dirty_money",300,true})
                     TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                   end
                  end)

                  RegisterServerEvent('LSDsaalg2')
                  AddEventHandler('LSDsaalg2', function()
                      local user_id = vRP.getUserId({source})
                      local money = 3000
                      if vRP.tryGetInventoryItem({user_id, "lsd", 10, true}) then
                        vRP.giveInventoryItem({user_id,"dirty_money",3000,true})
                        TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                      end
                     end)

        -- NaOH
         
            RegisterServerEvent('FremstillNaOH')
            AddEventHandler('FremstillNaOH', function()
                local user_id = vRP.getUserId({source})
                local money = 1300
                if vRP.tryGetInventoryItem({user_id, "natrium", 1, true}) then
                 vRP.giveInventoryItem({user_id,"naoh",1,true})
                 
                end
               end)

               RegisterServerEvent('FremstillNaOH21')
               AddEventHandler('FremstillNaOH', function()
                   local user_id = vRP.getUserId({source})
                   local money = 1300
                   if vRP.tryGetInventoryItem({user_id, "natrium", 10, true}) then
                    vRP.giveInventoryItem({user_id,"naoh",10,true})
                    
                   end
                  end)               

            RegisterServerEvent('FremstillNaOH2')
            AddEventHandler('FremstillNaOH2', function()
                local user_id = vRP.getUserId({source})
                local money = 1300
                if vRP.tryGetInventoryItem({user_id, "water", 1, true}) then
                 
                end
               end)

               RegisterServerEvent('FremstillNaOH22')
               AddEventHandler('FremstillNaOH22', function()
                   local user_id = vRP.getUserId({source})
                   local money = 1300
                   if vRP.tryGetInventoryItem({user_id, "water", 10, true}) then
                    
                   end
                  end)  

        -- Amfetamin
        
           RegisterServerEvent('FremstillAMF')
           AddEventHandler('FremstillAMF', function()
               local user_id = vRP.getUserId({source})
               local money = 1300
               if vRP.tryGetInventoryItem({user_id, "naoh", 1, true}) then
                vRP.giveInventoryItem({user_id,"amfetamin",1,true})
                
               end
              end)

              RegisterServerEvent('FremstillAMF21')
              AddEventHandler('FremstillAMF21', function()
                  local user_id = vRP.getUserId({source})
                  local money = 1300
                  if vRP.tryGetInventoryItem({user_id, "naoh", 10, true}) then
                   vRP.giveInventoryItem({user_id,"amfetamin",10,true})
                   
                  end
                 end)

              RegisterServerEvent('FremstillAMF1')
              AddEventHandler('FremstillAMF1', function()
                  local user_id = vRP.getUserId({source})
                  local money = 1300
                  if vRP.tryGetInventoryItem({user_id, "p2np", 1, true}) then
                   
                  end
                 end)

                 RegisterServerEvent('FremstillAMF22')
                 AddEventHandler('FremstillAMF22', function()
                     local user_id = vRP.getUserId({source})
                     local money = 1300
                     if vRP.tryGetInventoryItem({user_id, "p2np", 10, true}) then
                      
                     end
                    end)
                
                 RegisterServerEvent('FremstillAMF2')
                 AddEventHandler('FremstillAMF2', function()
                     local user_id = vRP.getUserId({source})
                     local money = 1300
                     if vRP.tryGetInventoryItem({user_id, "isopropanol", 1, true}) then
                      
                     end
                    end)

                    RegisterServerEvent('FremstillAMF23')
                    AddEventHandler('FremstillAMF23', function()
                        local user_id = vRP.getUserId({source})
                        local money = 1300
                        if vRP.tryGetInventoryItem({user_id, "isopropanol", 10, true}) then
                         
                        end
                       end)
                
                    RegisterServerEvent('FremstillAMF3')
                    AddEventHandler('FremstillAMF3', function()
                        local user_id = vRP.getUserId({source})
                        local money = 1300
                        if vRP.tryGetInventoryItem({user_id, "sølvpapir", 1, true}) then
                         
                        end
                       end)

                       RegisterServerEvent('FremstillAMF24')
                       AddEventHandler('FremstillAMF24', function()
                           local user_id = vRP.getUserId({source})
                           local money = 1300
                           if vRP.tryGetInventoryItem({user_id, "sølvpapir", 10, true}) then
                            
                           end
                          end)
                      
                       RegisterServerEvent('FremstillAMF4')
                       AddEventHandler('FremstillAMF4', function()
                           local user_id = vRP.getUserId({source})
                           local money = 1300
                           if vRP.tryGetInventoryItem({user_id, "eddikesyre", 1, true}) then
                            
                           end

                          end)

                          RegisterServerEvent('FremstillAMF25')
                          AddEventHandler('FremstillAMF25', function()
                              local user_id = vRP.getUserId({source})
                              local money = 1300
                              if vRP.tryGetInventoryItem({user_id, "eddikesyre", 10, true}) then
                               
                              end
                             end)

                          RegisterServerEvent('FremstillAMF5')
                          AddEventHandler('FremstillAMF5', function()
                              local user_id = vRP.getUserId({source})
                              local money = 1300
                              if vRP.tryGetInventoryItem({user_id, "h2so4", 1, true}) then
                               
                              end
                             end)

                             RegisterServerEvent('FremstillAMF26')
                             AddEventHandler('FremstillAMF26', function()
                                 local user_id = vRP.getUserId({source})
                                 local money = 1300
                                 if vRP.tryGetInventoryItem({user_id, "h2so4", 10, true}) then
                                  
                                 end
                                end)
        
              RegisterServerEvent('AMFsaalg')
              AddEventHandler('AMFsaalg', function()
                  local user_id = vRP.getUserId({source})
                  local money = 950
                  if vRP.tryGetInventoryItem({user_id, "amfetamin", 1, true}) then
                    vRP.giveInventoryItem({user_id,"dirty_money",1000,true})
                    TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                  end
                 end)

                 RegisterServerEvent('AMFsaalg2')
                 AddEventHandler('AMFsaalg2', function()
                     local user_id = vRP.getUserId({source})
                     local money = 9500
                     if vRP.tryGetInventoryItem({user_id, "amfetamin", 10, true}) then
                      vRP.giveInventoryItem({user_id,"dirty_money",10000,true})
                       TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                     end
                    end)
      -- Blomster

      RegisterServerEvent('HøstBlomster')
      AddEventHandler('HøstBlomster', function()
          local user_id = vRP.getUserId({source})
          vRP.giveInventoryItem({user_id,"sblomst",1,true})
          
         end)

         RegisterServerEvent('HøstBlomster2')
         AddEventHandler('HøstBlomster2', function()
             local user_id = vRP.getUserId({source})
             vRP.giveInventoryItem({user_id,"sblomst",10,true})
             
            end)

      RegisterServerEvent('KogBlomster')
      AddEventHandler('KogBlomster', function()
          local user_id = vRP.getUserId({source})
          if vRP.tryGetInventoryItem({user_id, "sblomst", 1, true}) then
          vRP.giveInventoryItem({user_id,"kblomst",1,true})
          
         end
        end) 

        RegisterServerEvent('KogBlomster')
        AddEventHandler('KogBlomster', function()
            local user_id = vRP.getUserId({source})
            if vRP.tryGetInventoryItem({user_id, "sblomst", 10, true}) then
            vRP.giveInventoryItem({user_id,"kblomst",10,true})
            
           end
          end) 
      
         RegisterServerEvent('SnitBlomster')
         AddEventHandler('SnitBlomster', function()
             local user_id = vRP.getUserId({source})
             local money = 1300
             if vRP.tryGetInventoryItem({user_id, "kniv", 1, true}) then
              vRP.giveInventoryItem({user_id,"ssblomst",1,true})
              
             end
            end)

            RegisterServerEvent('SnitBlomster21')
            AddEventHandler('SnitBlomster21', function()
                local user_id = vRP.getUserId({source})
                local money = 1300
                if vRP.tryGetInventoryItem({user_id, "kniv", 1, true}) then
                 vRP.giveInventoryItem({user_id,"ssblomst",10,true})
                 
                end
               end)

            RegisterServerEvent('SnitBlomster2')
            AddEventHandler('SnitBlomster2', function()
                local user_id = vRP.getUserId({source})
                local money = 1300
                if vRP.tryGetInventoryItem({user_id, "kblomst", 1, true}) then
                 vRP.giveInventoryItem({user_id,"kniv",1,true})
                 
                end
               end)
      
               RegisterServerEvent('SnitBlomster22')
               AddEventHandler('SnitBlomster22', function()
                   local user_id = vRP.getUserId({source})
                   local money = 1300
                   if vRP.tryGetInventoryItem({user_id, "kblomst", 10, true}) then
                    vRP.giveInventoryItem({user_id,"kniv",1,true})
                    
                   end
                  end)

            RegisterServerEvent('AfleverBlomster')
            AddEventHandler('AfleverBlomster', function()
                local user_id = vRP.getUserId({source})
                local money = 1000
                if vRP.tryGetInventoryItem({user_id, "ssblomst", 1, true}) then
                  vRP.giveInventoryItem({user_id,"dirty_money",1000,true})
                  TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                end
               end)

               RegisterServerEvent('AfleverBlomster2')
               AddEventHandler('AfleverBlomster2', function()
                   local user_id = vRP.getUserId({source})
                   local money = 1000
                   if vRP.tryGetInventoryItem({user_id, "ssblomst", 10, true}) then
                    vRP.giveInventoryItem({user_id,"dirty_money",10000,true})
                     TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                   end
                  end)
   

            -- Hvidvask

      
            RegisterServerEvent('Hvidvask')
            AddEventHandler('Hvidvask', function()
                local user_id = vRP.getUserId({source})
                local money = 950
                if vRP.tryGetInventoryItem({user_id, "dirty_money", 1000, true}) then
                  vRP.giveMoney({user_id,money})
                  TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                end
               end)

               RegisterServerEvent('Hvidvask2')
               AddEventHandler('Hvidvask2', function()
                   local user_id = vRP.getUserId({source})
                   local money = 4750
                   if vRP.tryGetInventoryItem({user_id, "dirty_money", 5000, true}) then
                     vRP.giveMoney({user_id,money})
                     TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                   end
                  end)

               RegisterServerEvent('Hvidvask3')
               AddEventHandler('Hvidvask3', function()
                   local user_id = vRP.getUserId({source})
                   local money = 9500
                   if vRP.tryGetInventoryItem({user_id, "dirty_money", 10000, true}) then
                     vRP.giveMoney({user_id,money})
                     TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                   end
                  end)

            -- Aluminium

            RegisterServerEvent('Aluminium')
            AddEventHandler('Aluminium', function()
                local user_id = vRP.getUserId({source})
                vRP.giveInventoryItem({user_id,"aluminium",1,true})
                
              end)

              RegisterServerEvent('Aluminium2')
              AddEventHandler('Aluminium2', function()
                  local user_id = vRP.getUserId({source})
                  vRP.giveInventoryItem({user_id,"aluminium",10,true})
                  
                end)

              RegisterServerEvent('AluminiumBar')
              AddEventHandler('AluminiumBar', function()
                  local user_id = vRP.getUserId({source})
                  local money = 1300
                  if vRP.tryGetInventoryItem({user_id, "aluminium", 2, true}) then
                   vRP.giveInventoryItem({user_id,"aluminiumbar",1,true})
                   
                  end
                 end)

                 RegisterServerEvent('AluminiumBar2')
                 AddEventHandler('AluminiumBar2', function()
                     local user_id = vRP.getUserId({source})
                     local money = 1300
                     if vRP.tryGetInventoryItem({user_id, "aluminium", 20, true}) then
                      vRP.giveInventoryItem({user_id,"aluminiumbar",10,true})
                      
                     end
                    end)

                 RegisterServerEvent('SælgAluminium')
                 AddEventHandler('SælgAluminium', function()
                     local user_id = vRP.getUserId({source})
                     local money = 350
                     if vRP.tryGetInventoryItem({user_id, "aluminiumbar", 1, true}) then
                       vRP.giveMoney({user_id,money})
                       TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                     end
                    end)

                    RegisterServerEvent('SælgAluminium2')
                    AddEventHandler('SælgAluminium2', function()
                        local user_id = vRP.getUserId({source})
                        local money = 3500
                        if vRP.tryGetInventoryItem({user_id, "aluminiumbar", 10, true}) then
                          vRP.giveMoney({user_id,money})
                          TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        end
                       end)

            -- Guld

            RegisterServerEvent('Guld')
            AddEventHandler('Guld', function()
                local user_id = vRP.getUserId({source})
                vRP.giveInventoryItem({user_id,"guldmalm",1,true})
                
              end)

              RegisterServerEvent('Guld2')
              AddEventHandler('Guld2', function()
                  local user_id = vRP.getUserId({source})
                  vRP.giveInventoryItem({user_id,"guldmalm",10,true})
                  
                end)

              RegisterServerEvent('GuldBar')
              AddEventHandler('GuldBar', function()
                  local user_id = vRP.getUserId({source})
                  local money = 1300
                  if vRP.tryGetInventoryItem({user_id, "guldmalm", 2, true}) then
                   vRP.giveInventoryItem({user_id,"guldbar",1,true})
                   
                  end
                 end)

                 RegisterServerEvent('GuldBar2')
                 AddEventHandler('GuldBar2', function()
                     local user_id = vRP.getUserId({source})
                     local money = 1300
                     if vRP.tryGetInventoryItem({user_id, "guldmalm", 20, true}) then
                      vRP.giveInventoryItem({user_id,"guldbar",10,true})
                      
                     end
                    end)
   

                 RegisterServerEvent('SælgGuld')
                 AddEventHandler('SælgGuld', function()
                     local user_id = vRP.getUserId({source})
                     local money = 550
                     if vRP.tryGetInventoryItem({user_id, "guldbar", 1, true}) then
                       vRP.giveMoney({user_id,money})
                       TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                     end
                    end)

                    RegisterServerEvent('SælgGuld2')
                    AddEventHandler('SælgGuld2', function()
                        local user_id = vRP.getUserId({source})
                        local money = 5500
                        if vRP.tryGetInventoryItem({user_id, "guldbar", 10, true}) then
                          vRP.giveMoney({user_id,money})
                          TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        end
                       end)
                
                -- Stål


                RegisterServerEvent('Stål')
                AddEventHandler('Stål', function()
                    local user_id = vRP.getUserId({source})
                    vRP.giveInventoryItem({user_id,"steel",1,true})
                    
                  end)

                  RegisterServerEvent('Stål2')
                  AddEventHandler('Stål2', function()
                      local user_id = vRP.getUserId({source})
                      vRP.giveInventoryItem({user_id,"steel",10,true})
                      
                    end)
    
                  RegisterServerEvent('StålBar')
                  AddEventHandler('StålBar', function()
                      local user_id = vRP.getUserId({source})
                      local money = 1300
                      if vRP.tryGetInventoryItem({user_id, "steel", 2, true}) then
                       vRP.giveInventoryItem({user_id,"stainless",1,true})
                       
                      end
                     end)

                     RegisterServerEvent('StålBar21')
                     AddEventHandler('StålBar21', function()
                         local user_id = vRP.getUserId({source})
                         local money = 1300
                         if vRP.tryGetInventoryItem({user_id, "steel", 20, true}) then
                          vRP.giveInventoryItem({user_id,"stainless",10,true})
                          
                         end
                        end)

                     RegisterServerEvent('StålBar1')
                     AddEventHandler('StålBar1', function()
                         local user_id = vRP.getUserId({source})
                         local money = 1300
                         if vRP.tryGetInventoryItem({user_id, "chromium", 1, true}) then
                          
                         end
                        end)

                        RegisterServerEvent('StålBar22')
                        AddEventHandler('StålBar22', function()
                            local user_id = vRP.getUserId({source})
                            local money = 1300
                            if vRP.tryGetInventoryItem({user_id, "chromium", 10, true}) then
                             
                            end
                           end)

                        RegisterServerEvent('StålBar2')
                        AddEventHandler('StålBar2', function()
                            local user_id = vRP.getUserId({source})
                            local money = 1300
                            if vRP.tryGetInventoryItem({user_id, "nickel", 1, true}) then
                             
                            end
                           end)

                           RegisterServerEvent('StålBar23')
                           AddEventHandler('StålBar23', function()
                               local user_id = vRP.getUserId({source})
                               local money = 1300
                               if vRP.tryGetInventoryItem({user_id, "nickel", 10, true}) then
                                
                               end
                              end)

    
                     RegisterServerEvent('StålSælg')
                     AddEventHandler('StålSælg', function()
                         local user_id = vRP.getUserId({source})
                         local money = 600
                         if vRP.tryGetInventoryItem({user_id, "stainless", 1, true}) then
                           vRP.giveMoney({user_id,money})
                           TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                         end
                        end)

                        RegisterServerEvent('StålSælg2')
                        AddEventHandler('StålSælg2', function()
                            local user_id = vRP.getUserId({source})
                            local money = 6000
                            if vRP.tryGetInventoryItem({user_id, "stainless", 10, true}) then
                              vRP.giveMoney({user_id,money})
                              TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                            end
                           end)

                  -- Diamant

                  RegisterServerEvent('Kul')
                  AddEventHandler('Kul', function()
                      local user_id = vRP.getUserId({source})
                      vRP.giveInventoryItem({user_id,"kul",1,true})
                      
                    end)

                    RegisterServerEvent('Kul2')
                    AddEventHandler('Kul2', function()
                        local user_id = vRP.getUserId({source})
                        vRP.giveInventoryItem({user_id,"kul",10,true})
                        
                      end)
      
                    RegisterServerEvent('Diamant')
                    AddEventHandler('Diamant', function()
                        local user_id = vRP.getUserId({source})
                        local money = 1300
                        if vRP.tryGetInventoryItem({user_id, "kul", 3, true}) then
                         vRP.giveInventoryItem({user_id,"diamant",1,true})
                         
                        end
                       end)

                             
                    RegisterServerEvent('Diamant2')
                    AddEventHandler('Diamant2', function()
                        local user_id = vRP.getUserId({source})
                        local money = 1300
                        if vRP.tryGetInventoryItem({user_id, "kul", 30, true}) then
                         vRP.giveInventoryItem({user_id,"diamant",10,true})
                         
                        end
                       end)
      
                       RegisterServerEvent('SælgDiamant')
                       AddEventHandler('SælgDiamant', function()
                           local user_id = vRP.getUserId({source})
                           local money = 1000
                           if vRP.tryGetInventoryItem({user_id, "diamant", 1, true}) then
                             vRP.giveMoney({user_id,money})
                             TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                           end
                          end)

                          RegisterServerEvent('SælgDiamant2')
                          AddEventHandler('SælgDiamant2', function()
                              local user_id = vRP.getUserId({source})
                              local money = 10000
                              if vRP.tryGetInventoryItem({user_id, "diamant", 10, true}) then
                                vRP.giveMoney({user_id,money})
                                TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..money.." DKK</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                              end
                             end)

