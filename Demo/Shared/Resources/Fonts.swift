// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSFont
  internal typealias CustomFont = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
  internal typealias CustomFont = UIFont
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum AbrilFatface {
    internal static let regular = FontConvertible(name: "AbrilFatface-Regular", family: "Abril Fatface", path: "AbrilFatface-Regular.ttf")
    internal static let all: [FontConvertible] = [regular]
  }
  internal enum Lobster {
    internal static let regular = FontConvertible(name: "Lobster-Regular", family: "Lobster", path: "Lobster-Regular.ttf")
    internal static let all: [FontConvertible] = [regular]
  }
  internal enum LuckiestGuy {
    internal static let regular = FontConvertible(name: "LuckiestGuy-Regular", family: "Luckiest Guy", path: "LuckiestGuy-Regular.ttf")
    internal static let all: [FontConvertible] = [regular]
  }
  internal static let allCustomFonts: [FontConvertible] = [AbrilFatface.all, Lobster.all, LuckiestGuy.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  internal func font(size: CGFloat) -> CustomFont! {
    return CustomFont(font: self, size: size)
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    let bundle = Bundle(for: BundleToken.self)
    return bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension CustomFont {
  convenience init!(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

private final class BundleToken {}
