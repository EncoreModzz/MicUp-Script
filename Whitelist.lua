local executed = false
local whitelistecUsers = {
    "",
}

local player = game.Players.LocalPlayer

wait(1)

print("Checking Player: ".. player.Name)

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
        Title = "Access Granted",
        Text = "You are Authorized to run the Privat Script",
        Duration = 5
    })

    loadstring(game:HttpGet("https://raw.githubusercontent.com/UnxableDev/PrivateScript/refs/heads/main/PrivatesScript.lua"))()
else
    print("Player not whitelisted. Kicking: "..player.Name)
    player:Kick("FUCK YOU DONT TRY TO RUN THIS SCRIPT")

end