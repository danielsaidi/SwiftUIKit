//
//  DirectoryFileManager.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/// This class can handle files in a local directory.
open class DirectoryFileManager {
    
    
    // MARK: - Initialization
    
    public init?(
        directory: FileManager.SearchPathDirectory,
        fileManager: FileManager = .default
    ) {
        guard let dir = fileManager.urls(for: directory, in: .userDomainMask).last else { return nil }
        self.fileManager = fileManager
        self.url = dir
    }
    
    public init(
        fileManager: FileManager = .default,
        directoryUrl: URL
    ) {
        self.fileManager = fileManager
        self.url = directoryUrl
    }
    
    
    // MARK: - Properties
    
    private let fileManager: FileManager
    public let url: URL
    
    
    // MARK: - Public Functions
    
    open func createFile(
        named name: String,
        contents: Data?
    ) -> Bool {
        let url = url.appendingPathComponent(name)
        return fileManager.createFile(
            atPath: url.path,
            contents: contents,
            attributes: nil
        )
    }
    
    open func fileExists(
        withName name: String
    ) -> Bool {
        getUrlForFile(named: name) != nil
    }
    
    open func getAttributesForFile(
        named name: String
    ) -> [FileAttributeKey: Any]? {
        guard let url = getUrlForFile(named: name) else { return nil }
        return try? fileManager.attributesOfItem(atPath: url.path)
    }
    
    open func getFileNames() -> [String] {
        guard let urls = try? fileManager.contentsOfDirectory(
            at: url,
            includingPropertiesForKeys: nil,
            options: .skipsHiddenFiles
        ) else { return [] }
        return urls.map { $0.lastPathComponent }
    }
    
    open func getFileNames(
        matching fileNamePatterns: [String]
    ) -> [String] {
        let patterns = fileNamePatterns.map { $0.lowercased() }
        return getFileNames().filter {
            let fileName = $0.lowercased()
            return patterns.filter { fileName.contains($0) }.first != nil
        }
    }
    
    open func getSizeOfAllFiles() -> UInt64 {
        getFileNames().reduce(0) { $0 + (getSizeOfFile(named: $1) ?? 0) }
    }
    
    open func getSizeOfFile(
        named name: String
    ) -> UInt64? {
        guard let attributes = getAttributesForFile(named: name) else { return nil }
        let number = attributes[FileAttributeKey.size] as? NSNumber
        return number?.uint64Value
    }
    
    open func getUrlForFile(
        named name: String
    ) -> URL? {
        let urls = try? fileManager.contentsOfDirectory(
            at: url,
            includingPropertiesForKeys: nil)
        return urls?.first { $0.lastPathComponent == name }
    }
    
    open func getUrlsForAllFiles() -> [URL] {
        getFileNames().compactMap {
            getUrlForFile(named: $0)
        }
    }
    
    open func removeFile(
        named name: String
    ) throws {
        guard let url = getUrlForFile(named: name) else { return }
        try fileManager.removeItem(at: url)
    }
}
