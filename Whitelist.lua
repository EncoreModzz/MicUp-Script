local executed = false
local whitelistecUsers = {
    "UnxableDev",
    "UnxableDevAutofarm2",
    "UnxableDevAutofarm3",
    "UnxableDevAutofarm4",
    "UnxableDevAutofarm5",
    "Tigerpanderjuju1234",
    "Tigerpanderjuju1",
    "Musaaus51"
}

local player = game.Players.LocalPlayer

wait(1)

local playerName = player.Name:lower()
local isWhitelisted = false
for _, username in ipairs(whitelistecUsers) do
    if username:lower() == playerName then
        isWhitelisted = true
        break
    end
end

if isWhitelisted then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ENCORE MODZZ",
        Text = "SCRIPT IS LOADING...",
        Duration = 5
    })

    loadstring(game:HttpGet("https://raw.githubusercontent.com/EncoreModzz/MicUp-Script/refs/heads/main/PrivatesScript.lua"))()
else
game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ENCORE MODZZ",
        Text = "YOU ARE NOT WHITELISTED!",
        Duration = 3
    })
    wait(3)
    player:Kick("RETARD")

end
