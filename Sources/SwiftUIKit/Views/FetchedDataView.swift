//
//  FetchedDataView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-29.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can present asynchronous data that can be in a
/// loading, fetched or failed state.
///
/// By providing three views, the view will show the correct
/// one depending on the state of the data:
///
/// * `content` is shown when `data` has a value.
/// * `loadingView` is shown when `data` is nil and loading.
/// * `noDataView` is shown when `data` is nil and not loading.
///
/// This lets you manage all three states with a single view.
public struct FetchedDataView<Model, Content: View, LoadingView: View, NoDataView: View>: View {
    
    @available(*, deprecated, message: "Use the view builder-based initializer instead.")
    public init(
        data: Model?,
        isLoading: Bool,
        loadingView: LoadingView,
        noDataView: NoDataView,
        @ViewBuilder content: @escaping (Model) -> Content
    ) {
        self.data = data
        self.isLoading = isLoading
        self.loadingView = { loadingView }
        self.noDataView = { noDataView }
        self.content = { content($0) }
    }
    
    public init(
        data: Model?,
        isLoading: Bool,
        @ViewBuilder loadingView: @escaping () -> LoadingView,
        @ViewBuilder noDataView: @escaping () -> NoDataView,
        @ViewBuilder content: @escaping (Model) -> Content
    ) {
        self.data = data
        self.isLoading = isLoading
        self.content = content
        self.loadingView = loadingView
        self.noDataView = noDataView
    }
    
    private let data: Model?
    private let isLoading: Bool
    private let loadingView: () -> LoadingView
    private let noDataView: () -> NoDataView
    private let content: (Model) -> Content
    
    public var body: some View {
        if let data = data {
            content(data)
        } else if isLoading {
            loadingView()
        } else {
            noDataView()
        }
    }
}

#Preview {
    
    struct Preview: View {
        
        let nilData: String? = nil
        let content: (String) -> Text = { .init($0) }
        let loadingView = Text("Preview.Loading")
        let noDataView = Text("Preview.NoData")
        
        var body: some View {
            if #available(iOS 17.0, *) {
                FetchedDataView(
                    data: nilData,
                    isLoading: false,
                    loadingView: { ProgressView() },
                    noDataView: {
                        ContentUnavailableView(
                            "No data",
                            systemImage: "x.circle"
                        )
                        .foregroundStyle(.red)
                    }
                ) { string in
                    Text(string)
                }
            }
        }
    }
    
    return Preview()
}
