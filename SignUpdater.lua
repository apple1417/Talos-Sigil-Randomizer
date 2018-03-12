SIGSTRM12GIS             �.kH                  Signkey.EditorSignatureT��ɣ#gDE#��Λ�4�2z��IXu�k����$dD,*L��ۯ�TQ�s[U7�s��5��g����-͟�Z����G}�����G��a�' �A,`��M\��0���kפ�JE�,�wC��X7�Se?=�R<��r�-3;%5��1!�\/�����OJ�d�f�u�a.�)C]��+6T<@"d�jؽgyUx tl�6�,��fe��\��{g�uIgk"��ܰ�H�^�}�|�n�F0��đBʪl�|�k﻿--[[
  Makes the world overview sign update properly
  Because normal signs can't be dynamically changed we do this with
   a total of 1530 text effects, in various locations and colours,
   which we can set to unicode strings that look like the tetrominoes
  These strings don't render properly in the editor but they work in game
]]--

Wait(CustomEvent("Randomizer_Finished"))
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local showAll = talosProgress:IsVarSet("Randomizer_ShowAll")

local icons = {
  ["I"]="▄▄",
  ["J"]="▐▄",
  ["L"]="▄▌",
  ["O"]="█",
  ["S"]="▗▛",
  ["T"]="▗▙",
  ["Z"]="▜▖",
  ["*"]="★"
}

local text = {
  ["*"] = textStar,
  ["D"] = textDoor,
  ["E"] = textSecret,
  ["M"] = textMechanical,
  ["N"] = textNexus,
  ["Default"] = textDefault
}

local textPtr = {
  ["*"] = {},
  ["D"] = {},
  ["E"] = {},
  ["M"] = {},
  ["N"] = {},
  ["Default"] = {}
}
--[[
  Setup all text pointers, and make sure all texts have the
   correct default message
]]--
for k,v in pairs(text) do
  for i=1,#text[k] do
    textPtr[k][i] = text[k][i]:GetTextConfig()
    if k == "Default" then
      text[k][i]:SetText(textPtr[k][i], "?", true)
    else
      text[k][i]:ClearText(textPtr[k][i])
    end
  end
end

-- Sort the sigil list to prevent memorising spawn order
local sigils = {}
local stars = {}
for i=1, #worldGlobals.worldMarkers do
  local sigilNum = talosProgress:GetCodeValue(worldGlobals.worldMarkers[i]:GetName())
  if sigilNum <= 30 then
    table.insert(stars, sigilNum)
  else
    table.insert(sigils, sigilNum)
  end
end
table.sort(sigils)
--[[
  The elements of each sign are indexed weirdly so I need to
   resort the list to work with it
]]--
local allSigils = {}
local half = mthCeilF(#sigils/2)
for i=1, #sigils do
  if i > half then
    allSigils[2*(i-half)] = sigils[i]
  else
    allSigils[2*i-1] = sigils[i]
  end
end
for i=1, #stars do table.insert(allSigils, stars[i]) end

--[[
  Function to fill each sign
  If this is called multiple times it will replace sigils with
   themselves, effectivly doing nothing
]]--
local function updateText()
  for i=1, #allSigils do
    local sigil = worldGlobals.allTetros[allSigils[i]]
    local colour = string.sub(sigil:GetName(), 1, 1)
    local type = string.sub(sigil:GetName(), 2, 2)
    if sigil:IsPicked() then
      text[colour][i]:SetText(textPtr[colour][i], icons[type], true)
      text["Default"][i]:SetText(textPtr["Default"][i], "✘", true)
    -- If a sigil is not picked and showAll is false it'll remain '?'
    elseif showAll then
      text[colour][i]:SetText(textPtr[colour][i], icons[type], true)
      text["Default"][i]:ClearText(textPtr["Default"][i])
    end
  end
end

updateText()

-- Need to make sure the sign updates incase you don't reset
RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(CustomEvent("TetrominoAwarded")),
  function()
    updateText()
  end
)?w�?�/}M+�8��.$��AaVG��H�[�8�V��'��b�u��wLT�u;�K-�<-H������k5	��� Jլ<|��oh��E��SXb=q�%/��Ś�"%��)z�$�npi�
g��N��/�À��4��m'�)IfP̻�3�r~i�I�:�gD�ku�[iӉ�+����}����Iv%�w� ���V��������
?�+�ZV2̣�
G�;���+X�R/q��ST�ze�|+��<	�~