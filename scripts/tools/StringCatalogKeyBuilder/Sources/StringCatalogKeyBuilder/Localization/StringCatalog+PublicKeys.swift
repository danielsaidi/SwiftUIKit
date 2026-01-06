//
//  StringCatalog+PublicKeys.swift
//  SwiftPackageScripts
//
//  Created by Daniel Saidi on 2025-11-28.
//  Copyright © 2025-2026 Daniel Saidi. All rights reserved.
//

import Foundation

public extension StringCatalog {

    /// Generate public key wrappers for the string catalog.
    ///
    /// - Parameters:
    ///   - root: The root namespace, by default `l10n`.
    ///   - indentSize: The indentation size, by default `4`.
    func generatePublicKeyWrappers(
        withRootNamespace root: String = "l10n",
        indentSize: Int = 4
    ) -> String {
        let indent = String(repeating: " ", count: indentSize)

        var tree: [String: Any] = [:]

        for key in strings {
            let components = key.split(separator: ".")
            guard !components.isEmpty else { continue }
            let namespace = String(components[0])
            if tree[namespace] == nil {
                tree[namespace] = [String: Any]()
            }
            insertIntoTree(&tree, components: Array(components), fullKey: key)
        }

        // Pre-allocate capacity for better performance
        var output = """
        import Foundation
        
        // THIS IS A GENERATED FILE
        // Run the l10n-gen script to regenerate this file.
        public extension LocalizedStringResource {
        
        \(indent)enum \(root) {
        
        """

        for (namespace, value) in tree.sorted(by: { $0.key < $1.key }) {
            let enumName = lowercaseFirst(namespace)

            if let subtree = value as? [String: Any] {
                // Namespace with nested content
                output += generateEnum(
                    name: enumName,
                    tree: subtree,
                    prefix: namespace,
                    indent: 2,
                    indentation: indent
                )
            } else if let fullKey = value as? String {
                // Root-level key without namespace
                output += generateProperty(
                    fullKey: fullKey,
                    indentation: indent + indent
                )
            }
        }

        output += """
        \(indent)}
        }
        """
        return output
    }
}

private extension StringCatalog {

    func lowercaseFirst(_ string: String) -> String {
        guard let first = string.first else { return string }
        return first.lowercased() + string.dropFirst()
    }

    func insertIntoTree(
        _ tree: inout [String: Any],
        components: [String.SubSequence],
        fullKey: String
    ) {
        guard !components.isEmpty else { return }

        let namespace = String(components[0])

        if components.count == 1 {
            tree[namespace] = fullKey
            return
        }

        guard var current = tree[namespace] as? [String: Any] else { return }

        // Build the path through the tree
        let path = components.dropFirst().map(String.init)

        // Navigate to the correct position and insert
        func insert(into dict: inout [String: Any], path: [String], value: String) {
            guard !path.isEmpty else { return }

            if path.count == 1 {
                dict[path[0]] = value
            } else {
                let key = path[0]
                if dict[key] == nil {
                    dict[key] = [String: Any]()
                }
                var nested = dict[key] as! [String: Any]
                insert(into: &nested, path: Array(path.dropFirst()), value: value)
                dict[key] = nested
            }
        }

        insert(into: &current, path: path, value: fullKey)
        tree[namespace] = current
    }

    func generateEnum(
        name: String,
        tree: [String: Any],
        prefix: String,
        indent: Int,
        indentation: String
    ) -> String {
        let currentIndent = String(repeating: indentation, count: indent)
        let innerIndent = String(repeating: indentation, count: indent + 1)

        var output = "\(currentIndent)public enum \(name) {\n"

        let sorted = tree.sorted { lhs, rhs in
            let lhsIsDict = lhs.value is [String: Any]
            let rhsIsDict = rhs.value is [String: Any]

            if lhsIsDict != rhsIsDict {
                return lhsIsDict
            }
            return lhs.key < rhs.key
        }

        for (key, value) in sorted {
            if let subtree = value as? [String: Any] {
                let enumName = lowercaseFirst(key)
                output += generateEnum(
                    name: enumName,
                    tree: subtree,
                    prefix: "\(prefix).\(key)",
                    indent: indent + 1,
                    indentation: indentation
                )
            } else if let fullKey = value as? String {
                output += generateProperty(
                    fullKey: fullKey,
                    indentation: innerIndent
                )
            }
        }

        output += "\(currentIndent)}\n"
        return output
    }

    func generateProperty(
        fullKey: String,
        indentation: String
    ) -> String {
        let parameters = fullKey.parseStringCatalogParameters()
        let cleanKey = fullKey.split(separator: " ")[0]

        let lastComponent = cleanKey.split(separator: ".").last!
        let words = String(lastComponent).splitCamelCase()
        let propertyName = words.toCamelCase()

        // Generate the Xcode property name by concatenating all components
        let allComponents = cleanKey.split(separator: ".")
        let xcodeGenerated = allComponents.enumerated().map { index, component in
            let componentStr = String(component)
            let words = componentStr.splitCamelCase()
            let camelCased = words.toCamelCase()
            return index == 0 ? camelCased : camelCased.prefix(1).uppercased() + camelCased.dropFirst()
        }.joined()

        if parameters.isEmpty {
            return "\(indentation)public static var \(propertyName): LocalizedStringResource { .\(xcodeGenerated) }\n"
        } else {
            let params = parameters.map { "_ \($0.name): \($0.type.swiftType)" }.joined(separator: ", ")
            let args = parameters.map { "\($0.name)" }.joined(separator: ", ")
            return "\(indentation)public static func \(propertyName)(\(params)) -> LocalizedStringResource { .\(xcodeGenerated)(\(args)) }\n"
        }
    }
}
