//
//  LocationMapAnnotationView.swift
//  SwiftUI_Map
//
//  Created by Danis Preldzic on 27. 5. 2024..
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        VStack(content: {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 36))
            
                Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accent)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(180))
                .offset(y: -10)
                .padding(.bottom, 40)
            
        })
    }
}

#Preview {
    LocationMapAnnotationView()
}
