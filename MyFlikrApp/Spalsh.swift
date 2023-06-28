//
//  Spalsh.swift
//  MyFlikrApp
//
//  Created by Guillermo Ruiz Baires on 28/6/23.
//

import SwiftUI

struct Spalsh: View {
    var body: some View {
        VStack {
            Text("Flikr Photos")
                .font(.largeTitle)
                .bold()
                
        }
        .padding(.horizontal, 88)
        .padding(.vertical, 0)
        .frame(width: 375, height: 812, alignment: .center)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        
    }
}

struct Spalsh_Previews: PreviewProvider {
    static var previews: some View {
        Spalsh()
    }
}
