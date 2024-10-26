local executed = false
local whitelistecUsers = {
    "UnxableDev",
    "UnxableDevAutofarm2",
    "UnxableDevAutofarm3",
    "Tigerpanderjuju1234"
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
        Title = "SUCCESS",
        Text = "You are Authorized to run the Privat Script",
        Duration = 5
    })

    loadstring(game:HttpGet("https://raw.githubusercontent.com/UnxableDev/PrivateScript/refs/heads/main/PrivatesScript.lua"))()
else
       function getRoot(char)
      local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
      return rootPart
end
    wait(5)
    player:Kick("RETARD")

end
