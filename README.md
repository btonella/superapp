# SuperApp

[![Generic badge](https://img.shields.io/badge/STATUS-DONE-3BB143.svg)](https://shields.io/)

A new Super App Project Template using Flutter, Multi-Repo and Clean Dart

This project is using only one repository just to make it easy the use of the template, when using create one repository for each folder.

### Flutter version

```sh
Flutter 3.22.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b0850beeb2 (12 days ago) • 2024-07-16 21:43:41 -0700
Engine • revision 235db911ba
Tools • Dart 3.4.4 • DevTools 2.34.3
```

### Commits template

To use the commits template run:

```sh
git config commit.template .gitmessage.conf
```

### How to run the project

- Create one file on the `/superapp/base_app/android` with the name "key.properties", with the content:

  ```
  storePassword=
  keyPassword=
  keyAlias=key
  storeFile=../private_key.pepk
  ```

### How to create a new micro app

- Duplicate the "app_micro_login" folder adding it to another repository and updating the name inside of it
- Add the new micro app on the `/superapp/base_app/pubspec.yaml` "dependencies" bellow the "app_micro_login"
- Add the micro app on the "get microApps" on the `/superapp/base_app/lib/core/app_base_main.dart` bellow the `const MicroLogin(),`
- Done.

### Architecture (Clean Dart):

Documentation: <https://github.com/Flutterando/Clean-Dart/>

![image](https://github.com/Flutterando/Clean-Dart/raw/master/imgs/img1.png)
![image](https://github.com/Flutterando/Clean-Dart/raw/master/imgs/img2.png)
