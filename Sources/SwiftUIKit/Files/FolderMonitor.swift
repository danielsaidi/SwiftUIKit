//
//  FolderMonitor.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//
//  Original implementation:
//  https://medium.com/over-engineering/monitoring-a-folder-for-changes-in-ios-dc3f8614f902
//

import Foundation

/**
 This class can be used to monitor file system changes for a
 certain folder.
 */
public class FolderMonitor {
    
    /**
     Create an instance that monitors file system changes in
     a folder at the provided `folderUrl`.

     - Parameters:
       - folderUrl: The url of the folder to observe.
       - onChange: The function to call when the folder changes.     
     */
    public init(
        folderUrl: URL,
        onChange: @escaping () -> Void) {
        self.folderUrl = folderUrl
        self.onChange = onChange
    }

    
    private let folderUrl: URL
    private let onChange: (() -> Void)
    
    private var fileDescriptor: CInt = -1
    private let monitorQueue = DispatchQueue(label: "FolderMonitorQueue", attributes: .concurrent)
    private var monitorSource: DispatchSourceFileSystemObject?
    
    
    /**
     Start monitoring changes to the directory.
     */
    public func startMonitoring() {
        guard
            monitorSource == nil,
            fileDescriptor == -1
        else { return }
        
        // Open the directory referenced by URL for monitoring only.
        fileDescriptor = open(folderUrl.path, O_EVTONLY)
        
        // Define a dispatch source monitoring the directory for additions, deletions, and renamings.
        monitorSource = DispatchSource.makeFileSystemObjectSource(
            fileDescriptor: fileDescriptor,
            eventMask: .write,
            queue: monitorQueue)
        
        // Define the block to call when a file change is detected.
        monitorSource?.setEventHandler { [weak self] in
            self?.onChange()
        }
        
        // Define a cancel handler to ensure the directory is closed when the source is cancelled.
        monitorSource?.setCancelHandler { [weak self] in
            guard let self = self else { return }
            close(self.fileDescriptor)
            self.fileDescriptor = -1
            self.monitorSource = nil
        }
        
        // Start monitoring the directory via the source.
        monitorSource?.resume()
    }
    
    /**
     Stop monitoring changes to the directory.
     */
    public func stopMonitoring() {
        monitorSource?.cancel()
    }
}
