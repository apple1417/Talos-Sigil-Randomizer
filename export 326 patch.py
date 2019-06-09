import os
import shutil
import sys

BLACKLIST = shutil.ignore_patterns(
  ".git*", "Plaintext Scripts*", "Startup Scripts*", "246 Patch*", "326 Patch*",
  "Randomizer.nfo", "README.md", "*.py"
)

if os.path.exists("Randomizer.gro"):
  print("Removing existing .gro")
  os.remove("Randomizer.gro")

print("Copying files")
shutil.copytree("326 Patch", "temp/Content/Talos/Levels/Randomizer", ignore=BLACKLIST)
shutil.copytree("Startup Scripts", "temp/Content/Talos/Scripts/Startup")
shutil.copy2("Randomizer.nfo", "temp/Content/Talos/Levels/Randomizer.nfo")
print("Zipping")
shutil.make_archive("Randomizer_326", 'zip', "temp")
shutil.move("Randomizer_326.zip", "Randomizer_326.gro")
print("Removing temp directory")
shutil.rmtree("temp")