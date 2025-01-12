SIGSTRM12GIS             շWP                  Signkey.EditorSignaturek�Z&lL7/�F�
6�O|!Vz,��Ĩ ��d��'+�!�����FP�_%`J�D7��2�v�s�J+��>��mj��T{�n5K�;O��}��UAq)*������(��JG��T�����D=��b�fI@�=K�Z���L��������@89+��eZ������zϾ�O���{���T/{ʲ���ߡ�Ε�ˆ���`4o��[,q��(k���T�F�l2�i�: $�������Ϥ���:
﻿Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))
local Modes = worldGlobals.Randomizer.Modes

local offset = GreenButtons[1]:GetPlacement():GetVect() - GrayButtons[1]:GetPlacement():GetVect()
offset = offset / 2

-- We want the None button to be the last, this assumes it's first in the list
for i = 2, #Modes.AsArray do
  GrayButtons[i - 1]:EnableUsage()
  GrayTexts[i - 1]:SetText(
    GrayTexts[i - 1]:GetTextConfig(),
    Modes.AsArray[i].name,
    true
  )
  GreenTexts[i - 1]:SetText(
    GreenTexts[i - 1]:GetTextConfig(),
    Modes.AsArray[i].name,
    true
  )
end
local noneIndex = #GrayButtons
GrayButtons[noneIndex]:EnableUsage()
GrayTexts[noneIndex]:SetText(
  GrayTexts[noneIndex]:GetTextConfig(),
  Modes.Values.None.name,
  true
)
GreenTexts[noneIndex]:SetText(
  GreenTexts[noneIndex]:GetTextConfig(),
  Modes.Values.None.name,
  true
)

local emptyButton = {}
for i = #Modes.AsArray, #GrayButtons - 1 do
  emptyButton[i] = true
  GrayButtons[i]:EnableUsage()
end

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

worldGlobals.Randomizer.swapPos(GrayButtons[1], GreenButtons[1])
GrayButtons[1]:DisableUsage()
GreenButtons[1]:EnableUsage()

local scavenger = false
local currentIndex = 1
talosProgress:SetVarValue(
  Modes.talosProgress,
  Modes.Values.Default.id
)
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
          if index == noneIndex then
            talosProgress:SetVarValue(
              Modes.talosProgress,
              Modes.Values.None.id
            )
          else
            talosProgress:SetVarValue(
              Modes.talosProgress,
              Modes.AsArray[index + 1].id
            )
          end
          if scavenger and index == Modes.Values.FullyRandom.id then
            SignalEvent("Randomizer_ScavengerOff")
          end
          GrayButtons[currentIndex]:EnableUsage()
          worldGlobals.Randomizer.swapPos(GrayButtons[currentIndex], GreenButtons[currentIndex])
          currentIndex = index
        end
      )
    end
  end,
  OnEvery(Any(Events(GreenButtons.Used))),
  function(event)
    local index = event.any.signaledIndex
    worldGlobals.Randomizer.pressButton(GreenButtons[index], nil, offset, true)
  end,
  OnEvery(CustomEvent("Randomizer_ScavengerOn")),
  function()
    scavenger = true
    if currentIndex == Modes.Values.FullyRandom.id then
      worldGlobals.Randomizer.pressButton(
        GrayButtons[1], GreenButtons[1],
        offset, false,
        function()
          talosProgress:SetVarValue(
            Modes.talosProgress,
            Modes.Values.Default.id
          )
          currentIndex = 1
          worldGlobals.Randomizer.swapPos(GrayButtons[3], GreenButtons[3])
          GrayButtons[3]:EnableUsage()
          GreenButtons[3]:DisableUsage()
        end
      )
    end
  end,
  OnEvery(CustomEvent("Randomizer_ScavengerOff")),
  function()
    scavenger = false
  end  
)@ }�;q�&�&N��1Å���œu�n���RI�뼢A$�	����`�'�3��"t���6�B�M����V7����#dD�q-�z2�nQ
5b��7���D>���-ӧ�4z���U
�f�U��������e,��q2K�B�ڐ��<��-�Ҝ.Z
�d�	I�c{�߭c�dBB\��~#�s7.���V+��_�iY.��^�$0����%��[HۂM�v��'�v��.J��(��@9%�lW{��B�)Ц