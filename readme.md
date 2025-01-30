# **Weather Tracker**

## **Objective**

Weather Tracker is an iOS application that provides real-time weather information for cities worldwide. Built with **SwiftUI**, **MVVM + Clean Architecture**, and **Combine**, it ensures a seamless user experience with clean code structure and efficient data handling. Users can search for a city, view its weather details, and save their selection for future reference. The app integrates with **WeatherAPI.com** to fetch accurate weather data, including temperature, humidity, UV index, and weather conditions.

---

<p align="center">
  <img src="WeatherTracker.gif" alt="Weather Animation" width="250">
</p>


## **Features**

### **1. Home Screen**
- Displays weather for a **saved city**, including:
  - City name.
  - Temperature.
  - Weather condition (with corresponding icon from the API).
  - Humidity (%).
  - UV index.
  - "Feels like" temperature.
- If no city is saved, prompts the user to search.
- **Search bar** for querying new cities.

### **2. Search Functionality**
- Displays a **search result card** for the queried city.
- Tapping a city updates the home screen with its weather and persists the selection.

### **3. Local Storage**
- Uses **UserDefaults** to persist the selected city.
- Reloads the city’s weather on app launch.

---

## **Project Structure**

The project follows **Clean Architecture** with **MVVM**.

```plaintext
WeatherTracker/
│── core/
│   ├── DependencyInjector.swift
│   ├── EndPoint.swift
│   ├── NetworkService.swift
│   ├── NetworkProtocol.swift
│
│── data/
│   ├── network/
│   │   ├── WeatherAPI.swift
│   │   ├── WeatherRemoteDataSource.swift
│   ├── repository/
│   │   ├── WeatherRepository.swift
│   │   ├── WeatherRepositoryImpl.swift
│
│── domain/
│   ├── entities/
│   │   ├── City.swift
│   │   ├── Condition.swift
│   │   ├── CurrentWeather.swift
│   │   ├── Location.swift
│   │   ├── Weather.swift
│   ├── usecases/
│   │   ├── FetchWeatherUseCase.swift
│   │   ├── SearchCityUseCase.swift
│
│── presentation/
│   ├── components/
│   ├── viewModels/
│   │   ├── WeatherViewModel.swift
│   ├── views/
│   │   ├── WeatherView.swift

```

---



### **API Integration**

- Uses **WeatherAPI.com** for weather data:
  - API Documentation: [WeatherAPI Documentation](https://www.weatherapi.com/docs/).
  - Free tier includes:
    - **Temperature**
    - **Weather condition** (including an icon URL)
    - **Humidity (%)**
    - **UV index**
    - **Feels like** temperature

### **Endpoints Used:**
- **Search City:**  
  `https://api.weatherapi.com/v1/search.json?key=YOUR_API_KEY&q=London`
- **Current Weather:**  
  `https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=London`

---

## **Tech Stack & Implementation**

### **1. Core Technologies**
- **Swift** & **SwiftUI** for UI development.
- **MVVM architecture** for separation of concerns.
- **Clean Architecture.**

### **2. API Handling**
- Fetches weather data using `WeatherAPI.com`.
- Implements error handling for invalid cities and network issues.

### **3. UI & UX**
- Matches **Figma designs** [here](https://www.figma.com/design/0zySCKWbyeRO805ifaz1lr/Weather-App-Test-Task?node-id=0-1).
- Ensures visual consistency (**95% accuracy**).

---

## **Setup Instructions**

1. Clone the repository:
   ```bash
   git clone https://github.com/HtetMoe/Nooro_WeatherTracker
   cd WeatherTracker

2. Open WeatherTracker.xcodeproj in Xcode.

3. Run the app:

    Select a simulator or device.
    Press Cmd + R to run.


