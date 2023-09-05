## Firebase Backend Setup 
### this will cover how to connect our firbase backend to the codebase
For flutter fire initiaizaiton -> [click here](https://firebase.flutter.dev/docs/overview)

## Installation
`CAUTION -> Are you migrating your existing project to these new plugins? Please start with the migration guide.`

Before any Firebase services can be used, you must first install the firebase_core plugin, which is responsible for connecting your application to Firebase.
Install the plugin by running the following command from the project root:
```bash
flutter pub add firebase_core
```

from CLI -> 
```bash
# Install the CLI if not already done so
dart pub global activate flutterfire_cli

# Run the `configure` command, select a Firebase project and platforms
flutterfire configure
```

before the `flutterfire config`we need to tell where do we have this package. For that we will add it to our `ENV`path so we can access it out...

## What is Firebase CLI ? 
- this CLI helps us to interact with our Firebase directly from our terminal 
- We dont have to do this manually now (in Firebase), this integrates it automatically
- we need to `install firebase-cli` for that -> [click here](https://firebase.google.com/docs/cli#install-cli-mac-linux) OR (for Mac) -> 
```bash
curl -sL firebase.tools | upgrade=true bash
```
- we wil have **windows download** too there (I prefer npm one) 

### After Installing Firebase CLI 

- Log into Firebase using your Google account by running the following command:
```bash
firebase login
```
This command connects your local machine to Firebase and grants you access to your Firebase projects.

we can even logout later on if we want to as -> 
```bash
firebase logout
```

- Test that the CLI is properly installed and accessing your account by listing your Firebase projects. Run the following command:
```bash
firebase projects:list
```
this will display us a list of our Fiebase listed projects as -> 

```bash 
E:\Project\The-Flutter-Hub\inotes>firebase projects:list
√ Preparing the list of your Firebase projects
┌──────────────────────┬──────────────────────┬────────────────┬──────────────────────┐
│ Project Display Name │ Project ID           │ Project Number │ Resource Location ID │
├──────────────────────┼──────────────────────┼────────────────┼──────────────────────┤
│ My First Project     │ nimble-cortex-382904 │ 308651226807   │ [Not specified]      │
└──────────────────────┴──────────────────────┴────────────────┴──────────────────────┘

1 project(s) total.
```

## Configuring a Firebase Project 

we will configure a firebase Project with `flutterfire` which we have installed and the `firebase CLI`. by (this will automatically configure a firebase project)-> 
```bash
flutterfire configure
```
and the result over this integration -> 
```bash
E:\Project\The-Flutter-Hub\inotes>flutterfire configure
i Found 2 Firebase projects.
✔ Select a Firebase project to configure your Flutter application with · inotes-hsm (inotes)
✔ Which platforms should your configuration support (use arrow keys & space to select)? · android, ios, macos, web
i Firebase android app in.hsmmakingstuff.inotes is not registered on Firebase project inotes-hsm.
i Registered a new Firebase android app on Firebase project inotes-hsm.
i Firebase ios app in.hsmmakingstuff.inotes is not registered on Firebase project inotes-hsm.
i Registered a new Firebase ios app on Firebase project inotes-hsm.
i Firebase macos app in.hsmmakingstuff.inotes.RunnerTests is not registered on Firebase project inotes-hsm.
i Registered a new Firebase macos app on Firebase project inotes-hsm.
i Firebase web app inotes (web) is not registered on Firebase project inotes-hsm.
i Registered a new Firebase web app on Firebase project inotes-hsm.

Firebase configuration file lib\firebase_options.dart generated successfully with the following Firebase apps:

Platform  Firebase App Id
web       1:800438050049:web:d9f5634886f9512675cf00
android   1:800438050049:android:d739cfc9b38c153d75cf00
ios       1:800438050049:ios:22d846be04ec6a5375cf00
macos     1:800438050049:ios:6f0fd08ada335f1e75cf00

Learn more about using this file and next steps from the documentation:
 > https://firebase.google.com/docs/flutter/setup
```


