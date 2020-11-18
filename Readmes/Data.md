# Data

`SwiftUIKit` contains `Data`-specific utilities, like async image loading, QR codes etc.


## AsyncImageLoader

This class can be used to fetch an image from an url, using an async network request.

This is a very basic implementation, so you probably want to use a library like Kingfisher for more complex operations.


## QrCodeGenerator

The `QrCodeGenerator` protocol can be implemented by anything that can generate QR code images.

The `StandardQrCodeGenerator` implementation provides a standard way of doing this.


## UserDefaultsPersisted

The `UserDefaultsPersisted` property wrapper can be applied to any codable property to make it automatically sync with `UserDefaults`.
