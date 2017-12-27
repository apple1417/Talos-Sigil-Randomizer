SIGSTRM12GIS             �"��                  Signkey.EditorSignature0x׬�"����=������
��'.�4��A"
��=ݙ�=MjU�,մ8��l����y�~8��T�&]���ÊG��5�Է��61c� �gBɂ� �4��b�Y���G���컡�-���b�B�%�wJ�〝^���xk��effd@�h���EE���un�6p1�Ve��N��X]����O��VE�al�d@���H�L�u��7O�R�'�u���Ъ�k�
gZ�SnfK?��ru�ؚ>�%o!�c��﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local Sigils = {}
for k, v in pairs({"225_SPM_000_PM_044", "317_SPM_000_PM_024",
                   "229_SPM_000_PM_070", "318_SPM_000_PM_026",
                   "Cloud_3_03_SRT_SPM_000_PM_069"}) do
  local sigilNum = talosProgress:GetCodeValue(v)
  Sigils[k] = worldGlobals.allTetros[worldGlobals.tetros[sigilNum]]
end

local function SetupSecretDoors()
  local progress = nexGetTalosProgress(worldGlobals.worldInfo)
  local strPickedInstances = progress:GetInventoryTetrominoes() .. progress:GetUsedupTetrominoes()
 
  local ctPicked = 0
  for i=1,#Sigils do
  -- sigil : CGenericItemEntity
    local sigil = Sigils[i]
    local strName = sigil:GetName()
    if string.match(strPickedInstances, strName..";") then
      ctPicked = ctPicked+1
      if ctPicked<5 then
        Door[ctPicked]:Open()
      else
        PlasmaDoor:ForceOpen()
      end
    end
  end
end

SetupSecretDoors()

RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(Any(Event(Sigils[1].Picked), Event(Sigils[2].Picked),
              Event(Sigils[3].Picked), Event(Sigils[4].Picked),
              Event(Sigils[5].Picked))), function()
    SetupSecretDoors()
  end
)�'����h*�����O�?�t�3�'L�sg�'�y��� B�&8YU��-�"����I` ��r��Q{d[��e����RluT2#r���Q�_�����������}��}���Hd�u��g����:����*�S-���B
g	�N�c���lG�!��A{q$��@(�xC)HB��%X��4D4�O&)},��q��=��si����8H{t�qa(j�*�
�H>d W.�K�B���=�5���