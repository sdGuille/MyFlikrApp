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
        ZStack {
            VStack{
                HStack {
                    Text(title)
                        .font(.title2.bold())
                }
                .padding(.top, 20)
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: 745)
            }
            
            VStack(alignment: .leading){
                Spacer()
                
                Text("Owner: \(owner)")
                Text("taken at: \(date)")
                Text(description)
                    .multilineTextAlignment(.leading)
                    .padding([.bottom, .trailing], 28)

            }
            .bold()
            .font(.system(size: 12))
            .foregroundColor(Color(red: 1, green: 1, blue: 1))
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "ImageDetail",
                   title: "Image Title",
                   description: "Lorem ipsum dolor sit amet deos asd oihsl shjkjj ddjiiue eueuofo soduo soo",
                   owner: "@owner",
                   date: "12/12/05"
        )
    }
}
