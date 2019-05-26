SIGSTRM12GIS             
��B                  Signkey.EditorSignature,����Jۄ�YL�
�I��جV�ޱ.�RiJ�*�Qք>C�]��
Ȍ��ЩG�\��D�(���յ�R�cl���V9�+�r9����O����eY���74Q��7����������G���$��5�U ß�ͧ'y�uEX�#8+�S���)���RE;���P�x����S�����|}�0ݼ�s�Bwy��5Fj����t<��P��Om`�d���t�c޿{\)��*�|i������{tl�﻿Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))
local Options = worldGlobals.Randomizer.MiscOptions

local offset = GreenButtons[1]:GetPlacement():GetVect() - GrayButtons[1]:GetPlacement():GetVect()
offset = offset / 2

for i = 1, #Options.AsArray do
  GrayButtons[i]:EnableUsage()
  GrayTexts[i]:SetText(
    GrayTexts[i]:GetTextConfig(),
    Options.AsArray[i].name,
    true
  )
  GreenTexts[i]:SetText(
    GreenTexts[i]:GetTextConfig(),
    Options.AsArray[i].name,
    true
  )
end

local emptyButton = {}
for i = #Options.AsArray + 1, #GrayButtons do
  emptyButton[i] = true
  GrayButtons[i]:EnableUsage()
end

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local currentIndex = 1
local scavenger = false
RunHandled(WaitForever,
  OnEvery(Any(Events(GrayButtons.Used))),
  function(event)
    local index = event.any.signaledIndex
    if emptyButton[index] then
      worldGlobals.Randomizer.pressButton(GrayButtons[index], nil, offset, true)
    else
      worldGlobals.Randomizer.pressButton(
        GrayButtons[index], GreenButtons[index],
        offset, false,
        function()
          talosProgress:SetVar(Options.AsArray[index].talosProgress)
          if scavenger and index == Options.Values.AllItems.id then
            SignalEvent("Randomizer_ScavengerOff")
          end
        end
      )
    end
  end,
  OnEvery(Any(Events(GreenButtons.Used))),
  function(event)
    local index = event.any.signaledIndex
       
    worldGlobals.Randomizer.pressButton(
      GreenButtons[index], GrayButtons[index],
      offset, false,
      function()
        talosProgress:ClearVar(Options.AsArray[index].talosProgress)
        if scavenger and index == Options.Values.OpenWorlds.id then
          SignalEvent("Randomizer_ScavengerOff")
        end
      end
    )
  end,
  OnEvery(CustomEvent("Randomizer_ScavengerOn")),
  function()
    if not scavenger then
      scavenger = true
      local OpenWorlds = Options.Values.OpenWorlds
      if not talosProgress:IsVarSet(OpenWorlds.talosProgress) then
        talosProgress:SetVar(OpenWorlds.talosProgress)
        GrayButtons[OpenWorlds.id]:DisableUsage()
        worldGlobals.Randomizer.pressButton(
          GrayButtons[OpenWorlds.id],
          GreenButtons[OpenWorlds.id],
          offset
        )
      end
      local AllItems = Options.Values.AllItems
      if talosProgress:IsVarSet(AllItems.talosProgress) then
        talosProgress:ClearVar(AllItems.talosProgress)
        GreenButtons[AllItems.id]:DisableUsage()
        worldGlobals.Randomizer.pressButton(
          GreenButtons[AllItems.id],
          GrayButtons[AllItems.id],
          offset
        )
      end      
    end
  end,
  OnEvery(CustomEvent("Randomizer_ScavengerOff")),
  function()
    scavenger = false
  end  
)PוEл��uuKcq�8������q��
���&�������Ss�als���FU(e�4��޵�2��Ō�?}�ξbM�gOQ�4G��d�����hMд��h)�]a��m�p�S�>�5� ��2BT�I7c4�,�zم!d�8؉L!��j7�K�\��!>	����9���x9����2�
TZ�0F� �p��ڍ�"|W3�A$q�{>8�p�[��weϝd�KB(�'衊��z|�-*��/V���