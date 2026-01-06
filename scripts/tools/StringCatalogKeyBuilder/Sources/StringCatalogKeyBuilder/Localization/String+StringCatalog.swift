//
//  String+StringCatalog.swift
//  SwiftPackageScripts
//
//  Created by Daniel Saidi on 2025-12-01.
//  Copyright © 2025-2026 Daniel Saidi. All rights reserved.
//

import Foundation

extension String {

    typealias StringCatalogParameter = (name: String, type: StringCatalog.ParameterType)

    func parseStringCatalogParameters() -> [StringCatalogParameter] {
        let pattern = /%([0-9$]*)(lld|@|lf|f)/
        var parameters: [(String, StringCatalog.ParameterType)] = []
        var index = 0

        for match in self.matches(of: pattern) {
            let specifier = String(match.output.2)
            let type: StringCatalog.ParameterType

            switch specifier {
            case "lld": type = .int
            case "@": type = .string
            case "lf", "f": type = .double
            default: continue
            }

            let name = "param\(index + 1)"
            parameters.append((name, type))
            index += 1
        }

        return parameters
    }
}
