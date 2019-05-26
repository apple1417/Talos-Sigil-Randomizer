SIGSTRM12GIS             !�j�                  Signkey.EditorSignature�4t����
�!�C��	ϩׄ��z�J�0.l�G^)!��?�.��W�X���]��@��Yz�Z�Դ������s����ei�UX�4_ȅ�9
�rT?N.#B�v��1��)m�~��4fQe��bIS�񦘦�:��%��Vd�M�Tv����;���:��V�^�EZ1;�hrt{�i'������gCJPD?i��ִ��
M$��M}�s��䳦{ή�ީ�P��Ci�~_�Wl�j��U�%����﻿Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))
local Hints = worldGlobals.Randomizer.Hints

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local offset = GreenButtons[1]:GetPlacement():GetVect() - GrayButtons[1]:GetPlacement():GetVect()
offset = offset / 2

for i=1, #GrayButtons do
  GrayButtons[i]:EnableUsage()
end

local currentHints = 0
RunHandled(WaitForever,
  OnEvery(Any(Events(GrayButtons.Used))),
  function(event)
    local index = event.any.signaledIndex
    
    worldGlobals.Randomizer.pressButton(
      GrayButtons[index], GreenButtons[index],
      offset, false,
      function()
        currentHints = currentHints + Hints.AsArray[index].mask
        talosProgress:SetVarValue(Hints.talosProgress, currentHints)
      end
   )
  end,
  OnEvery(Any(Events(GreenButtons.Used))),
  function(event)
    local index = event.any.signaledIndex
    
    worldGlobals.Randomizer.pressButton(
      GreenButtons[index], GrayButtons[index],
      offset, false,
      function()
        currentHints = currentHints - Hints.AsArray[index].mask
        if currentHints == 0 then
          talosProgress:ClearVar(Hints.talosProgress)
        else
          talosProgress:SetVarValue(Hints.talosProgress, currentHints)
        end
      end
   )    
  end
))�İ"�d[:��a>�Ӥ�A
����/��х��B�C��6����50�҄|w+�̼�ڶ�eD�ԑ&�?���E�_ �2��c�l�����Y�}WC)ݬb��GC۔1WoQ�rA+R��x�q�n8�����D�L��+hNe�r����ǉ.���_�b�ݻ�(�Q9�|��8H�,fDѦ�B��o�!݃�P�xk���V���� e�eA�g�>��Z��O�~���l*����j:Q_x�ǄD