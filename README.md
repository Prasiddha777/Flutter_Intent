# intenet_flutters

A new Flutter project.

## Flutter Intent

The intent in Android is the "payload" for the communication between and within apps. This plugin passes the Intent, that "started" the Activity to the flutter environment. It also passes any "new Intents" that are received (via Activity.onNewIntent) while the Activity is already "started".

If the Intent was "started" via startActivityForResult, then this plugin also sends additional information (package name and app signature) about the "calling" Android Component and can send "result" back (via Activity.setResult) to it.

*Any contribution, idea, criticism, or feedback is welcomed*

<img src="https://raw.githubusercontent.com/Prasiddha777/Flutter_Intent/main/assets/bg.png" alt="bg" width="700" height="600">

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
