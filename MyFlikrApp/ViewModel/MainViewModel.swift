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
    

    var filteredPhotos: [Photo] {
        guard !searchText.isEmpty else { return photosArray }
        return photosArray.filter { $0.ownername.localizedCaseInsensitiveContains(searchText) }
    }
    
    var urlString: String {
        return "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=7bea864cc89162404d8215d5061d1f03&extras=url_m%2C+description%2C+date_taken%2C+owner_name&format=json&nojsoncallback=1&auth_token=72157720886872990-d26dec84286df3d4&api_sig=faa4618efc24c6edfe2278a8356d152f"
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
            self.photosArray = results.photos.photo


        } catch {
            print(error.localizedDescription)
        }
    }

    func loadData() {
        Task(priority: .medium) {
            try await fetchData()
        }
    }

}


//import Foundation
//
//class MainViewModel: ObservableObject {
//    @Published var myPhotos: [Photo] = []
//    
//    var urlString: String {
//        return "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=7bea864cc89162404d8215d5061d1f03&extras=url_m%2C+description%2C+date_taken%2C+owner_name&format=json&nojsoncallback=1&auth_token=72157720886872990-d26dec84286df3d4&api_sig=faa4618efc24c6edfe2278a8356d152f"
//    }
//    
//
//    func fetchData() {
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode(Photos.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.myPhotos = results.photos.photo
//                            }
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//}
