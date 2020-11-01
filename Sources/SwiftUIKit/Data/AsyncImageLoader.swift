//
//  AsyncImageLoader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

/**
 This class can be used to fetch an image from an url, using
 an async network request.
 */
public class AsyncImageLoader: ObservableObject {
    
    public init(
        url: URL,
        session: URLSession = .shared) {
        self.url = url
        self.session = session
    }
    
    deinit { cancel() }
    
    private let url: URL
    private let session: URLSession
    private var cancellable: AnyCancellable?
    
    @Published public var image: Image?

    func load() {
        cancellable = session.dataTaskPublisher(for: url)
            .map { $0.data }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.image = self?.getImage(from: $0)
            }
    }

    func cancel() {
        cancellable?.cancel()
    }
}

private extension AsyncImageLoader {
    
    func getImage(from data: Data?) -> Image? {
        guard let data = data else { return nil }
        #if os(iOS) || os(tvOS) || os(watchOS)
        let image = UIImage(data: data) ?? UIImage()
        return Image(uiImage: image)
        #elseif os(macOS)
        let image = NSImage(data: data) ?? NSImage()
        return Image(nsImage: image)
        #else
        print("Unsupported platform")
        return nil
        #endif
    }
}
