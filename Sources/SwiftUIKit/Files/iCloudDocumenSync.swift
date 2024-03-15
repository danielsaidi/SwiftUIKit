//
//  iCloudDocumentSync.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-29.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import Foundation

/// This class can sync iCloud document changes, in a shared
/// uqibuity container.
///
/// Note that you must have iCloud entitlements and added an
/// iCloud node to Info.plist. All apps that should sync any
/// documents must belong to the same ubiquity container and
/// be identically configured.
open class iCloudDocumentSync {
    
    public init(
        filePattern: String,
        fileManager: FileManager = .default,
        notificationCenter: NotificationCenter = .default
    ) {
        self.filePattern = filePattern
        self.fileManager = fileManager
        self.center = notificationCenter
    }
        
    private let filePattern: String
    private let fileManager: FileManager
    private let center: NotificationCenter
    
    private lazy var metadataQuery: NSMetadataQuery = {
        let query = NSMetadataQuery()
        query.notificationBatchingInterval = 1
        query.searchScopes = [NSMetadataQueryUbiquitousDataScope, NSMetadataQueryUbiquitousDocumentsScope]
        query.predicate = NSPredicate(format: "%K LIKE %@", NSMetadataItemFSNameKey, filePattern)
        query.sortDescriptors = [NSSortDescriptor(key: NSMetadataItemFSNameKey, ascending: true)]
        let selector = #selector(handleQueryNotification)
        center.addObserver(self, selector: selector, name: .NSMetadataQueryDidUpdate, object: query)
        center.addObserver(self, selector: selector, name: .NSMetadataQueryDidFinishGathering, object: query)
        return query
    }()
    
    /// Start syncing iCloud document changes.
    open func startSyncingChanges() {
        metadataQuery.start()
    }
    
    /// Stop syncing iCloud document changes.
    open func stopSyncingChanges() {
        center.removeObserver(self)
    }
}

@objc private extension iCloudDocumentSync {
    
    func handleQueryNotification(notification: Notification?) {
        guard let metadataQuery = notification?.object as? NSMetadataQuery else { return }
        metadataQuery.disableUpdates()
        metadataQuery.enumerateResults { item, _, _ in
            handleQueryItem(item)
        }
        metadataQuery.enableUpdates()
    }
    
    func handleQueryItem(_ item: Any) {
        guard
            let metadataItem = item as? NSMetadataItem,
            !isMetadataItemDownloaded(for: metadataItem),
            let url = metadataItem.value(forAttribute: NSMetadataItemURLKey) as? URL
        else { return }
        try? fileManager.startDownloadingUbiquitousItem(at: url)
    }
    
    func isMetadataItemDownloaded(for item: NSMetadataItem) -> Bool {
        let statusKey = item.value(forAttribute: NSMetadataUbiquitousItemDownloadingStatusKey)
        return statusKey as? String == NSMetadataUbiquitousItemDownloadingStatusDownloaded
    }
}
