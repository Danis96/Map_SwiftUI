//
//  LocationPreviewView.swift
//  SwiftUI_Map
//
//  Created by Danis Preldzic on 27. 5. 2024..
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject var lvm: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, content: {
            VStack(content: {
                imageSection
                titleSection
            }).frame(maxWidth: .infinity, alignment: .leading)
            VStack(content: {
                learnMoreButton
                nextButton
            })
        }).padding(20)
          .background(
              RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    ZStack(content: {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            
        
    }).environmentObject(LocationsViewModel())
    
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        VStack(content: {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(6)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        })
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 5.0, content: {
            Text(location.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.headline)
                .fontWeight(.regular)
        })
    }
    
    private var learnMoreButton: some View {
        Button(action: {}, label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 100)
        }).buttonStyle(.borderedProminent)
           
    }

    private var nextButton: some View {
        Button(action: {
            lvm.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .frame(width: 100)
        }).buttonStyle(.bordered)
    }
}
