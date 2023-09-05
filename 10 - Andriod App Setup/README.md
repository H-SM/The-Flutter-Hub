## Android App Setup 
### this will cover how to connect our andriod phone to the codebase and see the live result
- for this we install -> '[scrcpy](https://github.com/Genymobile/scrcpy)'
- this will mirror my andriod screen on desktop (this is much faster) 
- before this, need need to install `ADB(Android Debug Bridge)` -> send command from terminal to my device (my phone over where we have deployed the project) 

we download ADB by -> 
```bash
brew install --cask android-platform-tools
```

the above bash is for our **MacOS** 

for **WindowsOS** ->
- download ADB 
- smartphone developer debugging settings enabled 
- now, connect the smartphone and `allow` debugging from your desktop
- loook over the avaliable adb devices -> 
```bash 
adb devices 
```
- your smartphone will be visible in the list after this 
- download latest `scrcpy` from the above directory 
- run `open_a_terminal_here.bat` and this will open a terminal 
- write the below command, this will connect our desktop to ADB device
```bash
scrcpy 
```
- having the preview to our smartphone now, open code editor
- make the output device to your smartphone 
- run your source code and Enjoy your application debugging in your smartphone
- also look over for SDK version and MultiDex