SIGSTRM12GIS             �Ƹ                  Signkey.EditorSignature{��.���?��U�_�!����A��y��Qܕ9�S���|	�X4�˾��y��|	���F�|�����fǢK�t0E���ml�c�q$	���r�����/�I�J��֙i�~Y�p����1ٜ2g� ���-��TQ����+	�mi8�m� j��"�*$�A�/����=��bg��Oa���z����R�il3�8j���c_,����Yl�^�N�L4X�.D��Y������#��t7k�2﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local sigilNum = talosProgress:GetCodeValue(thisScript:GetName())
local sigil = worldGlobals.allTetros[worldGlobals.tetros[sigilNum]]

if sigil:IsPicked() then
  LoweringFence:AssureOpened()
else
  Wait(Event(sigil.Picked))
  LoweringFence:Open()
endX�9���~%X.q֩�x�5.JpԜj����TO<C��MR�c�.�S��֬�7�� m�W�!�
8�γ�f���a����4�9z4���
W��μOmE�v��c�{>|�`.��дv#��w���D�F����$�����+sS<�R�BH�;��B顁��y"om��g�f������Y�q^ۉ��+Kx8/����5���C��.��~��ք���~����b�	!J�2��<�>��R	Q��t��/��