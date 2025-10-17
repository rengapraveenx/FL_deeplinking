# Deep Linking Implementation Plan

This plan outlines the steps to implement deep linking for the Flutter application.

## Phase 1: Platform Configuration

### Android
- [x] **Modify `AndroidManifest.xml`**: Add an `<intent-filter>` to the main activity in `android/app/src/main/AndroidManifest.xml`.
- [x] **Define Scheme and Host**: The intent filter will have a custom scheme (e.g., `mydeeplink`) and a host (e.g., `app`). This will allow the app to respond to URLs like `mydeeplink://app`.
- [x] **Add `meta-data` for App Links**: For a better user experience on Android 12+, add a `meta-data` tag for App Links support.

### iOS
- [x] **Modify `Info.plist`**: Add a `CFBundleURLTypes` entry to `ios/Runner/Info.plist`.
- [x] **Define URL Scheme**: The entry will define a custom URL scheme (e.g., `mydeeplink`) that the app will respond to.

## Phase 2: Flutter Implementation

### Routing
- [x] **Choose a Routing Package**: We will use a routing package to handle navigation. `go_router` is a good choice for this.
- [x] **Add Dependency**: Add the chosen routing package to `pubspec.yaml`.
- [x] **Configure Router**: Set up the router in `lib/main.dart` to define the app's routes.
- [x] **Define Routes**: Create routes for the home screen and a details screen (e.g., `/` for home, `/details/:id` for details).

### Screen Creation
- [x] **Create Home Screen**: A simple screen with a button to navigate to the details screen.
- [x] **Create Details Screen**: A screen that takes an `id` as a parameter and displays it. This will be the target for our deep links.

### Deep Link Handling
- [ ] **Integrate with Router**: Configure the router to listen for incoming deep links.
- [ ] **Parse Deep Links**: The router will parse the incoming URI and navigate to the appropriate route. For example, `mydeeplink://app/details/123` should navigate to the details screen with `id=123`.

## Phase 3: Testing

### Android
- [ ] **Test with ADB**: Use the Android Debug Bridge (`adb`) to send a deep link intent to the app and verify that it opens the correct screen.
  ```bash
  adb shell am start -a android.intent.action.VIEW -d "mydeeplink://app/details/123" com.example.deeplinking
  ```

### iOS
- [ ] **Test with `xcrun`**: Use `xcrun` to simulate a deep link on the iOS simulator.
  ```bash
  xcrun simctl openurl booted "mydeeplink://app/details/123"
  ```

## Phase 4: Documentation
- [ ] **Update `README.md`**: Document the deep linking feature, including the URL schemes and how to test it.
- [ ] **Update `gemini.md`**: Mark the checklist items as complete.
