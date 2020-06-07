# Data

`SwiftUIKit` contains `Data`-specific utilities.


## QrCodeGenerator

The `QrCodeGenerator` protocol can be implemented by anything that can generate QR code images.

The `StandardQrCodeGenerator` implementation provides a standard way of doing this.


## UserDefaultsPersisted

The `UserDefaultsPersisted` property wrapper can be applied to any codable property to make it automatically sync with `UserDefaults`.
