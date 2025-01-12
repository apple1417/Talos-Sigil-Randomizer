SIGSTRM12GIS             ��dR                  Signkey.EditorSignature��$w\��C�gi~3�#� ܽ��se�N���ŔTS��=d��!� d2�lt7�q�c!��<弃����r�q
�#L'�N���W�]?����d�h�L�:TK�f���w0O���]Hk+wisFհ&+������L���O��%�����M�f���<��f{�9G�
�r𜢝��_�'�@������ԢR.�!õ���&l�At���
�qc5��l6R74�4=\2�ch�� �7��y�>M,�﻿-- Sets up a big table on worldGlobals with many useful constants
local Randomizer = {}

Randomizer.checkBit = function(value, offset)
  for i = 0, offset - 1 do
    value = mthFloorF(value / 2)
  end
  return value % 2 == 1
end
Randomizer.getAllBits = function(value, bitTable)
  local outputTable = {}
  for i = 0, #bitTable.AsArray - 1 do
    if (value % 2 == 1) then
      table.insert(outputTable, bitTable.AsArray[i + 1])
    end
    value = mthFloorF(value / 2)
  end
  return outputTable
end

--[[
  The normal print function only prints in editor, in one colour
  The console functions only take one argument and don't auto-print newlines
  These functions are wrapper to make them more like the original function
]]--
Randomizer.print = function(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conInfoF(out)
end

Randomizer.printWarning = function(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conWarningF(out)
end

Randomizer.printError = function(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conErrorF(out)
end

Randomizer.printLog = function(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conLogF(out)
end

Randomizer.currentWorld = worldInfo:GetWorldFileName()
Randomizer.version = "v20.0.9"

Randomizer.Arrangers = {
  A1Gate = {
    name = "A1Gate",
    Sigils = {"DJ1", "DJ2", "DZ1"}
  },
  AGate = {
    name = "AGate",
    Sigils = {"DI1", "DJ3", "DL1", "DZ2"}
  },
  BGate = {
    name = "BGate",
    Sigils = {"DI2", "DL2", "DT1", "DT2", "DZ3"}
  },
  CGate = {
    name = "CGate",
    Sigils = {"DJ4", "DJ5", "DL3", "DT3", "DT4", "DZ4"}
  },
  AStar = {
    name = "AStar",
    Sigils = {"**1", "**2", "**3", "**4", "**5", "**6", "**7", "**8", "**9", "**10"}
  },
  BStar = {
    name = "BStar",
    Sigils = {"**11", "**12", "**13", "**14", "**15", "**16", "**17", "**18", "**19", "**20"}
  },
  CStar = {
    name = "CStar",
    Sigils = {"**21", "**22", "**23", "**24", "**25", "**26", "**27", "**28", "**29", "**30"}
  },
  Connector = {
    name = "Connector",
    Sigils = {"ML1", "MT1", "MT2"}
  },
  Cube = {
    name = "Cube",
    Sigils = {"ML2", "MT3", "MT4", "MZ1"}
  },
  Fan = {
    name = "Fan",
    Sigils = {"ML3", "MS1", "MT5", "MT6", "MZ2"}
  },
  Recorder = {
    name = "Recorder",
    Sigils = {"MJ1", "MS2", "MT7", "MT8", "MZ3"}
  },
  Platform = {
    name = "Platform",
    Sigils = {"MI1", "ML4", "MO1", "MT9", "MT10", "MZ4"}
  },
  F1 = {
    name = "F1",
    Sigils = {"NL1", "NL2", "NZ1", "NZ2"}
  },
  F2 = {
    name = "F2",
    Sigils = {"NL3", "NL4", "NL5", "NL6", "NO1", "NT1", "NT2", "NT3", "NT4"}
  },
  F3 = {
    name = "F3",
    Sigils = {"NI1", "NI2", "NI3", "NI4", "NJ1", "NJ2", "NL7", "NL8", "NS1", "NZ3"}
  },
  F4 = {
    name = "F4",
    Sigils = {"NJ3", "NL9", "NO2", "NO3", "NS2", "NS3", "NT5", "NT6", "NT7", "NT8", "NZ4", "NZ5"}
  },
  F5 = {
    name = "F5",
    Sigils = {"NI5", "NI6", "NJ4", "NL10", "NO4", "NO5", "NO6", "NO7", "NS4", "NT9", "NT10", "NT11", "NT12", "NZ6"}
  },
  F6 = {
    name = "F6",
    Sigils = {"EL1", "EL2", "EL3", "EL4", "EO1", "ES1", "ES2", "ES3", "ES4"}
  }
}

-- This table doesn't include the star worlds cause they have no real hints
Randomizer.Hints = {
  bitwise = true,
  talosProgress = "Randomizer_Hints",
  Values = {
    A1Gate = {
      id = 0,
      SigilCounts = {DJ = 2, DZ = 1}
    },
    AGate = {
      id = 1,
      SigilCounts = {DI = 1, DJ = 1, DL = 1, DZ = 1}
    },
    BGate = {
      id = 2,
      SigilCounts = {DI = 1, DL = 1, DT = 2, DZ = 1}
    },
    CGate = {
      id = 3,
      SigilCounts = {DJ = 2, DL = 1, DT = 2, DZ = 1}
    },
    Connector = {
      id = 4,
      SigilCounts = {ML = 1, MT = 2}
    },
    Cube = {
      id = 5,
      SigilCounts = {ML = 1, MT = 2, MZ = 1}
    },
    Fan = {
      id = 6,
      SigilCounts = {ML = 1, MS = 1, MT = 2, MZ = 1}
    },
    Recorder = {
      id = 7,
      SigilCounts = {MJ = 1, MS = 1, MT = 2, MZ = 1}
    },
    Platform = {
      id = 8,
      SigilCounts = {MI = 1, ML = 1, MO = 1, MT = 2, MZ = 1}
    },
    F1 = {
      id = 9,
      SigilCounts = {NL = 2, NZ = 2}
    },
    F2 = {
      id = 10,
      SigilCounts = {NL = 4, NO = 1, NT = 4}
    },
    F3 = {
      id = 11,
      SigilCounts = {NI = 4, NJ = 2, NL = 2, NS = 1, NZ = 1}
    },
    F4 = {
      id = 12,
      SigilCounts = {NJ = 1, NL = 1, NO = 2, NS = 2, NT = 4, NZ = 2}
    },
    F5 = {
      id = 13,
      SigilCounts = {NI = 2, NJ = 1, NL = 1, NO = 4, NS = 1, NT = 4, NZ = 1}
    },
    F6 = {
      id = 14,
      SigilCounts = {EL = 4, EO = 1, ES = 4}
    }
  },
  AsArray = {}
}

Randomizer.Hub = {
  A = {
    name = "A"
  },
  B = {
    name = "B"
  },
  C = {
    name = "C"
  }
}

Randomizer.LastColour = {
  talosProgress = "Randomizer_LastColour",
  fromSigil = function(sigil)
    local char = string.sub(sigil, 1, 1)
    for _, v in pairs(Randomizer.LastColour.Values) do
      if v.char == char then
        return v
      end
    end
  end,
  Values = {
    Star = {
      char = "*",
      id = 1
    },
    Green = {
      char = "D",
      id = 2
    },
    Gray = {
      char = "E",
      id = 3
    },
    Yellow = {
      char = "M",
      id = 4
    },
    Red = {
      char = "N",
      id = 5
    }
  },
  AsArray = {}
}

Randomizer.LastShape = {
  talosProgress = "Randomizer_LastShape",
  fromSigil = function(sigil)
    local char = string.sub(sigil, 2, 2)
    for _, v in pairs(Randomizer.LastShape.Values) do
      if v.char == char then
        return v
      end
    end
  end,
  Values = {
    I = {
      char = "I",
      id = 1
    },
    J = {
      char = "J",
      id = 2
    },
    L = {
      char = "L",
      id = 3
    },
    O = {
      char = "O",
      id = 4
    },
    S = {
      char = "S",
      id = 5
    },
    T = {
      char = "T",
      id = 6
    },
    Z = {
      char = "Z",
      id = 7
    },
    Star = {
      char = "*",
      id = 8
    }
  },
  AsArray = {}
}

Randomizer.MiscFlags = {
  debug = "Randomizer_Debug",
  devIslandVisited = "Randomizer_DevIslandVisited",
  extraSeed = "Randomizer_ExtraSeed",
  extraSigilsGiven = "Randomizer_ExtraSigilsGiven",
  generated = "Randomizer_Generated",
  jetpackState = "Randomizer_JetpackState",
  mobiusDone = "Randomizer_MobiusDone",
  mobiusInterlude = "Randomizer_MobiusAfterInterlude",
  shownChecksum = "Randomizer_ShownChecksum"
}

Randomizer.MiscOptions = {
  Values = {
    OpenWorlds = {
      id = 1,
      name = "Open All Worlds",
      talosProgress = "Randomizer_OpenWorlds",
    },
    AllItems = {
      id = 2,
      name = "Unlock All Items",
      talosProgress = "Randomizer_AllItems"
    },
    Portals = {
      id = 3,
      name = "Random Portals",
      talosProgress = "Randomizer_Portals"
    },
    Jetpack = {
      id = 4,
      name = "Jetpack",
      talosProgress = "Randomizer_Jetpack"
    },
    ExtraSigils = {
      id = 5,
      name = "Random Extra Sigils",
      talosProgress = "Randomizer_ExtraSigils"
    }
  },
  AsArray = {}
}

Randomizer.Mobius = {
  bitwise = true,
  talosProgress = "Randomizer_Mobius",
  Values = {
    AllSigils = {
      id = 0,
      name = "All Sigils"
    },
    AllShape = {
      id = 1,
      name = "All of a Shape"
    },
    AllColour = {
      id = 2,
      name = "All of a Colour"
    },
    Eternalize = {
      id = 3,
      name = "Eternalize Ending"
    },
    TwoTower = {
      id = 4,
      name = "Two Tower Floors"
    },
    RandomArrangers = {
      id = 5,
      name = "Random Arrangers"
    }
  },
  AsArray = {}
}

Randomizer.Modes = {
  talosProgress = "Randomizer_Mode",
  Values = {
    None = {
      id = 0,
      name = "No Randomization"
    },
    Default = {
      id = 1,
      name = "Default"
    },
    Sixty = {
      id = 2,
      name = "60FPS Friendly"
    },
    FullyRandom = {
      id = 3,
      name = "Fully Random"
    },
    Intended = {
      id = 4,
      name = "Intended"
    },
    Hardmode = {
      id = 5,
      name = "Hardmode"
    },
    SixtyHardmode = {
      id = 6,
      name = "60FPS Hardmode"
    }
  },
  AsArray = {}
}

Randomizer.Moody = {
  bitwise = true,
  talosProgress = "Randomizer_Moody",
  Values = {
    Colour = {
      id = 0,
      name = "Moody Colour"
    },
    Shape = {
      id = 1,
      name = "Moody Shape"
    }
  },
  AsArray = {}
}

Randomizer.Puzzles = {
  A1 = {
    talosProgress = "A1-Portal",
    PaSL = {
      full = "Poking a Sleeping Lion",
      sigil = "DI1",
      talosProgress = "A1-PaSL"
    },
    StBP = {
      full = "Striding the Beaten Path",
      sigil = "DJ1",
      talosProgress = "A1-StBP"
    },
    Outnumbered = {
      full = "Outnumbered",
      sigil = "DJ2",
      talosProgress = "A1-Outnumbered"
    },
    OtToU = {
      full = "Only the Two of Us",
      sigil = "DJ3",
      talosProgress = "A1-OtToU"
    },
    ASOoR = {
      full = "A Switch Out of Reach",
      sigil = "DZ1",
      talosProgress = "A1-ASOoR"
    },
    Trio = {
      full = "Trio Bombasticus",
      sigil = "ML1",
      talosProgress = "A1-Trio"
    },
    Peephole = {
      full = "Peephole",
      sigil = "MT1",
      talosProgress = "A1-Peephole"
    },
    Star = {
      full = "A1 Star",
      sigil = "**5",
      talosProgress = "A1-Star"
    }
  },
  A2 = {
    talosProgress = "A2-Portal",
    Guards = {
      full = "The Guards Must Be Crazy",
      sigil = "DL1",
      talosProgress = "A2-Guards"
    },
    HoW = {
      full = "Hall of Windows",
      sigil = "DZ2",
      talosProgress = "A2-HoW"
    },
    SM = {
      full = "Suicide Mission",
      sigil = "ML2",
      talosProgress = "A2-SM"
    },
    Star = {
      full = "A2 Star",
      sigil = "**2",
      talosProgress = "A2-Star"
    }
  },
  A3 = {
    talosProgress = "A3-Portal",
    SfL = {
      full = "Stashed for Later",
      sigil = "DZ3",
      talosProgress = "A3-SfL"
    },
    ABTU = {
      full = "A Bit Tied Up",
      sigil = "MT2",
      talosProgress = "A3-ABTU"
    },
    ABTUStar = {
      full = "A Bit Tied Up Star",
      sigil = "**1",
      talosProgress = "A3-ABTUStar"
    },
    LMUStK = {
      full = "Locked Me Up, Swallowed the Key",
      sigil = "MT3",
      talosProgress = "A3-LMUStK"
    },
    AEP = {
      full = "An Escalating Problem",
      sigil = "NL1",
      talosProgress = "A3-AEP"
    },
    Clock = {
      full = "Clock Star",
      sigil = "**3",
      talosProgress = "A3-Clock"
    }
  },
  A4 = {
    talosProgress = "A4-Portal",
    BiO = {
      full = "Branch it Out",
      sigil = "MT4",
      talosProgress = "A4-BiO"
    },
    AAT = {
      full = "Above All That...",
      sigil = "MT5",
      talosProgress = "A4-AAT"
    },
    PiF = {
      full = "Push it Further",
      sigil = "MZ1",
      talosProgress = "A4-PiF"
    },
    Star = {
      full = "A4 Star",
      sigil = "**4",
      talosProgress = "A4-Star"
    },
    DCtS = {
      full = "Don't Cross the Streams!",
      sigil = "MZ2",
      talosProgress = "A4-DCtS"
    }
  },
  A5 = {
    talosProgress = "A5-Portal",
    TwoBoxes = {
      full = "Things to Do With Two Boxes",
      sigil = "DI2",
      talosProgress = "A5-TwoBoxes"
    },
    TwoBoxesStar = {
      full = "Things to Do With Two Boxes Star",
      sigil = "**7",
      talosProgress = "A5-TwoBoxesStar"
    },
    YKYMCtS = {
      full = "You Know You Mustn't Cross the Streams",
      sigil = "DL2",
      talosProgress = "A5-YKYMCtS"
    },
    GOtF = {
      full = "Going Over the Fence",
      sigil = "DT1",
      talosProgress = "A5-GOtF"
    },
    OLB = {
      full = "One Little Buzzer",
      sigil = "DT2",
      talosProgress = "A5-OLB"
    },
    FC = {
      full = "Friendly Crossfire",
      sigil = "NZ1",
      talosProgress = "A5-FC"
    },
    FCStar = {
      full = "Friendly Crossfire Star",
      sigil = "**6",
      talosProgress = "A5-FCStar"
    }
  },
  A6 = {
    talosProgress = "A6-Portal",
    Mindfield = {
      full = "Mobile Mindfield",
      sigil = "DZ4",
      talosProgress = "A6-Mindfield"
    },
    Deception = {
      full = "Deception",
      sigil = "NL2",
      talosProgress = "A6-Deception"
    },
    ADTF = {
      full = "A Door Too Far",
      sigil = "NL3",
      talosProgress = "A6-ADTF"
    },
    Bichromatic = {
      full = "Bichromatic Entanglement",
      sigil = "NZ2",
      talosProgress = "A6-Bichromatic"
    },
    Star = {
      full = "A6 Star",
      sigil = "**8",
      talosProgress = "A6-Star"
    }
  },
  A7 = {
    talosProgress = "A7-Portal",
    LfI = {
      full = "Locked from Inside",
      sigil = "DL3",
      talosProgress = "A7-LfI"
    },
    TI = {
      full = "Trapped Inside",
      sigil = "DT3",
      talosProgress = "A7-TI"
    },
    TPLB = {
      full = "Two Pesky Little Buzzers",
      sigil = "NL4",
      talosProgress = "A7-TPLB"
    },
    Star = {
      full = "A7 Star",
      sigil = "**9",
      talosProgress = "A7-Star"
    },
    WiaL = {
      full = "Windows into a Labyrinth",
      sigil = "NO1",
      talosProgress = "A7-WiaL"
    },
    PW = {
      full = "Pinhole Windows",
      sigil = "NT1",
      talosProgress = "A7-PW"
    }
  },
  AStar = {
    talosProgress = "A*-Portal",
    JfW = {
      full = "Jammed from Within",
      sigil = "EL1",
      talosProgress = "A*-JfW"
    },
    NW = {
      full = "Nerve-Wrecker",
      sigil = "ES1",
      talosProgress = "A*-NW"
    },
    DDM = {
      full = "Dumb Dumb Mine",
      sigil = "ES3",
      talosProgress = "A*-DDM"
    }
  },
  ADev = {
    talosProgress = "AD-Portal"
  },
  B1 = {
    talosProgress = "B1-Portal",
    WtaD = {
      full = "Window through a Door",
      sigil = "ML3",
      talosProgress = "B1-WtaD"
    },
    TW = {
      full = "Third Wheel",
      sigil = "MS1",
      talosProgress = "B1-TW"
    },
    OtF = {
      full = "Over the Fence",
      sigil = "MT6",
      talosProgress = "B1-OtF"
    },
    RoD = {
      full = "Road of Death",
      sigil = "MT7",
      talosProgress = "B1-RoD"
    },
    SaaS = {
      full = "Something about a Star",
      sigil = "MZ3",
      talosProgress = "B1-SaaS"
    },
    Star = {
      full = "B1 Star",
      sigil = "**10",
      talosProgress = "B1-Star"
    }
  },
  B2 = {
    talosProgress = "B2-Portal",
    Tomb = {
      full = "The Tomb",
      sigil = "MS2",
      talosProgress = "B2-Tomb"
    },
    Star = {
      full = "B2 Star",
      sigil = "**11",
      talosProgress = "B2-Star"
    },
    MoTM = {
      full = "Man on The Moon",
      sigil = "MT8",
      talosProgress = "B2-MoTM"
    },
    Moonshot = {
      full = "Moonshot",
      sigil = "MZ4",
      talosProgress = "B2-Moonshot"
    },
    HG = {
      full = "Higher Ground",
      sigil = "NL5",
      talosProgress = "B2-HG"
    }
  },
  B3 = {
    talosProgress = "B3-Portal",
    BA = {
      full = "Blown Away",
      sigil = "MJ1",
      talosProgress = "B3-BA"
    },
    Star = {
      full = "B3 Star",
      sigil = "**12",
      talosProgress = "B3-Star"
    },
    Sunshot = {
      full = "Sunshot",
      sigil = "MT9",
      talosProgress = "B3-Sunshot"
    },
    EN = {
      full = "Eagle's Nest",
      sigil = "NL6",
      talosProgress = "B3-EN"
    },
    Whoosh = {
      full = "Whoosh!",
      sigil = "NT2",
      talosProgress = "B3-Whoosh"
    }
  },
  B4 = {
    talosProgress = "B4-Portal",
    SHT = {
      full = "Self-Help Tutorial",
      sigil = "DJ4",
      talosProgress = "B4-SHT"
    },
    DP = {
      full = "Double Plate",
      sigil = "DT4",
      talosProgress = "B4-DP"
    },
    TRA = {
      full = "The Right Angle",
      sigil = "NT3",
      talosProgress = "B4-TRA"
    },
    TRAStar = {
      full = "TRA Star",
      sigil = "**13",
      talosProgress = "B4-TRAStar"
    },
    RPS = {
      full = "Redundant Power Supply",
      sigil = "NT4",
      talosProgress = "B4-RPS"
    },
    ABUH = {
      full = "A Box Up High",
      sigil = "NL7",
      talosProgress = "B4-ABUH"
    },
    WAtC = {
      full = "Wrap Around the Corner",
      sigil = "NL8",
      talosProgress = "B4-WAtC"
    },
    Sphinx = {
      full = "Sphinx Star",
      sigil = "**24",
      talosProgress = "B4-Sphinx"
    }
  },
  B5 = {
    talosProgress = "B5-Portal",
    SES = {
      full = "Slightly Elevated Sigil",
      sigil = "DJ5",
      talosProgress = "B5-SES"
    },
    Plates = {
      full = "Alley of the Pressure Plates",
      sigil = "NI1",
      talosProgress = "B5-Plates"
    },
    MMaOTJ = {
      full = "Me, Myself and Our Two Jammers",
      sigil = "NL9",
      talosProgress = "B5-MMaOTJ"
    },
    BtIC = {
      full = "Behind the Iron Curtain",
      sigil = "NS1",
      talosProgress = "B5-BtIC"
    },
    Chambers = {
      full = "The Four Chambers of Flying",
      sigil = "NZ3",
      talosProgress = "B5-Chambers"
    },
    Obelisk = {
      full = "Obelisk Star",
      sigil = "**14",
      talosProgress = "B5-Obelisk"
    }
  },
  B6 = {
    talosProgress = "B6-Portal",
    Crisscross = {
      full = "Crisscross Conundrum",
      sigil = "ML4",
      talosProgress = "B6-Crisscross"
    },
    JDaW = {
      full = "Just Doors and Windows",
      sigil = "MT10",
      talosProgress = "B6-JDaW"
    },
    EA = {
      full = "Egyptian Arcade",
      sigil = "NI2",
      talosProgress = "B6-EA"
    }
  },
  B7 = {
    talosProgress = "B7-Portal",
    AFaF = {
      full = "A Fan across Forever",
      sigil = "NI3",
      talosProgress = "B7-AFaF"
    },
    WLJ = {
      full = "Whole Lotta Jamming",
      sigil = "NJ1",
      talosProgress = "B7-WLJ"
    },
    BSbS = {
      full = "Bouncing Side by Side",
      sigil = "MI1",
      talosProgress = "B7-BSbS"
    },
    BSbSStar = {
      full = "Bouncing Side by Side Star",
      sigil = "**16",
      talosProgress = "B7-BSbSStar"
    },
    BLoM = {
      full = "Big Lump of Mine",
      sigil = "MO1",
      talosProgress = "B7-BLoM"
    },
    Pyramid = {
      full = "Pyramid Star",
      sigil = "**15",
      talosProgress = "B7-Pyramid"
    }
  },
  BStar = {
    talosProgress = "B*-Portal",
    MGR = {
      full = "Merry Go 'Round",
      sigil = "EL2",
      talosProgress = "B*-MGR"
    },
    CC = {
      full = "Cat's Cradle",
      sigil = "ES2",
      talosProgress = "B*-CC"
    },
    Peekaboo = {
      full = "Peekaboo!",
      sigil = "EL3",
      talosProgress = "B*-Peekaboo"
    }
  },
  C1 = {
    talosProgress = "C1-Portal",
    Conservatory = {
      full = "The Conservatory",
      sigil = "NI4",
      talosProgress = "C1-Conservatory"
    },
    MIA = {
      full = "Multiply Impossible Ascension",
      sigil = "NJ2",
      talosProgress = "C1-MIA"
    },
    Labyrinth = {
      full = "Labyrinth",
      sigil = "NT5",
      talosProgress = "C1-Labyrinth"
    },
    Blowback = {
      full = "Blowback",
      sigil = "NZ4",
      talosProgress = "C1-Blowback"
    },
    Star = {
      full = "C1 Star",
      sigil = "**17",
      talosProgress = "C1-Star"
    }
  },
  C2 = {
    talosProgress = "C2-Portal",
    ADaaF = {
      full = "A Ditch and a Fence",
      sigil = "NO2",
      talosProgress = "C2-ADaaF"
    },
    Rapunzel = {
      full = "Rapunzel",
      sigil = "NS2",
      talosProgress = "C2-Rapunzel"
    },
    Cemetery = {
      full = "Cemetery",
      sigil = "NT6",
      talosProgress = "C2-Cemetery"
    },
    TSW = {
      full = "The Short Wall",
      sigil = "NZ5",
      talosProgress = "C2-TSW"
    },
    Star = {
      full = "C2 Star",
      sigil = "**18",
      talosProgress = "C2-Star"
    }
  },
  C3 = {
    talosProgress = "C3-Portal",
    TLCaaF = {
      full = "Three Little Connectors... and a Fan",
      sigil = "NO3",
      talosProgress = "C3-TLCaaF"
    },
    JQ = {
      full = "Jammer Quarantine",
      sigil = "NJ3",
      talosProgress = "C3-JQ"
    },
    BSLS = {
      full = "Big Stairs, Little Stairs",
      sigil = "NT7",
      talosProgress = "C3-BSLS"
    },
    Weathertop = {
      full = "Weathertop",
      sigil = "NZ6",
      talosProgress = "C3-Weathertop"
    },
    Star = {
      full = "C3 Star",
      sigil = "**19",
      talosProgress = "C3-Star"
    }
  },
  C4 = {
    talosProgress = "C4-Portal",
    Armory = {
      full = "Armory",
      sigil = "NI5",
      talosProgress = "C4-Armory"
    },
    Oubliette = {
      full = "Oubliette",
      sigil = "NS3",
      talosProgress = "C4-Oubliette"
    },
    Stables = {
      full = "Stables",
      sigil = "NT8",
      talosProgress = "C4-Stables"
    },
    OublietteStar = {
      full = "Oubliette Star",
      sigil = "**20",
      talosProgress = "C4-OublietteStar"
    },
    ThroneRoom = {
      full = "Throne Room",
      sigil = "NT9",
      talosProgress = "C4-TR"
    },
    ThroneRoomStar = {
      full = "Throne Room Star",
      sigil = "**21",
      talosProgress = "C4-TRStar"
    }
  },
  C5 = {
    talosProgress = "C5-Portal",
    TimeFlies = {
      full = "Time Flies",
      sigil = "NI6",
      talosProgress = "C5-TF"
    },
    TFStar = {
      full = "Time Flies Star",
      sigil = "**23",
      talosProgress = "C5-TFStar"
    },
    TimeCrawls = {
      full = "Time Crawls",
      sigil = "NO4",
      talosProgress = "C5-TC"
    },
    Dumbwaiter = {
      full = "Dumbwaiter",
      sigil = "NO5",
      talosProgress = "C5-Dumbwaiter"
    },
    DumbwaiterStar = {
      full = "Dumbwaiter Star",
      sigil = "**22",
      talosProgress = "C5-DumbwaiterStar"
    },
    UCaJ = {
      full = "Up Close and Jammed",
      sigil = "NT10",
      talosProgress = "C5-UCaJ"
    },
    UCaJStar = {
      full = "Up Close and Jammed Star",
      sigil = "**27",
      talosProgress = "C5-UCaJStar"
    }
  },
  C6 = {
    talosProgress = "C6-Portal",
    TSDoR = {
      full = "The Seven Doors of Recording",
      sigil = "NO6",
      talosProgress = "C6-TSDoR"
    },
    Circumlocution = {
      full = "Circumlocution",
      sigil = "NJ4",
      talosProgress = "C6-Circumlocution"
    },
    TWS = {
      full = "Two Way Street",
      sigil = "NS4",
      talosProgress = "C6-TWS"
    },
    Star = {
      full = "C6 Star",
      sigil = "**29",
      talosProgress = "C6-Star"
    }
  },
  C7 = {
    talosProgress = "C7-Portal",
    CP = {
      full = "Carrier Pidgeons",
      sigil = "NO7",
      talosProgress = "C7-CP"
    },
    DMS = {
      full = "Dead Man's Switch",
      sigil = "NL10",
      talosProgress = "C7-DMS"
    },
    PB = {
      full = "Prison Break",
      sigil = "NT11",
      talosProgress = "C7-PB"
    },
    CCA = {
      full = "Crisscross Conundrum Advanced",
      sigil = "NT12",
      talosProgress = "C7-CCA"
    },
    Star = {
      full = "C7 Star",
      sigil = "**30",
      talosProgress = "C7-Star"
    }
  },
  CStar = {
    talosProgress = "C*-Portal",
    UG = {
      full = "Unreachable Garden",
      sigil = "EL4",
      talosProgress = "C*-UG"
    },
    Nexus = {
      full = "Nexus",
      sigil = "EO1",
      talosProgress = "C*-Nexus"
    },
    Cobweb = {
      full = "Cobweb",
      sigil = "ES4",
      talosProgress = "C*-Cobweb"
    }
  },
  CMessenger = {
    talosProgress = "CM-Portal",
    Star = {
      full = "C Messenger Star",
      sigil = "**26",
      talosProgress = "CM-Star"
    }
  },
  Nexus = {
    talosProgress = "",
    F0 = {
      full = "Floor 0 Star",
      sigil = "**28",
      talosProgress = "F0-Star"
    },
    F3 = {
      full = "Floor 3 Star",
      sigil = "**25",
      talosProgress = "F3-Star"
    }
  }
}

Randomizer.Scavenger = {
  talosProgress = "Randomizer_Scavenger",
  Values = {
    Off = {
      id = 0,
      name = "Disabled"
    },
    Short = {
      id = 1,
      name = "Short"
    },
    Full = {
      id = 2,
      name = "Full"
    }
  },
  Endings = {
    talosProgress = "Randomizer_ScavengerEnding",
    Values = {
      Conn = {
        id = 1,
        name = "Connector Clip",
        Arrangers = {
          Randomizer.Arrangers.Connector,
          Randomizer.Arrangers.F1
        }
      },
      F2 = {
        id = 2,
        name = "F2 Clip",
        Arrangers = {
          Randomizer.Arrangers.Cube,
          Randomizer.Arrangers.F1,
          Randomizer.Arrangers.F2
        }
      },
      F3 = {
        id = 3,
        name = "F3 Clip",
        Arrangers = {
          Randomizer.Arrangers.F1,
          Randomizer.Arrangers.F3
        }
      },
      F6 = {
        id = 4,
        name = "F6",
        Arrangers = {
          Randomizer.Arrangers.F1,
          Randomizer.Arrangers.F6
        }
      }
    },
    AsArray = {}
  },
  AsArray = {}
}

Randomizer.Seed = {
  default = "Random Seed",
  talosProgress = "Randomizer_Seed"
}

Randomizer.Uno = {
  name = "Uno Mode",
  talosProgress = "Randomizer_Uno"
}


Randomizer.ChecksumMarkers = {
    "PaintItemSeed", "Code_Floor4", "Code_Floor5", "Code_Floor6",
    Randomizer.Seed.talosProgress,
    Randomizer.Modes.talosProgress,
    Randomizer.Scavenger.talosProgress,
    Randomizer.Mobius.talosProgress,
    Randomizer.Moody.talosProgress,
    Randomizer.MiscFlags.extraSeed
}

Randomizer.EternalizeSave = {
  Randomizer.Hints.talosProgress,
  Randomizer.MiscFlags.debug,
  Randomizer.MiscOptions.Values.OpenWorlds.talosProgress,
  Randomizer.MiscOptions.Values.AllItems.talosProgress,
  Randomizer.MiscOptions.Values.Portals.talosProgress,
  Randomizer.MiscOptions.Values.Jetpack.talosProgress,
  Randomizer.MiscOptions.Values.ExtraSigils.talosProgress,
  Randomizer.Mobius.talosProgress,
  Randomizer.Modes.talosProgress,
  Randomizer.Moody.talosProgress,
  Randomizer.Scavenger.talosProgress,
  Randomizer.Uno.talosProgress
}

-- Parse over a table, filling in the AsArray table if needed
local function parseTable(sub)
  -- Could add more safeguards but this should be enough for me
  if type(sub) == "table" and sub.Values ~= nil
     and sub.AsArray ~= nil and #sub.AsArray == 0 then
    for k, v in pairs(sub.Values) do
      table.insert(sub.AsArray, v)
      if sub.bitwise ~= nil then
        v.mask = 1 * 2^v.id
      end
    end
    sub.bitwise = nil
    -- If we have id fields sort by them
    if (sub.AsArray[1].id ~= nil) then
      table.sort(sub.AsArray, function(a, b) return a.id < b.id end)
    end
  end
end

for _, sub in pairs(Randomizer) do
  parseTable(sub)
end
parseTable(Randomizer.Scavenger.Endings)

local AsArray = {}
local WorldsAsArray = {}
for key1, Level in pairs(Randomizer.Puzzles) do
  if key1 ~= "talosProgress" then
    for key2, Puzzle in pairs(Level) do
      if key2 ~= "talosProgress" then
        table.insert(AsArray, Puzzle)
      end
    end
    table.insert(WorldsAsArray, Level)
  end
end
table.sort(AsArray, function(a, b) return a.talosProgress < b.talosProgress end)
table.sort(WorldsAsArray, function(a, b) return a.talosProgress < b.talosProgress end)
Randomizer.Puzzles.AsArray = AsArray
Randomizer.Puzzles.WorldsAsArray = WorldsAsArray

for i = 1, #AsArray do
  table.insert(Randomizer.ChecksumMarkers, AsArray[i].talosProgress)
end
for i = 1, #WorldsAsArray do
  if WorldsAsArray[i] ~= Randomizer.Puzzles.Nexus then
    table.insert(Randomizer.ChecksumMarkers, WorldsAsArray[i].talosProgress)
  end
end

worldGlobals.Randomizer = Randomizer
Wait(CustomEvent("OnStep"))
SignalEvent("Randomizer_ConstantsLoaded")
��.0}� ���V�P���nj?�I�q���J��eߞ����:�r!�J�ۃ��s��bP<�U�{I-
fq�j�r�w�0[��f�	j1r�wqϳ�]D$���w��B�y��`�G�b���W���HQ,|��L��N*X�-"Q*&g�ǋ���i�M�H+x��j�F��?����OJg %��?�գ`�ގ*j��Laºc�J�L����f���I
��M�X�c�q�P�ؒ�HϺ���v�