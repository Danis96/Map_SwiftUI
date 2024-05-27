//
//  LocatioListView.swift
//  SwiftUI_Map
//
//  Created by Danis Preldzic on 27. 5. 2024..
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var lvm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(lvm.locations) { location in
                Button(action: {
                    lvm.updateMapLocation(location: location)
                }, label: {
                    listItem(location: location)
                       
                })
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
            
        }.listStyle(PlainListStyle())
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
    }
}

#Preview {
    LocationListView()
        .environmentObject(LocationsViewModel())
}

extension LocationListView {
    private func listItem(location: Location) -> some View {
        HStack(content: {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading, content: {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }).background(.clear)
    }
}
