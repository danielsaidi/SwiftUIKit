# Presentation

`SwiftUIKit` makes it easier to work with alerts, sheets, fullscreen modals, toasts etc.

When it comes to alerts, covers, sheets and toasts, they all work in the same way, which means that you can work with them using the available contexts. You can then for instance have a global `AppAlert` enum or a screen-specific `SettingsAlert` enum that implement `AlertProvider` then use the same `AlertContext` approach to present all these alerts.

Take a look at the demo app for examples on how to use these tools.


## Alerts

`SwiftUIKit` makes it easier to present alerts.

The `AlertContext` class handles presentation logic and can be used to present any `Alert` or `AlertProvider`. This means that you can use it for all kinds of alerts within your apps.


## Full Screen Covers

`SwiftUIKit` makes it easier to present full screen covers.

The `FullScreenCoverContext` class handles presentation logic and can be used to present any full screen view or `FullScreenCoverProvider`. This means that you can use it for all kinds of views within your apps.


## Sheets

`SwiftUIKit` makes it easier to present sheets.

The `SheetContext` class handles presentation logic and can be used to present any sheet view or `SheetProvider`. This means that you can use it for all kinds of sheets within your apps.


## Toasts

`SwiftUIKit` contains logic for presenting customizable toasts above other views.

The `ToastContext` class handles presentation logic and can be used to present any toast view or `ToastProvider`. This means that you can use it for all kinds of toasts within your apps.
