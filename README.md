# configs

My personal configs for stuff like QMK, Powershell and VSCode

Contents:

- `vscode` -> settings, keybindings and tasks.json
    - settings has a lot of vim keybindings
    - keybindings might depend a lot on the using a properly configured QMK keyboard
    - tasks.json just has CMake build command
    - You should symlink this to the correct place
    - TODO: keybindings could use F13-F24 so I can use AHK to make interesting shortcuts
- `qmk` -> config.qmk.fm (json) for tg4x, jj40 and dz60 
    - Uses capslock, leftspace and rightshift for mod layers
    - Can also use enter key for modifer layer
    - TODO: Integrate with AutoHotKey to make AltTab behaviour better?
- `ahk` -> 
    - capslockmod.ahk simulates the capslock layer of my qmk configs for my laptop keyboard
    - snippets.ahk (empty) for global autoexpanding snippets
    - TODO: even more layers
    - TODO: figure out how to emulate LT()