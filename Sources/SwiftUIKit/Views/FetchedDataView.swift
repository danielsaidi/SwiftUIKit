//
//  FetchedDataView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-29.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to present asynchronous data that can
 be in a loading, fetched or failed state.
 
 By providing three views, the view will present the correct
 one depending on the state of the data:
 
 * `content` is shown when `data` has a value.
 * `loadingView` is shown when `data` is nil and loading.
 * `noDataView` is shown when `data` is nil and not loading.
 
 This lets you manage all three states of data fetching with
 a single view.
 */
public struct FetchedDataView<Model, Content: View, LoadingView: View, NoDataView: View>: View {
    
    public init(
        data: Model?,
        isLoading: Bool,
        loadingView: LoadingView,
        noDataView: NoDataView,
        @ViewBuilder content: @escaping ContentBuilder
    ) {
        self.data = data
        self.isLoading = isLoading
        self.content = content
        self.loadingView = loadingView
        self.noDataView = noDataView
    }
    
    private let data: Model?
    private let isLoading: Bool
    private let loadingView: LoadingView
    private let noDataView: NoDataView
    private let content: ContentBuilder
    
    public typealias ContentBuilder = (Model) -> Content
    
    public var body: some View {
        if let data = data {
            content(data)
        } else if isLoading {
            loadingView
        } else {
            noDataView
        }
    }
}

#Preview {
    
    struct Preview: View {
        
        let nilData: String? = nil
        let content: (String) -> AnyView = { Text($0).any() }
        let loadingView = Text("Preview.Loading")
        let noDataView = Text("Preview.NoData")
        
        var body: some View {
            Group {
                FetchedDataView(data: "Fetched data", isLoading: true, loadingView: loadingView, noDataView: noDataView, content: content)
                FetchedDataView(data: "Fetched data", isLoading: false, loadingView: loadingView, noDataView: noDataView, content: content)
                FetchedDataView(data: nilData, isLoading: true, loadingView: loadingView, noDataView: noDataView, content: content)
                FetchedDataView(data: nilData, isLoading: false, loadingView: loadingView, noDataView: noDataView, content: content)
            }
        }
    }
    
    return Preview()
}
