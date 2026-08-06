# Release notes

[SwiftUIKit](https://github.com/danielsaidi/SwiftUIKit) honors semantic versioning, with the following strategy:

* Deprecations can happen at any time.
* Deprecations are removed in `major` updates.
* Breaking changes should only occur in `major` updates.
* Breaking changes *can* occur in non-major updates, if the alternative is worse.

These release notes cover the current major version. See older versions for older release notes.



## 7.0

This version bumps deployment targets and uses localized string resources instead of keys.

SwiftUIKit now supports iOS 16, macOS 14, tvOS 16, watchOS 9, and visionOS 1.

### ✨ Features

* `Label` has a new custom view icon initializer.

### 💡 Changes

* The SDK now uses LocalizedStringResource instead of LocalizedStringKey.

### ‼️ Breaking Changes

* All deprecated code has been removed.
