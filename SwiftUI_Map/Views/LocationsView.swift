//
//  LocationsView.swift
//  SwiftUI_Map
//
//  Created by Danis Preldzic on 27. 5. 2024..
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    
    var body: some View {
        ZStack(content: {
            Map(position: $locationsViewModel.cameraPositions)
                .ignoresSafeArea()
            header
                .padding(.horizontal)
            
            
        })
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack(alignment: .leading, content: {
            
            headerMenu
            
            if locationsViewModel.showListLocations {
                LocationListView()
            }
            
            Spacer()
            
            ZStack(content: {
                ForEach(locationsViewModel.locations, content: { location in
                    if locationsViewModel.mapLocation == location {
                        LocationPreviewView(location: location)
                            .transition(AsymmetricTransition(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)))
                    }
                })
            })
            
        })
        .shadow(radius: 10, y: 10)
    }
    
    private var headerMenu: some View {
        Button(action: {
            locationsViewModel.toggleListLocations()
        }, label: {
            Text(locationsViewModel.mapLocation.name + " " + locationsViewModel.mapLocation.cityName)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(height: 50)
                .animation(.none, value: locationsViewModel.mapLocation)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .padding()
                        .rotationEffect(Angle(degrees: locationsViewModel.showListLocations ? 180 : 0))
                    
                }
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }).foregroundStyle(.primary)
    }
}
