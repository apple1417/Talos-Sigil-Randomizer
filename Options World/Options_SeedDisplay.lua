SIGSTRM12GIS             ��3I                  Signkey.EditorSignature��\�65�t�<���a	�� s'���K���&���N6���� ��?��^�
��|Ȋ�N�9�u �k̛�	~ۀ��p~���_�ZZI�r��m��&�-�L����}B%��T�0X9��LЌF�V�;$�ծg��̞��}YU%�� ���M�����?u�閎����� Q8#��8��@6�T�մ�́�rs�t���Pl�};�&�\?͹��qHU��t]�����!�{�#z����<���]���ϲ�����﻿local seed = "No Seed"
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
)�/4%N���n�$
�j��w�.h��_gg���<)������<�HBu&L~�&-PRq��<vAo���6n���IP�����G����>0!ƌ ���u/x��x��3���ե괏���k��5j$�}W@�NP;k�X��xT���f����)�Ɉrj0ۈ�i�"�	��Oˀ�uMF��9�9���������*����f��i�le�� X���(�H"��8��!������R)��*+�4?й