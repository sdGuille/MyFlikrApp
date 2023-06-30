//
//  ContentView.swift
//  MyFlikrApp
//
//  Created by Guillermo Ruiz Baires on 28/6/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var hasAppered = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredPhotos) { data in
                NavigationLink(destination: DetailView(image: data.urlM, title: data.title, description: data.description.content, owner: data.ownername, date: data.datetaken)) {
                    RowView(image: data.urlM)
                    //                Text("\(data.ownername)")
                }
            }
            
            .searchable(text: $viewModel.searchText, prompt: "Search a name")
            
            .refreshable {
                viewModel.handleRefresh()
            }
            
            .task {
                if hasAppered {
                    viewModel.loadData()
                    hasAppered = true
                }
            }
            .navigationTitle("Photo Search")
        }
        
//        .onAppear {
//            viewModel.fetchData()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
