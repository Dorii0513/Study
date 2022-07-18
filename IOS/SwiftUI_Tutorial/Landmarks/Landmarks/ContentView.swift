//
//  ContentView.swift
//  Landmarks
//
//  Created by 김예림 on 2022/06/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            MapView()
                .frame(height: 400)
                .ignoresSafeArea(edges: .top)
            
            CircleImage()
                .offset(y: -150)
                .padding(.bottom, -140)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                    .padding(2.0)
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                    .padding(8.0)
                
                Text("About Turtle Rock is ...")
                    .font(.headline)
                    .fontWeight(.light)
                    .padding(2.0)
                Text("Descriptive text goes here. Wow, Swift is very fun! I love it. perfect")
                    .font(.subheadline)
                    .fontWeight(.ultraLight)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
