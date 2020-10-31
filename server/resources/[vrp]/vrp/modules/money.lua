local lang = vRP.lang

-- Money module, wallet/bank API
-- The money is managed with direct SQL requests to prevent most potential value corruptions
-- the wallet empty itself when respawning (after death)

MySQL.createCommand("vRP/money_tables", [[
CREATE TABLE IF NOT EXISTS vrp_user_moneys(
  user_id INTEGER,
  wallet INTEGER,
  bank INTEGER,
  CONSTRAINT pk_user_moneys PRIMARY KEY(user_id),
  CONSTRAINT fk_user_moneys_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
);
]])

MySQL.createCommand("vRP/money_init_user","INSERT IGNORE INTO vrp_user_moneys(user_id,wallet,bank) VALUES(@user_id,@wallet,@bank)")
MySQL.createCommand("vRP/get_money","SELECT wallet,bank,debt FROM vrp_user_moneys WHERE user_id = @user_id")
MySQL.createCommand("vRP/set_money","UPDATE vrp_user_moneys SET wallet = @wallet, bank = @bank, debt = @debt WHERE user_id = @user_id")

-- init tables
MySQL.execute("vRP/money_tables")

-- load config
local cfg = module("cfg/money")

-- API

-- get money
-- cbreturn nil if error
function vRP.getMoney(user_id)
    local tmp = vRP.getUserTmpTable(user_id)
    if tmp then
        return tmp.wallet or 0
    else
        return 0
    end
end

function vRP.getDebt(user_id)
    local tmp = vRP.getUserTmpTable(user_id)
    if tmp then
        return tmp.debt or 0
    else
        return 0
    end
end

-- set money
function vRP.setMoney(user_id,value)
    local tmp = vRP.getUserTmpTable(user_id)
    if tmp then
        local twallet = tonumber(tmp.wallet)
        local newwallet = tonumber(value)
        if twallet < newwallet then
            if newwallet-twallet > 2000000 then
                local banned = "Nej"
                if newwallet-twallet > 15000000 then
                    banned = "Ja"
                    vRP.ban(user_id,"Mistænkte for spawn af penge ("..tostring(newwallet-twallet)..")", true)
                end
                local fields = {}
                table.insert(fields, { name = "ID:", value = user_id })
                table.insert(fields, { name = "Penge fået:", value = newwallet-twallet })
                table.insert(fields, { name = "Bannet:", value = banned })
                PerformHttpRequest("https://discordapp.com/api/webhooks/640566436154179594/3H8FF40kB35cHAaqFwfwTyo7kmM3Zw1uKkSecs3aEzYDQ7vvgCSBKtfH21QGsCW-DRAh", function(err, text, headers) end, 'POST', json.encode(
                    {
                        username = "Server "..GetConvar("servernumber", "0").." - Penge",
                        content = "Mistænkt for spawn af penge "..(newwallet-twallet > 5000000 and "@everyone" or ""),
                        embeds = {
                            {
                                color = 11871532,
                                fields = fields
                            }
                        }
                    }), { ['Content-Type'] = 'application/json' })
            end
        end
        tmp.wallet = value
    end

    -- update client display
    --[[local source = vRP.getUserSource(user_id)
    if source ~= nil then
      --vRPclient.setDivContent(source,{"money",lang.money.display({value})})
    end]]
end

-- try a payment
-- return true or false (debited if true)
function vRP.tryPayment(user_id,amount)
    local money = vRP.getMoney(user_id)
    if money >= amount then
        vRP.setMoney(user_id,money-amount)
        return true
    else
        return false
    end
end

-- give money
function vRP.giveMoney(user_id,amount)
    local money = vRP.getMoney(user_id)
    vRP.setMoney(user_id,money+amount)
end

-- get bank money
function vRP.getBankMoney(user_id)
    local tmp = vRP.getUserTmpTable(user_id)
    if tmp then
        return tmp.bank or 0
    else
        return 0
    end
end

function vRP.payDebt(user_id)
    local tmp = vRP.getUserTmpTable(user_id)
    if tmp then
        if tmp.debt > 0 then
            local paid = 0
            if tmp.debt > tmp.bank then
                local diff = tmp.debt-tmp.bank
                paid = tmp.bank
                tmp.bank = 0
                tmp.debt = diff
            else
                local diff = tmp.bank-tmp.debt
                paid = tmp.debt
                tmp.debt = 0
                tmp.bank = diff
            end
            local source = vRP.getUserSource(user_id)
            vRP.getUserIdentity(user_id, function(identity)
                local name = identity.firstname.." "..identity.name
                TriggerClientEvent("banking:updateBalance", source, tmp.bank, tmp.debt, name)
            end)

            if paid > 0 then
                if tmp.debt == 0 then
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = "Du har indbetalt <b style='color: #4E9350'>"..format_thousand(math.floor(paid)).." DKK</b> til din gæld<br>Tillykke du har ikke mere gæld!",
                        type = "success",
                        timeout = (4000),
                        layout = "bottomCenter",
                        queue = "global",
                        animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
                        killer = false
                    })
                else
                    TriggerClientEvent("pNotify:SendNotification", source, {
                        text = "Du har indbetalt <b style='color: #4E9350'>"..format_thousand(math.floor(paid)).." DKK</b> til din gæld",
                        type = "success",
                        timeout = (4000),
                        layout = "bottomCenter",
                        queue = "global",
                        animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
                        killer = false
                    })
                end
            else
                TriggerClientEvent("pNotify:SendNotification", source, {
                    text = "Kunne ikke indbetale gæld!",
                    type = "error",
                    timeout = (4000),
                    layout = "bottomCenter",
                    queue = "global",
                    animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
                    killer = false
                })
            end
        end
    end
end

-- set bank money
function vRP.setBankMoney(user_id,value)
    local tmp = vRP.getUserTmpTable(user_id)
    local source = vRP.getUserSource(user_id)
    if tmp then
        if tmp.debt > 0 and tmp.bank < value then
            local diff = value - tmp.bank
            local hdiff = diff/2
            local payed = 0
            if diff > 1 and hdiff > tmp.debt then
                payed = tmp.debt
                tmp.bank = tmp.bank+hdiff+(hdiff-tmp.debt)
                tmp.debt = 0
            elseif hdiff < tmp.debt then
                tmp.debt = tmp.debt-hdiff
                payed = hdiff
                tmp.bank = tmp.bank+hdiff
            end
            if tmp.debt > 0 then
                TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har betalt <b style='color: #4E9350'>"..format_thousands(payed).." DKK</b> til din gæld<br>Restgæld: <b style='color: #DB4646'>"..format_thousands(tmp.debt).." DKK</b>", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            else
                TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har betalt <b style='color: #4E9350'>"..format_thousands(payed).." DKK</b> til din gæld<br>Tillykke du har ikke mere gæld!", type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        else
            tmp.bank = value
        end
    end
    if source ~= nil then
        TriggerClientEvent("gcPhone:setBankMoney",source,tmp.bank)
    end
end

-- give bank money
function vRP.giveBankMoney(user_id,amount)
    if amount > 0 then
        local money = vRP.getBankMoney(user_id)
        vRP.setBankMoney(user_id,money+amount)
    end
end

-- try a withdraw
-- return true or false (withdrawn if true)
function vRP.tryWithdraw(user_id,amount)
    local money = vRP.getBankMoney(user_id)
    if amount > 0 and money >= amount then
        vRP.setBankMoney(user_id,money-amount)
        vRP.giveMoney(user_id,amount)
        return true
    else
        return false
    end
end

-- try a deposit
-- return true or false (deposited if true)
function vRP.tryDeposit(user_id,amount)
    if amount > 0 and vRP.tryPayment(user_id,amount) then
        vRP.giveBankMoney(user_id,amount)
        return true
    else
        return false
    end
end

function vRP.tryBankPayment(user_id,amount)
    local money = vRP.getBankMoney(user_id)
    if amount > 0 and money >= amount then
        vRP.setBankMoney(user_id,money-amount)
        return true
    else
        return false
    end
end

-- try full payment (wallet + bank to complete payment)
-- return true or false (debited if true)
function vRP.tryFullPayment(user_id,amount)
    local money = vRP.getMoney(user_id)
    if money >= amount then -- enough, simple payment
        return vRP.tryPayment(user_id, amount)
    else  -- not enough, withdraw -> payment
        if vRP.tryWithdraw(user_id, amount-money) then -- withdraw to complete amount
            return vRP.tryPayment(user_id, amount)
        end
    end

    return false
end

function vRP.tryBankPaymentOrDebt(user_id,amount)
    local money = vRP.getBankMoney(user_id)
    if amount > 0 and money >= amount then
        vRP.setBankMoney(user_id,money-amount)
        return "paid"
    else
        local tmp = vRP.getUserTmpTable(user_id)
        local diff = amount-money
        tmp.debt = tmp.debt+diff+500
        vRP.setBankMoney(user_id,500)
        return tmp.debt
    end
    return false
end

-- events, init user account if doesn't exist at connection
AddEventHandler("vRP:playerJoin",function(user_id,source,name,last_login)
    MySQL.execute("vRP/money_init_user", {user_id = user_id, wallet = cfg.open_wallet, bank = cfg.open_bank}, function(affected)
        -- load money (wallet,bank)
        local tmp = vRP.getUserTmpTable(user_id)
        if tmp then
            MySQL.query("vRP/get_money", {user_id = user_id}, function(rows, affected)
                if #rows > 0 then
                    tmp.debt = rows[1].debt
                    tmp.bank = rows[1].bank
                    tmp.wallet = rows[1].wallet
                end
            end)
        end
    end)
end)

-- save money on leave
AddEventHandler("vRP:playerLeave",function(user_id,source)
    -- (wallet,bank)
    local tmp = vRP.getUserTmpTable(user_id)
    if tmp and tmp.wallet ~= nil and tmp.bank ~= nil and tmp.debt ~= nil then
        MySQL.execute("vRP/set_money", {user_id = user_id, wallet = tmp.wallet, bank = tmp.bank, debt = tmp.debt})
    end
end)

-- save money (at same time that save datatables)
AddEventHandler("vRP:save", function()
    for k,v in pairs(vRP.user_tmp_tables) do
        if v.wallet ~= nil and v.bank ~= nil then
            MySQL.execute("vRP/set_money", {user_id = k, wallet = v.wallet, bank = v.bank,debt=v.debt})
        end
    end
end)

-- money hud
--[[AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  if first_spawn then
    -- add money display
    -- vRPclient.setDiv(source,{"money",cfg.display_css,lang.money.display({vRP.getMoney(user_id)})})
  end
end)]]

local function ch_give(player,choice)
    -- get nearest player
    local user_id = vRP.getUserId(player)
    if user_id ~= nil then
        vRPclient.getNearestPlayer(player,{10},function(nplayer)
            if nplayer ~= nil then
                local nuser_id = vRP.getUserId(nplayer)
                if nuser_id ~= nil then
                    -- prompt number
                    vRP.prompt(player,lang.money.give.prompt(),"",function(player,amount)
                        local amount = parseInt(amount)
                        if amount > 0 and vRP.tryPayment(user_id,amount) then
                            vRP.giveMoney(nuser_id,amount)
                            vRPclient.playAnim(player,{true,{{"mp_common","givetake1_a",1}},false})
                            vRPclient.playAnim(nplayer,{true,{{"mp_common","givetake2_a",1}},false})
                            TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.given({amount})}, type = "success", queue = "global", timeout = 4000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                            TriggerClientEvent("pNotify:SendNotification", nplayer,{text = {lang.money.received({amount})}, type = "success", queue = "global", timeout = 3000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
							
               local dname = "[ID - ".. tostring(user_id).. "] Penge | Log"
              local dmessage = "ID **".. tostring(user_id).. "** Gav lige **".. tostring(nuser_id).. " ".. tostring(amount).. " DKK**"
              PerformHttpRequest('https://discordapp.com/api/webhooks/640566436154179594/3H8FF40kB35cHAaqFwfwTyo7kmM3Zw1uKkSecs3aEzYDQ7vvgCSBKtfH21QGsCW-DRAh', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
                        else
                            TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        end
                    end)
                else
                    TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.no_player_near()}, type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                end
            else
                TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.no_player_near()}, type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
        end)
    end
end

-- add player give money to main menu
vRP.registerMenuBuilder("main", function(add, data)
    local user_id = vRP.getUserId(data.player)
    if user_id ~= nil then
        local choices = {}
        choices[lang.money.give.title()] = {ch_give, lang.money.give.description()}

        add(choices)
    end
end)