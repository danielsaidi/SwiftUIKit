//
//  FetchedDataView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-29.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to present asynchronous data that can
 be either in a loading, fetched or failed state.
 
 By Providing three views to the view, the view will present
 the correct one depending on the state of the data:
 
 * `content` is shown when the optional `data` has a value.
 * `loadingView` is shown when `data` is nil and `isLoading` is true.
 * `noDataView` is shown when `data` is nil and `isLoading` is false.
 
 My intention was for `loadingView` to be optional, but this
 proved problematic. First, the standard `ProgressView` that
 I meant to return is only available on `iOS 14`, `tvOS 14`,
 so I had to use an obscured fallback for older platforms. I
 also had problems making the init param optional, since the
 `LoadingView` is part of the generic and can not be omitted.
 */
public struct FetchedDataView<Model, Content: View, LoadingView: View, NoDataView: View>: View {
    
    public init(
        data: Model?,
        isLoading: Bool,
        @ViewBuilder content: @escaping ContentBuilder,
        @ViewBuilder loadingView: @escaping LoadingViewBuilder,
        @ViewBuilder noDataView: @escaping NoDataViewBuilder) {
        self.data = data
        self.isLoading = isLoading
        self.content = content
        self.loadingView = loadingView
        self.noDataView = noDataView
    }
    
    private let data: Model?
    private let isLoading: Bool
    private let content: ContentBuilder
    private let loadingView: LoadingViewBuilder
    private let noDataView: NoDataViewBuilder
    
    public typealias ContentBuilder = (Model) -> Content
    public typealias LoadingViewBuilder = () -> LoadingView
    public typealias NoDataViewBuilder = () -> NoDataView
    
    public var body: some View {
        Group {
            if let data = data {
                content(data)
            } else if isLoading {
                loadingView()
            } else {
                noDataView()
            }
        }
    }
}

struct FetchedDataView_Previews: PreviewProvider {
    static var previews: some View {
        let nilData: String? = nil
        let content: (String) -> AnyView = { Text($0).any() }
        let loadingView = { Text("Loading...") }
        let noDataView = { Text("No data") }
        
        return Group {
            FetchedDataView(data: "Fetched data", isLoading: true, content: content, loadingView: loadingView, noDataView: noDataView)
            FetchedDataView(data: "Fetched data", isLoading: false, content: content, loadingView: loadingView, noDataView: noDataView)
            FetchedDataView(data: nilData, isLoading: true, content: content, loadingView: loadingView, noDataView: noDataView)
            FetchedDataView(data: nilData, isLoading: false, content: content, loadingView: loadingView, noDataView: noDataView)
        }.previewLayout(.sizeThatFits)
    }
}
