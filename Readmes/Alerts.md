# Alerts

`SwiftUIKit` makes it easier to work with alerts.


## AlertContext

The `AlertContext` class embeds the `isPresented` binding logic and can be used to present any `Alert` or `AlertPresentable`,  which means that you can use it for a wide range of alerts and custom types within your apps.

You could for instance implement a global set of alerts in an `AppAlerts` enum or screen-specific screens in e.g. a `SettingsAlert` enum, and use the same `AlertContext` for all alerts.

Take a look at the demo app for an example on how to use this.
