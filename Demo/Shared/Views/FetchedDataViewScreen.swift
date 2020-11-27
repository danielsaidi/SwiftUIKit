//
//  FetchedDataViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct FetchedDataViewScreen: View {
    
    @State private var hasContent = false
    @State private var isLoading = true
    
    var data: String? { hasContent ? "Here comes data!" : nil }
    
    var body: some View {
        DemoList("FetchedDataView") {
            Section {
                Toggle("Is loading", isOn: $isLoading)
                Toggle("Has content", isOn: $hasContent)
            }
            Section {
                FetchedDataView(
                    data: data,
                    isLoading: isLoading,
                    loadingView: spinner,
                    noDataView: Text("Failed to fetch data!")) { data in
                    Text(data)
                }
            }
        }
    }
}

private extension FetchedDataViewScreen {
    
    var spinner: some View {
        HStack {
            Spacer()
            CircularProgressView()
            Spacer()
        }
    }
}

struct FetchedDataViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        FetchedDataViewScreen()
    }
}
