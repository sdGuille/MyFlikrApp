//
//  MainViewModel.swift
//  MyFlikrApp
//
//  Created by Guillermo Ruiz Baires on 28/6/23.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var error: Error?
    @Published var photosArray: [Photo] = []
    @Published var searchText = ""
    
    
    private let pageLimit = 50
    private var page = 1
    


    var filteredPhotos: [Photo] {
        guard !searchText.isEmpty else { return photosArray }
        return photosArray.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    var urlString: String {
        return "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=aaf7230ce699a1dff86eee5a8e068f31&safe_search=3&extras=url_m%2C+description%2C+date_taken%2C+owner_name&format=json&nojsoncallback=1&auth_token=72157720887378078-96a7771aa07bc641&api_sig=c5e96f310a471acb561e94e3cfd0b8af"
    }

    init() {
        loadData()
    }
    
    func handleRefresh() {
            photosArray.removeAll()
            loadData()
        }



}

extension MainViewModel {
    @MainActor
    func fetchData() async throws {
        do {
            
            guard let url = URL(string: urlString) else { throw CustomError.invalidURL }

            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw CustomError.serverError }
            guard let results = try? JSONDecoder().decode(Photos.self, from: data) else { throw CustomError.invalidData }
            self.photosArray.append(contentsOf: results.photos.photo)
//            page += 1

            
        } catch {
            self.error = error
        }
    }

    func loadData() {
        Task(priority: .medium) {
            try await fetchData()
        }
    }
}
