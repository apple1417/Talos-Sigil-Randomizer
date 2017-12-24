SIGSTRM12GIS             Vg�                  Signkey.EditorSignature%У(x�I��Y��-�O:&Lv�����GquL��6���m��MC�m>kM.��gN�u�����*�{���f5٘|;�Z��p='Wq���צd�cl��r�v�j��A	+"hB�#�[�J ��q�%#dϞXM���H=�*�h0U��N���%��7-��^҅�x4{T��@R�\ӊ��I7q��I�|��;���c�ΣN M����\�}��U+��n[k�׉(~�
�TU����������'i V���:�ȕ�﻿local seed = "No Seed"
local seedPtr = seedDisplay:GetTextConfig()
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(Any(Events(Numbers.Activated))),
  function(event)
    local index = event.any.signaledIndex
    Numbers[index]:Deactivate()
    if #seed <= 32 then
      if seed == "No Seed" then
        seed = ""
      end
      if index == 10 then
        seed = seed .. "0"
      else
        seed = seed .. tostring(index)
      end
      seedDisplay:SetText(seedPtr, seed, true)
      talosProgress:SetCode("Randomizer_Seed", tonumber(seed))
    end
  end,
  OnEvery(Event(Backspace.Activated)),
  function()
    Backspace:Deactivate()
    if seed ~= "No Seed" then
      if #seed <= 1 then
        seed = "No Seed"
        seedDisplay:SetText(seedPtr, seed, true)
        talosProgress:SetCode("Randomizer_Seed", -1)
      else
        seed = string.sub(seed, 1, -2) 
      end
      seedDisplay:SetText(seedPtr, seed, true)
      talosProgress:SetCode("Randomizer_Seed", tonumber(seed)) 
    end   
  end,  
  OnEvery(Event(Clear.Activated)),
  function()
    Clear:Deactivate()
    if seed ~= "No Seed" then
      seed = "No Seed"
      seedDisplay:SetText(seedPtr, seed, true)
      talosProgress:SetCode("Randomizer_Seed", -1)
    end
  end
)�U��9�t�9ɻ�y�!����D�4�U�ܠR"M�PcA�s&�پ����I0qZ��7� *:����Һ��~��/���B�H�"&��C0A�P��F0`��# �ˍ�#��&(�ڹR��Ц܂��ۮCTiE=[��s���ԗ6��g���J�2�^�3#��!�|y2��2g�y�o�>O�d����>ɸ����}��J�&�k�k-<F�4bP4���]Ϧ\oR��e��4�1n�cy�+%�