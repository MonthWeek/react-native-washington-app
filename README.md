
# react-native-washington-app

## Getting started

`$ npm install react-native-washington-app --save`

### Mostly automatic installation

`$ react-native link react-native-washington-app`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-washington-app` and add `RNWashingtonApp.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNWashingtonApp.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.washface.washingtonApp.RNWashingtonAppPackage;` to the imports at the top of the file
  - Add `new RNWashingtonAppPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-washington-app'
  	project(':react-native-washington-app').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-washington-app/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-washington-app')
  	```


## Usage
```javascript
import RNWashingtonApp from 'react-native-washington-app';

// TODO: What to do with the module?
RNWashingtonApp;
```
  