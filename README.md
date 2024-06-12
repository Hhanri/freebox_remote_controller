# Introduction
**freebox_remote_controller** is a remote controller application for Freebox TV and works over the network.

# Getting Started
1. clone the project
`git clone https://github.com/Hhanri/freebox_remote_controller`
2. install pub packages
`flutter pub get`
3. run the app
`flutter run`

# Configuration

1. To use the application you will need to provide your `network remote controller code`.

You can find your code in your `Freebox TV` > `Menu` > `Settings` > `Freebox Information` > `network remote controller code`.

2. Make sure your phone is connected to the local Freebox network

3. Inside the application, click on the settings button and write down your `network remote controller code` and then press `validate`.

4. Voilà ! You can now use the application as your Freebox remote controller !

# Install on your real device
Use the `flutter build` command to create the final output for your device.

examples:
- android: `flutter build apk`
- iOS `flutter build ios`
- macOS `flutter build macos`
