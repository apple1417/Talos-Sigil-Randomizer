SIGSTRM12GIS             ނ��                  Signkey.EditorSignatureB����F������)�g;P�7�L%a��y+m�֨�-	��L�P4�k��2$Z�BU�:[j4���U�%XUn3�g��d��-���Տ	�D><�6��n�0����p����B�^m�C�eG��� ��xl���Q��}��t�x��s���L;t;.�3�F��y1�Ȋ4�a>����Z�1��q$�H=N�`��%�QA�����F���M���	a�\��C�b� �o�2lI}���t��3�aD�﻿-- I've changed stuff, but, assuming you already had paint, this is functionally identical
Wait(Delay(0.00001))

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
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local randomSeed = talosProgress:GetCodeValue("PaintItemSeed")
if randomSeed == -1 then
  randomSeed = mthRoundF(mthRndF()*8909478)
  talosProgress:SetCode("PaintItemSeed", randomSeed)
end
local worldName = string.match(worldGlobals.worldInfo:GetWorldFileName(), "([^/]+)%.wld$")
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
paintItems[randomPaintItemIndex]:Show()c_��c10Ɩ����
��u+oQ�I�;q�����_*F��!]O��2��/b`��a����6 �؍���������|�#�`��8�J��	�QAw����5	�ڬ��+�=M*�ϟS�c�Z�	�8�V�F�qyh�d����O�6���pc'Vw�_A�ۃ>/1��?U&.�4�ΡX�Q��s��3���������҇%����h�N�en����'-���;9��/���P9j��ai'�G����ܨ