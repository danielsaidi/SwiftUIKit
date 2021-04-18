//
//  FolderObservable.swift
//  MetaNotes
//
//  Created by Daniel Saidi on 2021-04-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//
//  Original implementation:
//  https://medium.com/over-engineering/monitoring-a-folder-for-changes-in-ios-dc3f8614f902
//

import Foundation

/**
 This class can be used to observe file system changes for a
 certain folder.
 
 When you use this class, you can observe its `files` to get
 information on whenever the folder content changes.
 */
public class FolderObservable: ObservableObject {
    
    /**
     Create an instance that observes file system changes in
     a folder at the provided `folderUrl`.
     */
    public init(
        folderUrl: URL,
        fileManager: FileManager = .default) {
        self.folderUrl = folderUrl
        self.fileManager = fileManager
        folderMonitor.startMonitoring()
        self.handleChanges()
    }
    
    @Published public var files: [URL] = []
    
    private let folderUrl: URL
    private let fileManager: FileManager
    
    private lazy var folderMonitor = FolderMonitor(folderUrl: folderUrl, onChange: handleChanges)
}

private extension FolderObservable {

    func handleChanges() {
        let files = try? fileManager.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil, options: .producesRelativePathURLs)
        DispatchQueue.main.async {
            self.files = files ?? []
        }
    }
}
