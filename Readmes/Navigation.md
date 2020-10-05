# Navigation

`SwiftUIKit` contains in-app `Navigation` utilities.


## UrlOpener

The `UrlOpener` can be implemeneted by anything that should be able to open a url.

The protocol provides a `canOpen` and a `tryOpen` function, as well as many convenience variants.

The default implementation opens a url with the shared application. You can override this in any way you want.
