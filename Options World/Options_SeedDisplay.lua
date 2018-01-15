SIGSTRM12GIS             \ŝw                  Signkey.EditorSignature��C�L|�#"Ԋ�S�i˦;�r�H�z#����q�d�e� �W��B#�I��=�u�����cTG{f�8g�	T@���Ϝ���}��������d��|4d��F'E�^C���Qff��>��4N�M�?R�ߓ	0�t�;��s] ������9"Z��.�	�W���?�m���y������ZC�����&`�+S�ُ����f/� [��F�	�/��3|W��.M'��CP��~�d䌃)��ڇ4h��~�?N�K﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local seed = "No Seed"
local seedPtr = seedDisplay:GetTextConfig()

RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(Any(Events(Numbers.Activated))),
  function(event)
    local index = event.any.signaledIndex
    Numbers[index]:Deactivate()
    --[[
    0x0ccccccd is the smallest number that you can't add
    a (decimal) digit to without going over 0x7fffffff
    ]]--
    if seed == "No Seed" or tonumber(seed) < 0x0ccccccd then
      if seed == "No Seed" then
        seed = ""
      end
      if index == 10 then
        seed = seed .. "0"
      else
        seed = seed .. tostring(index)
      end
      if tonumber(seed) < 0x7fffffff then
        seedDisplay:SetText(seedPtr, seed, true)
        talosProgress:SetCode("Randomizer_Seed", tonumber(seed))
      else
        seed = talosProgress:GetCodeValue("Randomizer_Seed")
      end
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
        seedDisplay:SetText(seedPtr, seed, true)
        talosProgress:SetCode("Randomizer_Seed", tonumber(seed))         
      end
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
)���m���%-����?�>-���b_E��V[}4޿U�t�cf��D�h-&�#�lqw�]���ȎCf�"Ү��P'a�6�4w	;Y����Ӊ�ZP��ny�F��=���-k!�bX ��A��ؖM�\�u��Nʳ����ZS���!���f�,O}�oH�B���ŃB|�{�Oe�w�xgCi����8�>;��'�NG�ю�����ؒȧ��M��sF4�%�ŧp�ӣ�$9�B�cZ�W�_��C'