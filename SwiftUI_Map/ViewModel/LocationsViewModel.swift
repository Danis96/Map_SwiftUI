//
//  LocationsViewModel.swift
//  SwiftUI_Map
//
//  Created by Danis Preldzic on 27. 5. 2024..
//

import Foundation
import MapKit
import SwiftUI


class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var cameraPositions: MapCameraPosition
    
    private var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    private var span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showListLocations: Bool = false
    
    init() {
        let location = LocationsDataService.locations
        self.locations = location
        self.mapLocation = location.first!
        self.cameraPositions = MapCameraPosition.region(mapRegion)
        self.updateMapRegion(location: location.first!)
    }
    
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeIn) {
            mapRegion =  MKCoordinateRegion(center: location.coordinates, span: span)
            cameraPositions =  MapCameraPosition.region(mapRegion)
        }
    }
    
    func toggleListLocations() {
        withAnimation(.easeIn) {
            showListLocations = !showListLocations
        }
    }
    
    func updateMapLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showListLocations = false
        }
    }
    
    
    
}