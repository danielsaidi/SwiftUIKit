//
//  UserDefaults+Codable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-09-23.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    /// Try to decode a certain key to a decodable type.
    func codable<T: Codable>(forKey key: String) -> T? {
        guard let data = object(forKey: key) as? Data else { return nil }
        let value = try? JSONDecoder().decode(T.self, from: data)
        return value
    }
    
    /// Persist a codable item.
    func setCodable<T: Codable>(_ codable: T, forKey key: String) {
        let data = try? JSONEncoder().encode(codable)
        set(data, forKey: key)
    }
}
