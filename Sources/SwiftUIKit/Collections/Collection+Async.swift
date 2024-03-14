//
//  Collection+Async.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-10.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Collection {
    
    /// Compact map a collection using an async transform.
    func asyncCompactMap<ResultType>(
        _ transform: (Element) async -> ResultType?
    ) async -> [ResultType] {
        await self
            .asyncMap(transform)
            .compactMap { $0 }
    }
    
    /// Compact map a collection using an async transform.
    func asyncCompactMap<ResultType>(
        _ transform: (Element) async throws -> ResultType?
    ) async throws -> [ResultType] {
        try await self
            .asyncMap(transform)
            .compactMap { $0 }
    }
    
    /// Map a collection using an async transform.
    func asyncMap<ResultType>(
        _ transform: (Element) async -> ResultType
    ) async -> [ResultType] {
        var result = [ResultType]()
        for item in self {
            await result.append(transform(item))
        }
        return result
    }
    
    /// Map a collection using an async transform.
    func asyncMap<ResultType>(
        _ transform: (Element) async throws -> ResultType
    ) async throws -> [ResultType] {
        var result = [ResultType]()
        for item in self {
            try await result.append(transform(item))
        }
        return result
    }
}
