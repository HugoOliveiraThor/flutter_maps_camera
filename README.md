# Brasília Map with Camera

This is a Flutter application that displays a map of Brasília using **OpenStreetMap** and allows the user to take photos using the device's camera. The app also displays the user's current location on the map.

## Features

- **Interactive Map:** Displays a map of Brasília using OpenStreetMap.
- **User Location:** Shows the user's current location on the map.
- **Integrated Camera:** Allows the user to take photos directly within the app.
- **Photo Display:** Displays the captured photo in the bottom right corner of the map.

## Technologies Used

- **Flutter:** Framework for developing cross-platform applications.
- **flutter_map:** Package for displaying maps using OpenStreetMap.
- **geolocator:** Package for obtaining the user's location.
- **image_picker:** Package for accessing the camera and photo gallery.

## How to Set Up the Project

### Prerequisites

- Flutter SDK installed (version 3.x or higher).
- Android Studio or VS Code configured for Flutter development.
- Physical Android device (the camera does not work well on emulators).

### Setup Steps

1. **Clone the repository:**

   ```bash
   git clone [https://github.com/seu-usuario/maps_brasilia_osm_camera.git](https://github.com/seu-usuario/maps_brasilia_osm_camera.git)
   cd maps_brasilia_osm_camera
   ```

### Install dependencies:

    ```bash
    flutter pub get
    ```

### Configure permissions

In the android/app/src/main/AndroidManifest.xml file, ensure that the necessary permissions are configured:

XML

    ```bash
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    ```

# Create the `file_paths.xml` file:

Create an `xml` folder inside `android/app/src/main/res/`.
Inside this folder, create a file named `file_paths.xml` with the following content:

```xml
<?xml version="1.0" encoding="utf-8"?>
<paths xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)">
    <external-path name="external_files" path="."/>
</paths>
```

```bash
lib/
├── main.dart
├── screens/
│ └── map_screen.dart
└── services/
├── location_service.dart
└── camera_service.dart
```

main.dart: Main app file, responsible for starting the application.
screens/map_screen.dart: Map screen, where the map and camera are displayed.
services/location_service.dart: Service for obtaining the user's location.
services/camera_service.dart: Service for accessing the camera and photo gallery.

How to Contribute
Fork the project.
Create a branch for your feature (git checkout -b feature/new-feature).
Commit your changes (git commit -m 'Adds new feature').
Push to the branch (git push origin feature/new-feature).
Open a Pull Request.
License
This project is licensed under the MIT License. See the LICENSE file for more details.

Contact
If you have any questions or suggestions, feel free to contact:

Name: Hugo Oliveira
Email: hugooliveirahenrique@gmail.com
GitHub: HugoOliveiraThor
