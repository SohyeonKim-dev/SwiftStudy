//
//  ContentView.swift
//  swift UI colli's cat music app
//
//  Created by 김소현 on 2022/04/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height : 300)
            
            StartView()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading) {
                Text("Hello, world!")
                .font(.title)
                .foregroundColor(.blue)
                  
                HStack {
                    Text("재미지구만 :)")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                    
                    Text("apple swift가 오늘 목표! 🍎")
                        .font(.body)
                        .fontWeight(.medium)
                    // 줄바꿈 how?
                }
                
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Descriptive text goes here.")
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
