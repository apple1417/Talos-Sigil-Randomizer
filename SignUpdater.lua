SIGSTRM12GIS             K�~]                  Signkey.EditorSignatureo)#�����dg�tJRԀ����h�#-l�g\[����q4(^ V��&&{ͫ����~�Acfp�N^����R/2�9�"��&Q��)(ld{�7���˫͕�B�2b�Y�I]������ǵ^�,)�'z촇Rx:yj��r�
qOƖ�(an�"9y����r�@���m�+q��[���'>��F���T-=�+��cU5�gzw�U�QF��5ǘVry�m<��z�:������h>�UuX�&o}A������﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local showAll = talosProgress:IsVarSet("Randomizer_ShowAll")

local icons = {
  ["I"]="▄▄",
  ["J"]="▐▄",
  ["L"]="▄▌",
  ["O"]="█",
  ["S"]="▜▖",
  ["T"]="▗▙",
  ["Z"]="▗▛",
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

for k,v in pairs(text) do
  for i=1,#text[k] do
    textPtr[k][i] = text[k][i]:GetTextConfig()
    -- Assure all texts have the correct default message
    if k == "Default" then
      text[k][i]:SetText(textPtr[k][i], "?", true)
    else
      text[k][i]:ClearText(textPtr[k][i])
    end
  end
end

-- Bring stars to the end of the sigil list
local allSigils = {}
local starCount = 0
local totalSigils = #worldGlobals.worldMarkers
for i,v in pairs(worldGlobals.worldMarkers) do
  local sigilNum = talosProgress:GetCodeValue(v:GetName())
  -- currentSigil : CTetrominoItemInstance
  local currentSigil = worldGlobals.allTetros[sigilNum]
  local type = string.sub(currentSigil:GetName(), 2, 2)
  if type == "*" then
    allSigils[totalSigils - starCount] = currentSigil
    starCount = starCount + 1
  else
    allSigils[i - starCount] = currentSigil
  end
end

local function updateText()
  for index,sigil in pairs(allSigils) do
    -- sigil : CTetrominoItemInstance
    if sigil:IsPicked() then
      local colour = string.sub(sigil:GetName(), 1, 1)
      local type = string.sub(sigil:GetName(), 2, 2)
      text[colour][index]:SetText(textPtr[colour][index], icons[type], true)
      text["Default"][index]:SetText(textPtr["Default"][index], "✘", true)
    elseif showAll then
      local colour = string.sub(sigil:GetName(), 1, 1)
      local type = string.sub(sigil:GetName(), 2, 2)
      text[colour][index]:SetText(textPtr[colour][index], icons[type], true)
      text["Default"][index]:ClearText(textPtr["Default"][index])
    end    
  end
end

updateText()

RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(CustomEvent("TetrominoAwarded")),
  function()  
    updateText()
  end
)<�R�f�pe5���*-�!7|� �]�x���d���'���H���du�2�r����@d�de4!E��7�Յ�U��ެ�.XS��?N���d6)�"�X�k��=
����V[�x|�cN�m#��!�!����p��6s<��'���3�Pø�a�/D�."}j����n���=D�5K�x=�Y�$d���%�&�7�<�M�ypb�%�Z�
$)��|a�:'���l����!�Z���Q6-6Aqt1�]��