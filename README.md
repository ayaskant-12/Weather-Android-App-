#🌤️ Mausam - Weather App
A beautiful and responsive Flutter weather application that provides real-time weather information for cities worldwide.

##📱 Features
- Real-time Weather Data: Get current temperature, humidity, wind speed, and weather conditions

- City Search: Search for weather information in any city worldwide

- Beautiful UI: Gradient backgrounds and intuitive design

- Responsive Design: Works seamlessly on different screen sizes

- Random City Suggestions: Get inspired with random city suggestions in the search placeholder

## 🛠️ Technical Stack
- Framework: Flutter

- HTTP Client: http package for API calls

- Icons: Weather Icons package

- Loading Animation: Flutter SpinKit

- API: OpenWeatherMap API

##📁 Project Structure
```
text
lib/
├── main.dart                 # App entry point and route configuration
├── Activity/
│   ├── home.dart            # Main weather display screen
│   └── loading.dart         # Loading screen with splash animation
├── Worker/
│   └── worker.dart          # API service class for weather data
└── location.dart            # Location activity (placeholder)
```
## 🚀 Getting Started
### Prerequisites
- Flutter SDK installed

- Dart SDK

- OpenWeatherMap API key

### Installation
- Clone the repository
```
bash
git clone <your-repo-url>
cd mausam
```
- Install dependencies
```
bash
flutter pub get
```
- Add your API key

-- Get a free API key from OpenWeatherMap

-- Replace the API key in worker.dart:
```
dart
var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=YOUR_API_KEY");
```
Run the app

bash
flutter run
📊 App Flow
Loading Screen: Displays splash animation while fetching initial weather data

Home Screen: Shows comprehensive weather information including:

Current temperature in Celsius

Weather description and city name

Wind speed in km/h

Humidity percentage

Weather condition icons

Search Functionality:

Tap the search icon to fetch weather for any city

Random city suggestions in the search placeholder

Input validation for empty searches

🎨 UI Components
Gradient Backgrounds: Beautiful blue gradient themes

Weather Cards: Transparent cards displaying weather metrics

Search Bar: Custom search bar with rounded corners

Weather Icons: Dynamic icons from OpenWeatherMap

Loading Animation: Wave-style loading indicator

🔧 Configuration
Routes
/ - Loading screen (initial route)

/home - Main weather display

/loading - Loading screen with search functionality

Default Cities
The app includes a predefined list of cities for random suggestions:

Mumbai, Delhi, Chennai, Dhar, Indore, Bhubaneswar, London

📸 Screens
Loading Screen: App logo with wave loading animation

Home Screen:

Search bar at the top

Weather condition and city

Temperature display

Wind speed and humidity cards

Footer credits

🛡️ Error Handling
Network request error handling

Invalid city name handling

Empty search validation

Default values for missing data

📝 Dependencies
Add these to your pubspec.yaml:

yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
  weather_icons: ^3.0.0
  flutter_spinkit: ^5.1.0
👨‍💻 Developer
Ayaskant
Flutter Developer
