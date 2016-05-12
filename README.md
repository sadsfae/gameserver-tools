gameserver-tools
===================

This is a collection of management tools for deploying, running and managing open source gameservers on Linux.

**What does it do?**
   - Ansible-driven installation of games on Linux host (WIP)
   - Generation of startup scripts (WIP)
   - Automated game statistics generation into HTML/PNG (COMPLETE)
      - Requires qstat (quakestat), html2ps, imagemagick convert
 
**Games Supported**

   - Urban Terror 4.2.023
      * http://urbanterror.info
      * https://en.wikipedia.org/wiki/Urban_Terror
      * http://hobo.house/2015/10/03/play-urban-terror/

   - Enemy Territory 2.60b
      * http://www.splashdamage.com/content/wolfenstein-enemy-territory-barracks
      * https://en.wikipedia.org/wiki/Wolfenstein:_Enemy_Territory
      * http://hobo.house/2015/09/30/play-enemy-territory/

   - Enemy Territory:Legacy 2.74
      * http://www.etlegacy.com
      * https://github.com/etlegacy/etlegacy

**Contents**

   - install-$game-server.py
      - Installs the respective game server type with CLI options
   - $game/qstat-$game.sh
      - Parses game statistics and generates HTML and PNG output
      - Examples:
         - http://funcamp.net/w/ut.html 
         - http://funcamp.net/w/ut.png
         - http://funcamp.net/w/et.html
         - http://funcamp.net/w/et.html
   - $game/config-generate-$game.sh
      - Generates a usable configuration file.
   - $game/startup-generate-$game.sh
      - Generates a usable gameserver startup script
   - $game/$game-start-server.example.sh
      - Example gameserver startup script

```
├── enemyterritory
│   ├── config-generate-et.sh
│   ├── et-start-server.example.sh
│   ├── qstat-enemyterritory.sh
│   └── startup-generate-et.sh
├── README.md
└── urbanterror
    ├── config-generate-ut.sh
    ├── qstat-urbanterror.sh
    ├── startup-generate-ut.sh
    └── ut-start-server.example.sh
```
