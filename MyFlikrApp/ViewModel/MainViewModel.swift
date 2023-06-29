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
    
    
    var urlString: String {
        return "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=720ecf4312fb2f251d42b27c7af7c554&contacts=&extras=description%2C+date_taken%2C+owner_name%2C+url_m&format=json&nojsoncallback=1&auth_token=72157720886733412-f4c77bca4c108faf&api_sig=15157a45af16ce6170b893c902d7f286"
    }
    
    init() {
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
            guard let photoData = try? JSONDecoder().decode(PhotosClass.self, from: data) else { throw CustomError.invalidData }
            self.photosArray = photoData.photo
            
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
