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
     */
    public init(
        folderUrl: URL,
        onChange: @escaping () -> Void) {
        self.folderUrl = folderUrl
        self.onChange = onChange
    }
    
    private let folderUrl: URL
    private let onChange: (() -> Void)
    
    private var monitoredFolderFileDescriptor: CInt = -1
    private let folderMonitorQueue = DispatchQueue(label: "FolderMonitorQueue", attributes: .concurrent)
    private var folderMonitorSource: DispatchSourceFileSystemObject?
    
    
    /**
     Start monitoring changes to the directory.
     */
    public func startMonitoring() {
        guard
            folderMonitorSource == nil,
            monitoredFolderFileDescriptor == -1
        else { return }
        
        // Open the directory referenced by URL for monitoring only.
        monitoredFolderFileDescriptor = open(folderUrl.path, O_EVTONLY)
        
        // Define a dispatch source monitoring the directory for additions, deletions, and renamings.
        folderMonitorSource = DispatchSource.makeFileSystemObjectSource(fileDescriptor: monitoredFolderFileDescriptor, eventMask: .write, queue: folderMonitorQueue)
        
        // Define the block to call when a file change is detected.
        folderMonitorSource?.setEventHandler { [weak self] in
            self?.onChange()
        }
        
        // Define a cancel handler to ensure the directory is closed when the source is cancelled.
        folderMonitorSource?.setCancelHandler { [weak self] in
            guard let strongSelf = self else { return }
            close(strongSelf.monitoredFolderFileDescriptor)
            strongSelf.monitoredFolderFileDescriptor = -1
            strongSelf.folderMonitorSource = nil
        }
        
        // Start monitoring the directory via the source.
        folderMonitorSource?.resume()
    }
    
    /**
     Stop monitoring changes to the directory.
     */
    public func stopMonitoring() {
        folderMonitorSource?.cancel()
    }
}
