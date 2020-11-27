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
    
    var data: String? { hasContent ? "Received data!" : nil }
    
    var body: some View {
        DemoList("FetchedDataView") {
            Section(header: Text("About")) {
                DemoListText("This view presents a certain view when data is being loaded, another view when the optional data is set and a failure view when data isn't being loaded, but no data exists.")
            }
            
            Section(header: Text("State")) {
                Toggle("Is loading", isOn: $isLoading)
                Toggle("Has content", isOn: $hasContent)
            }
            
            Section(header: Text("Result")) {
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
