SIGSTRM12GIS             r>?�                  Signkey.EditorSignature{�Z�2�\ۜ�p��#�����ڍ�T�m�ֈ��*3��YP>_�;�[��CYp�On�e"��F�� 3�C�#�sɃaO�ӵ3h��?�ԧ���RTj��c�\_d�.�D$\�ÕVv����00��dba	Q�ad�}���i���q$��j�٨p⡠���x��򑃠5���p��5�Ա��pW�3�#�����;�ݑZ<������T@8�C����b�@}�~��-\ќA�%�}Ձ@j�T�"�Lk��﻿--[[
  So for some reason paint messages don't work here
  Because paint is absolutly needed we decided to just always unlock it
  This lets us optimize the script a bit, no need to use a RunHandled(),
   but this is still functionally equivalent, with the same paint sets
]]--
Wait(CustomEvent("Randomizer_Finished"))

local function RandomFomStringChars(str, multiplier)
  local len = #str
  local sum = 0
  local offset = 32
  for i = 1, len do
    sum = (string.byte(str, i) - offset)*multiplier
  end
  return sum
end

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(thisScript)
local randomSeed = talosProgress:GetCodeValue("PaintItemSeed")

local worldName = string.match(worldGlobals.Randomizer.currentWorld, "([^/]+)%.wld$")
if randomSeed < 0 then
  randomSeed = -randomSeed
end
local multiplier = randomSeed % 8
if multiplier == 0 then
  multiplier = 1
end
local randomIndex = randomSeed + RandomFomStringChars(worldName, multiplier)
if randomIndex < 0 then
  randomIndex = -randomIndex
end
local randomPaintItemIndex = 1 + randomIndex % #paintItems
paintItems[randomPaintItemIndex]:Show()���()�;�cR�|Pֻn�H���R~�8�|4���ZqI��@⣈fwN��_,l�t���3T7u�3y�Ϣ�iڹ#]
P6<����pMϫ�p�Ԅy��N$5b���"`n1z<��p��_��vfy�ڍ��*�H�����w��^���;��AS�E8���4h1[�$h�<�PR�3t�/��'�o�,v]0���[��Dk��AR4-��r����n�[���7������9���D�RݼJ�U