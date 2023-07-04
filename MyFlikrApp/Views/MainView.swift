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
    @State private var showAlert = false
    
    let colums = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: colums, spacing: 1) {
                    ForEach(viewModel.filteredPhotos) { data in
                        NavigationLink(destination: DetailView(image: data.urlM, title: data.title, description: data.description.content, owner: data.ownername, date: data.datetaken)) {
                            RowView(image: data.urlM)
                        }
                        .onAppear {
                            if data.id == viewModel.photosArray.last?.id {
                                viewModel.loadData()
                            }
                        }
                    }
                }
                .onReceive(viewModel.$error) { error in
                    if error != nil {
                        showAlert.toggle()
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(viewModel.error?.localizedDescription ?? "")
                    )
                }
                .searchable(text: $viewModel.searchText, prompt: "Search a name")
                .navigationTitle("Photo Search")
            }
            .refreshable {
                viewModel.handleRefresh()
            }
            .task {
                if hasAppered {
                    viewModel.loadData()
                    hasAppered = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
