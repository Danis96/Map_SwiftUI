# SwiftUI Map Application

A modern iOS application built with SwiftUI that provides an interactive map interface with location management capabilities. This application demonstrates the power of SwiftUI's MapKit integration and follows MVVM architecture patterns.

## Features

- Interactive map interface with custom annotations
- Location list view with smooth transitions
- Location preview cards
- Detailed location information sheets
- Responsive design supporting both iPhone and iPad
- Material design elements for modern UI
- Smooth animations and transitions

## Project Structure

```
SwiftUI_Map/
├── DataService/        # Data management and services
├── Models/            # Data models and structures
├── Views/             # SwiftUI view components
│   ├── LocationsView.swift
│   ├── LocationDetailView.swift
│   ├── LocationListView.swift
│   ├── LocationMapAnnotationView.swift
│   └── LocationPreviewView.swift
├── ViewModel/         # View models for business logic
│   └── LocationsViewModel.swift
└── Assets.xcassets/   # Application assets
```

## Technical Details

### Architecture
- Built using MVVM (Model-View-ViewModel) architecture
- Utilizes SwiftUI's environment objects for state management
- Implements modern SwiftUI features and best practices

### Key Components

#### Views
- `LocationsView`: Main view containing the map and location interface
- `LocationDetailView`: Detailed information sheet for selected locations
- `LocationListView`: List view of all available locations
- `LocationMapAnnotationView`: Custom map annotation view
- `LocationPreviewView`: Preview card for selected location

#### ViewModel
- `LocationsViewModel`: Manages location data and map state
  - Handles location selection
  - Manages map camera position
  - Controls UI state (list visibility, sheet presentation)

### Dependencies
- SwiftUI
- MapKit

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Installation

1. Clone the repository
2. Open `SwiftUI_Map.xcodeproj` in Xcode
3. Build and run the project

## Usage

1. Launch the application
2. Interact with the map to view different locations
3. Tap on map annotations to select locations
4. Use the header menu to toggle the location list
5. Tap on location previews to view detailed information

## Author

Created by Danis Preldzic

## License

This project is proprietary and confidential.