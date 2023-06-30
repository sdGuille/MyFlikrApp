//
//  RowView.swift
//  MyFlikrApp
//
//  Created by Guillermo Ruiz Baires on 28/6/23.
//

import SwiftUI

struct RowView: View {
    let image: String?
    

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image ?? "")) { picture in
                picture.resizable()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .frame(width: 125, height: 125)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(image: "https://live.staticflickr.com/65535/53011496334_f1a916b87a.jpg")
    }
}
