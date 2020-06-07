# Sheets

`SwiftUIKit` makes it easier to work with modal sheets.


## SheetContext

The `SheetContext` class embeds the `isPresented` binding logic and can be used to present any `SheetPresentable`,  which means that you can use it for a wide range of sheets and custom types within your apps.

You could for instance implement a global set of sheets in an `AppSheets` enum or screen-specific screens in e.g. a `SettingsSheet` enum, and use the same `SheetContext` for all sheets.

Take a look at the demo app for an example on how to use this.
