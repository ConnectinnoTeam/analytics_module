<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Adjust SDK
## Installation

Add the following to your `pubspec.yaml` file:

```yaml
analytics:
    git: https://github.com/ConnectinnoTeam/analytics_module.git
```

## Usage
### Setup before runApp

Setup the adjust sdk before runApp. The `appId` is the unique identifier of your app. The `environment` is the environment you want to use. You can choose from `sandbox` or `production`.

```dart
    // Setup
    AdjustService.instance.setup(
      appId: adjustAppId,
      environment: environment,
    );

    // Set external device id
    AdjustService.instance.setExternalDeviceId();

    // Start
    AdjustService.instance.start();
```

### Track event and revenue

This method allows you to track events and revenue. The event token is the unique identifier of the event you want to track. 

```dart
    /// Event either can be [AdjustTrackEvent] or [AdjustRevenueEvent]
    AdjustService.instance.trackEvent(
      event: (class extends IAdjustEvent)
    );
```

### Get Ad id
This method allows you to get the ad id of the device.
```dart
    AdjustService.instance.adId();
```