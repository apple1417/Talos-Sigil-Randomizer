SIGSTRM12GIS             �u��                  Signkey.EditorSignatures�����{��Xg@x{zfV�h:���)�K����ɀ�����F	8��_:q�����5��iw�Zh6n�#����t�F�ͼ�2����<�[�1u�
r4����`F���RZ��69(�"P�?��6��k����ϲ7�TM��s4�e�_6�~�c���&~�u��-�5�pW���]T�����W��ۣ&%���Mͩ�f�&}*+�9�r��)�;D���aV)�2�,�4�Sџ�m<�92d b3	����﻿Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))
-- This one is a bit more hardcoded than the rest
local Moody = worldGlobals.Randomizer.Moody
local Uno = worldGlobals.Randomizer.Uno
local values = {
  Moody.Values.Colour,
  Moody.Values.Shape,
  Uno
}

local offset = GreenButtons[1]:GetPlacement():GetVect() - GrayButtons[1]:GetPlacement():GetVect()
offset = offset / 2

for i = 1, #values do
  GrayButtons[i]:EnableUsage()
  GrayTexts[i]:SetText(
    GrayTexts[i]:GetTextConfig(),
    values[i].name,
    true
  )
  GreenTexts[i]:SetText(
    GreenTexts[i]:GetTextConfig(),
    values[i].name,
    true
  )
end

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local moodyState = 0
local uno = false
RunHandled(WaitForever,
  OnEvery(Any(Events(GrayButtons.Used))),
  function(event)
    local index = event.any.signaledIndex   
     
    worldGlobals.Randomizer.pressButton(
      GrayButtons[index], GreenButtons[index],
      offset, false,
      function()
        if index == 3 then
          if moodyState then
            if moodyState % 2 == 1 then
              worldGlobals.Randomizer.pressButton(GreenButtons[1], GrayButtons[1], offset)
            end
            if moodyState >= 2 then
              worldGlobals.Randomizer.pressButton(GreenButtons[2], GrayButtons[2], offset)
            end
            moodyState = 0
            talosProgress:ClearVar(Moody.talosProgress)
          end
          talosProgress:SetVar(Uno.talosProgress)
          uno = true          
        else
          if uno then
            worldGlobals.Randomizer.pressButton(GreenButtons[3], GrayButtons[3], offset)
            uno = false
            talosProgress:ClearVar(Uno.talosProgress)
          end
          moodyState = moodyState + values[index].mask
          talosProgress:SetVarValue(
            Moody.talosProgress,
            moodyState
          )
        end
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
        if index == 3 then
          talosProgress:ClearVar(Uno.talosProgress)
          uno = false
        else
          moodyState = moodyState - values[index].mask
          if moodyState == 0 then
            talosProgress:ClearVar(Moody.talosProgress)
          else
            talosProgress:SetVarValue(
              Moody.talosProgress,
              moodyState
            )
          end
        end
      end
    )
  end  
)A�y�R�D���ӷ��tu'-j�# ���̜A~��xT�W+����=�E.��Z?�#[e�Y�6�n�X=|E��tb^�mI��s6I�=
>�ʠ�O��{2E�3	��$2�۬y���u0]Q�g��� �ef���3�i����8J��ݣ�w)�.=�e��s`�#q^Bʬ ���j+��\�6da�P🕔 K���v�i���A�w�]e���~]��}�L��VS���v͵c��Xdw����9�xܩO`