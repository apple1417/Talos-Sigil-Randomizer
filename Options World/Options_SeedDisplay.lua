SIGSTRM12GIS             ��;�                  Signkey.EditorSignature��U���(���L\��[蒒�9�!��	�{���}��7Q�`����j�~ .t�lzl��u����w��KW��RC�|X�⥝�[�0`-S.Q���\�o���렠_�0�b)����SUM䈢A9z$��Z���`$�ߙ�^��P�m��Ĕ즓�;���3����(�"��ʱm���v;Ν���]	��X;�<��Pc�;�MXYbU����e���01Jg;����O�#�eN
cv�� ,b-g��﻿-- talosProgress : CTalosProgress
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
)y�N��˿Q�X�,� ������<2�a5�ق���1+�5nTr	�����p�Ri�$�㓨�ID���՛Q�{�jyz���$w�]&w��	bA6��淮m	LPa��W��ˆO�{G�.��o��|?(. ?�櫈,��Z��b����W�WG��)�P�P���n�*�o�-�r"�x��2]hz�堒E5[	�+�WYZ����Kʴ��+����9����>�e�V|���]�(qe���[�rE��1�S
�