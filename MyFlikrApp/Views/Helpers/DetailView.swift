//
//  DetailView.swift
//  MyFlikrApp
//
//  Created by Guillermo Ruiz Baires on 28/6/23.
//

import SwiftUI

struct DetailView: View {
    let image: String
    let title: String
    let description: String
    let owner: String
    let date: String
    
    var body: some View {
        VStack {

//            Spacer()
            
            AsyncImage(url: URL(string: image)){ photo in
                photo.resizable()
                    .aspectRatio(1440/1920,contentMode: .fill)
                    .clipped()
                    .cornerRadius(5)
                    .shadow(radius: 40)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2.bold())
                VStack(alignment: .leading){
                    Text("Owner: \(owner)")
                    Text("taken at: \(date)")
                    Text(description)
                        .font(.caption)
                }
                .bold()
                .font(.system(size: 14))
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                Spacer()
            }
            .padding(.top)
            
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "https://live.staticflickr.com/65535/53013299588_5aa571d62b.jpg",
                   title: "Image Title",
                   description: "Lorem ipsum dolor sit amet deos asd oihsl shjkjj ddjiiue eueuofo soduo soo",
                   owner: "@owner",
                   date: "12/12/05"
        )
    }
}
