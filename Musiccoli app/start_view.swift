//
//  ContentView.swift
//  musiccoli
//
//  Created by 김소현 on 2022/05/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack {
                Color.green.opacity(0.2)
                    .frame(width: 400, height: 600)
                
                Image("cat1")
                    .resizable()
                    .frame(width: 300, height: 300)
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
