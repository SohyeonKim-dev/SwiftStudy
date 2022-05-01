//
//  LandmarkList.swift
//  swift UI colli's cat music app
//
//  Created by 김소현 on 2022/05/01.
//


import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = true
    // false -> 전체 list 보여줌
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }


    var body: some View {
        NavigationView {
            List(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
