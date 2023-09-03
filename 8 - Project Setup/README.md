## Setting Up our Poject Environment 

Looking over the basic of the Dart Language, its TIME to set foott into the dungeon of Flutter framework & start working on Projects. I believe so I'll be creating a similar application to note-haven here, but in a new framework all together from scratch which will be a lot more scallable than the React Project I have done in the past. 

Without, further await... **_Let's GO!!_**

## Set Project up from terminal 
- lets create a new flutter project over the domain and the appname 

use the below snippet to start generating one-> 
```bash 
flutter create --org xxx.domain appname
```
example -> 

```bash 
flutter create --org in.hsmmakingstuff inotes
```

#### wanna know more over the dependency you are using ? -> [click here](https://pub.dev/)

Further more we added up these dependencies over the project -> 
- firebase_core
- firebase_auth
- firebase_analytics -> looking over more inside in firebase console
- cloud_firestore -> store logged in user notes in the backend

This will make our connection with **firebase** (serverless backend we will use for the project) 

as to how we get these dependencies over the project -> 
```bash
flutter pub add <dependency_name>
```

for developer settings of windows -> 
```bash
start ms-settings:developers
```

Our `pubspec.yaml` file after these dependencies will look like this -> 
```yaml
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  firebase_core: ^2.15.1
  firebase_auth: ^4.9.0
  firebase_analytics: ^10.4.5
  cloud_firestore: ^4.9.1
```

