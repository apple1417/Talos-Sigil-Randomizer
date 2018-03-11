SIGSTRM12GIS             ��[                  Signkey.EditorSignature:R��*ZN&�6{����ИK �=ǆq�D���/*'+6ϒ��1?�<�:7`�f=�Q��,r\����I	��WS�zHA�r���UĔ�<��y0���#�g�h���g��>c���d����F{^�>�>(%�^����n,�I�y����2�H e'L�/:@j�S�뾡����/:��~xRxڻ���j�x�S}�x*+Caz����A[B���[1]��` &T��F�a.�/S홶!>�!���؜�̨'�4�UYW�﻿Wait(CustomEvent("Randomizer_Finished"))
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

local function updateText()
  for i=1, #allSigils do
  local sigil = worldGlobals.allTetros[allSigils[i]]
  local colour = string.sub(sigil:GetName(), 1, 1)
  local type = string.sub(sigil:GetName(), 2, 2)
  if sigil:IsPicked() then
    text[colour][i]:SetText(textPtr[colour][i], icons[type], true)
    text["Default"][i]:SetText(textPtr["Default"][i], "✘", true)
  elseif showAll then
    text[colour][i]:SetText(textPtr[colour][i], icons[type], true)
    text["Default"][i]:ClearText(textPtr["Default"][i])
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
)I��3��#x�%���`�'��2�3A�҆��5�0A>��{�OP�@+ȩ/�ҏ�PW>�yS�x�����o�,'f�̋4^�XVr����̹�Z?��\_���>��9�[�&�ܶ�s.,)����=��8�1�*��*�BB����gyL(�S|�U���9Rh����yw���|������w.z�,ͪ�]�YFM�qҎ_%��x�C΄º�
��O��GXvF�>���jO$R̘%N��B�ōq,�