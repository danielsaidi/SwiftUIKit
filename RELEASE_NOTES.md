# Release notes

[SwiftUIKit](https://github.com/danielsaidi/SwiftUIKit) honors semantic versioning, with the following strategy:

* Deprecations can happen at any time.
* Deprecations are removed in `major` updates.
* Breaking changes should only occur in `major` updates.
* Breaking changes *can* occur in `minor` and `patch` updates, if the alternative is worse.

These release notes cover the current major version. See older versions for older release notes.



## 6.1

This version bumps the package to 6.1 and deprecates some list views.



## 6.0

This version removes all deprecations, which means that many parts of the library are no longer available.

Most components have been extracted into separate packages. See [this page](https://danielsaidi.com/opensource) for my various open-source libraries. If something you used is missing, you will most probably find it there.

Many things have just been removed, when it has better, native alternatives. The last `5.9.4` version provides you with proper deprecation warnings to let you adjust.

Some components that should have been removed still remain, since we need more time. They will be deprecated in future minor versions,using the same deprecation strategy as in version 5.

The future of this library will be to extend native types. This will be fully realized in version 7.0.
