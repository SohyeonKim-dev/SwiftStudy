//
//  StartView.swift
//  swift UI colli's cat music app
//
//  Created by 김소현 on 2022/04/29.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        Image("cat1")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
