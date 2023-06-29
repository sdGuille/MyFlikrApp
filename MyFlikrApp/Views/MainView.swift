//
//  ContentView.swift
//  MyFlikrApp
//
//  Created by Guillermo Ruiz Baires on 28/6/23.
//

import SwiftUI

struct MainView: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            
            VStack {
                VStack {
                    Text("Photos Challenge")
                        .font(.title3)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red:0.02, green: 0.02, blue: 0.02))
                        .padding(.top)
                }
                .foregroundColor(.clear)
                .frame(width: 375, height: 88)
                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                .shadow(color: Color(red: 0.65, green: 0.65, blue: 0.67), radius: 0, x: 0, y: 0.33)
                
                Spacer()
                
                Text("Find Flickr photos by searching names in the search bar below")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.6))
                    .frame(width: 270, height: 81, alignment: .top)
                Spacer()
                Spacer()
                
                HStack {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .font(.largeTitle)
                    //                        .frame(width: 22.57567, height: 21.57863)
                        .foregroundColor(.black)
                        .padding(.trailing)
                    TextField("Search a name", text: $searchText)
                        .foregroundColor(Color(red: 0.02, green: 0.02, blue: 0.02))
                        .frame(width: 223.88779, height: 13, alignment: .center)
                    
                    
                }
                .foregroundColor(.clear)
                .frame(width: 344, height: 46)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
                
                
            }
        }
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
