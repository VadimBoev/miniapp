![alt text](https://raw.githubusercontent.com/Kronka/miniapp/main/miniapp_logo.png)

# MiniApp
Stop using Java when creating your Android app! Create an application entirely in C++

Example just app for Android in C++ with ImGUI (how graphic wrapper)

## Features  
- OpenGL v3 is used  
- Added icons  
- ImGUI v1.83  
  
## Build  
  
We need:  
* Visual Studio 2019  
* Installed from "Visual Studio Installer":
    * Development of mobile applications in C++ (a set of tools)  
    * OpenJDK (I don't remember if it is included in the set of tools, but you need to install it)  
    * Connecting usb-devices  
    * Installing the SDK for Android (API Level 30)  
    * Installing the SDK for Android (Level API 25, local installation for the development of mobile applications in C++)  
    * Addition: you can install the emulator, but I could not start it, apparently because of AMD Ryzen. I use my phone, it's convenient.  
* Also, for convenient logging of Android (logcat in VS), I advise you to install this: https://marketplace.visualstudio.com/items?itemName=LancelotChen.AndroidLogcatOutput  
  
Open `miniapp.sln` and compile
  
## How do I change the icons?

Make png icon in size 192x192 used Photoshop, Paint and other.  
Load you icon in https://easyappicon.com/ and selected *adaptive icon*
You get zip archive and in folder Android there will be folders with icons.  
  
## Special thanks  
  
- **graysuit**: he helped me figure out how to connect Android to VS and much more  
  
## Screenshot  
![alt text](https://raw.githubusercontent.com/Kronka/miniapp/main/first_launch_imgui.png)
