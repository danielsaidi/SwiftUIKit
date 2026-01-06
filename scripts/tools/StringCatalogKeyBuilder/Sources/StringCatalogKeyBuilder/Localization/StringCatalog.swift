//
//  StringCatalog.swift
//  SwiftPackageScripts
//
//  Created by Daniel Saidi on 2025-11-28.
//  Copyright © 2025-2026 Daniel Saidi. All rights reserved.
//

import Foundation

/// This type can parse Xcode string catalogs that contain
/// manually added keys.
///
/// This type can extract source language, version, and all
/// strings from a file path, JSON string, or JSON encoded
/// data. Since Xcode generated keys are internal, you can
/// run ``generatePublicKeyWrappers(withRootNamespace:)`` to
/// generate a Swift code string with public key wrappers.
///
/// This library has a CLI tool and a Terminal script that
/// will use this class to generate public key wrapper files
/// in the file system.
public struct StringCatalog: Codable {

    /// Parse a string catalog at a certain path.
    public init(path: String) throws {
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        try self.init(data: data)
    }

    /// Parse a string catalog from a JSON string.
    public init(json: String) throws {
        let data = Data(json.utf8)
        try self.init(data: data)
    }

    /// Parse a string catalog from JSON encoded data.
    public init(data: Data) throws {
        let decoder = JSONDecoder()
        let raw = try decoder.decode(RawCatalog.self, from: data)
        strings = Array(raw.strings.keys)
        sourceLanguage = raw.sourceLanguage
        version = raw.version
    }

    /// The string catalog source language.
    public let sourceLanguage: String

    /// The string catalog strings.
    public let strings: [String]

    /// The string catalog version.
    public let version: String
}

extension StringCatalog {

    /// This type represents a codable wrapper.
    struct AnyCodable: Codable {
        init(from decoder: Decoder) throws {
            // We don't care about the value, just consume it
        }
    }

    /// This enum defines all supported parameter types.
    enum ParameterType: String {
        case string
        case double
        case int

        var swiftType: String {
            rawValue.capitalized
        }
    }

    /// This type represents a raw catalog content.
    struct RawCatalog: Codable {
        let sourceLanguage: String
        let strings: [String: AnyCodable]
        let version: String
    }
}
