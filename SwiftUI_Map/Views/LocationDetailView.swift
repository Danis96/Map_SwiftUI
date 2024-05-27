//
//  LocationDetailView.swift
//  SwiftUI_Map
//
//  Created by Danis Preldzic on 27. 5. 2024..
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var lvm: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack(content: {
                imageSection
                    .shadow(radius: 10)
                
                titleSection
                Divider()
                descriptionSection
                Divider()
                mapSection
            })
            .overlay(alignment: .topLeading) {
                Button(action: {
                    lvm.sheetLocation = nil
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .frame(width: 45, height: 45)
                        .background(.ultraThinMaterial).clipShape(RoundedRectangle(cornerRadius: 40))
                        .padding(26)
                })
                
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}


extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, content: {
            Text(location.name)
                .font(.title)
            Text(location.cityName)
                .font(.subheadline)
                .foregroundStyle(.primary)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 16, content: {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.primary)
            
            if let urlLink = URL(string: location.link) {
                Link(destination: urlLink, label: {
                    Text("Read more on Wikipedia")
                })
                .tint(.blue)
            }
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var mapSection: some View {
        Map(position: .constant(MapCameraPosition.region(MKCoordinateRegion(
            center: location.coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))))) {
                ForEach(lvm.locations) { location in
                    if lvm.mapLocation == location {
                        Annotation(location.name, coordinate: location.coordinates) {
                            LocationMapAnnotationView()
                                .shadow(radius: 10)
                        }
                    }
                }
            }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
    }
}
