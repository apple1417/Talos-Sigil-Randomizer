SIGSTRM12GIS             8��d                  Signkey.EditorSignatureh	������Û��38�ŕ�fME�U�w;�SoAjj�(�x�@ѕ	L?���kŐ�SK���#.-��?Ċ�d�FN�4SX�~�L�XD�8�܉�%��h��K�̀����n� ��	@��X�X���dN��Q[\r�0���Qz�-����jH�����F8{��2����޶whk=����+
�ն�a��e�ҬF�|���rJT^v� ��{4�Dx]�����U�Se�N~��Ik,�Yj�#�|�|﻿Wait(CustomEvent("Randomizer_Finished"))

--[[
  Workshop maps in general break precaching, let alone when the next world
   to cache can vary from playthrough to playthrough, so I have to manually
   re-implement it
]]--


-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local printWarning = worldGlobals.Randomizer.printWarning
--[[
  Caching causes a bunch of log lines, which spam the console and are kind
   of annoying, so if debug mode or we're in the editor then just don't do it
]]
if talosProgress:IsVarSet(worldGlobals.Randomizer.MiscFlags.debug) or corIsAppEditor() then
  printWarning("Disabling Precaching")
else
  local function cache(world, high)
    if high then
      worldInfo:AddToWorldCache_AsHighPriority("Content/Talos/Levels/Randomizer/" .. world .. ".wld")
    else
      worldInfo:AddToWorldCache("Content/Talos/Levels/Randomizer/" .. world .. ".wld")
    end
  end

  local fileNames = {
    "Cloud_1_01", "Cloud_1_02", "Cloud_1_03", "Cloud_1_04",
    "Cloud_1_05", "Cloud_1_06", "Cloud_1_07", "Cloud_1_08",
    "DeveloperIsland",
    "Cloud_2_01", "Cloud_2_02", "Cloud_2_03", "Cloud_2_04",
    "Cloud_2_05", "Cloud_2_06", "Cloud_2_07", "Cloud_2_08",
    "Cloud_3_01", "Cloud_3_02", "Cloud_3_03", "Cloud_3_04",
    "Cloud_3_05", "Cloud_3_06", "Cloud_3_07", "Cloud_3_08",
    "Islands_01"
  }
  local shortNames = {
    "A1-Portal", "A2-Portal", "A3-Portal", "A4-Portal", "A5-Portal", "A6-Portal", "A7-Portal", "A*-Portal", "AD-Portal",
    "B1-Portal", "B2-Portal", "B3-Portal", "B4-Portal", "B5-Portal", "B6-Portal", "B7-Portal", "B*-Portal",
    "C1-Portal", "C2-Portal", "C3-Portal", "C4-Portal", "C5-Portal", "C6-Portal", "C7-Portal", "C*-Portal", "CM-Portal"
  }
  local fileToShort = {}
  for i=1, #fileNames do
    fileToShort[fileNames[i]] = shortNames[i]
  end

  local nextIndex = talosProgress:GetCodeValue(worldGlobals.Randomizer.MiscFlags.mobiusInterlude)
  cache(fileNames[nextIndex], true)
  nextIndex = talosProgress:GetCodeValue(shortNames[nextIndex])
  cache(fileNames[nextIndex], true)
  for _=1, 6 do
    nextIndex = talosProgress:GetCodeValue(shortNames[nextIndex])
    cache(fileNames[nextIndex], false)
  end
end
q%,E�u�q�Nydf����c��բ�����𩥤��;��(��!�qE[(�A�/E��p2(޲�$a���B���8���#�r�4��?�шLω��L����JH��O�U�u�6_��qS�Q.�sd,f��
WK���&��A+�EP���r��`�A�иp���D"� ��t�*�ɰ��������</�+�=���b �����rZ:�����GZ��GW�Ej ���	jl_���6����>