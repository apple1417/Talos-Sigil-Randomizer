SIGSTRM12GIS             ��                  Signkey.EditorSignature��������*�,��)�����[N�Lz9�Tf0kD3l
�#��:�a܉�?x�A�d$O�&,��H�@Yy�O�+
@+��+�k��f$H�;�F�K�O�JI
�'/��	/���t��l�H�6��<�����L��sc���TNy����C4�+���b��Ҳ����-��Ԁ��|�T%ހb��{-�z'~k6"�	�U��߹�\Ga��5>�?�)ex��>=-�K	�A4G~���m4�?�tٍ﻿GatesOfEternityFlare:Deactivate()
SmokeParticles:Start()
Door:Lock()
OpenedHeavenDoorGlow:Disappear()
ClosedHeavenDoorGlow:Appear()
HeavenGatesLight:Deactivate()

local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
if not talosProgress:IsVarSet("GatesOfEternityOpened") then
  Wait(CustomEvent("GatesOfEternityOpened"))
end

GatesOfEternityFlare:Activate()
SmokeParticles:Stop()
Door:AssureOpened()
OpenedHeavenDoorGlow:Appear()
ClosedHeavenDoorGlow:Disappear()
HeavenGatesLight:Activate()
GatesOfEternityParticles:Start()��ۀii�&EpQ^T�\ROi�p>Rz���`E៞��LeAа�|�ôz�EM�;t���!5��'g��� -ă���FpiT�*ф���JO������PF��s�����!v���e�,iI�yYi�q��	�;Bi��$P2���|vz��8W���),�=��~(����Ї�w� ������B;hX�A��&0��|��?�3�{_zHB�>��JpK�׫R)������A"z��Yz#��og֒ѧm(�