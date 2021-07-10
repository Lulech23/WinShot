# 📸 WinShot
Turn the Windows key into a global "Share" button for PC games!

## About
Modern PC gamers often own libraries spread across multiple launchers, each with their own screenshot and recording functionality (if any at all!). But did you know? Windows 10 provides a universal solution to this problem! Since 2019, the Xbox Game Bar has provided built-in capture controls for any content on your screen. However, accessing them through the overlay is not always timely enough to preserve the moment. We need shortcuts!

_No, not Win + Alt + PrtScrn_. I mean shorter shortcuts!

WinShot transforms the Windows key on your keyboard into a one-touch solution for capturing screenshots and video clips via the Xbox Game Bar. Long-press to capture a screenshot, or double-press to start/stop recording video in the active window. And don't worry: a quick single-press will still activate the Start menu like always.

## How to Use
1. Download the latest compiled binary from [releases](https://github.com/Lulech23/WinShot/releases/latest), or compile one yourself with [AutoHotKey](https://www.autohotkey.com/)
2. Run the application. It will remain in your systray until exited. If you want, you can add a shortcut to it in `%AppData%\Microsoft\Windows\Start Menu\Programs\Startup` so it's always ready when you reboot your PC.
* Long-press Win key to take a screenshot
* Double-press Win key to start/stop recording video
* Single-press Win key for normal functionality

All functionality is handled by the Xbox Game Bar. Configure in **Windows Settings > Gaming > Xbox Game Bar** for best results (leave shortcuts as their defaults).

## Known Issues
* **Windows Defender falsely identifies WinShot.exe as a virus**
  * This is _extremely_ common for remapper scripts. After all, we're altering the behavior of your keyboard. But that's you're here for, no? 
  * First, take a look at the source code to see for yourself whether anything nefarious is going on. Once you're satisfied, add an exception to Windows Defender to allow WinShot through. You may have to re-download if the original file was forcibly removed.
* **Regular Windows key shortcuts are inaccessible while WinShot is active**
  * Workaround: When not playing games, right-click the taskbar icon and check "Suspend Hotkeys"
