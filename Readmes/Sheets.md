# Sheets

`SwiftUIKit` makes managing modal sheets eaiser.

The `SheetContext` class embeds the `isPresented` binding logic and can be used to present any `SheetPresentable`,  which means that you can use it for a wide range of sheets.

You could for instance implement a global set of sheets in an `AppSheets` enum or screen-specific screens in e.g. a `SettingsEnum` enum, and use `SheetContext` for both.

Take a look at the demo app for an example on how to use this.
