# Wander - iOS 🗺️

A Swift-based mobile application designed to help users explore the beautiful destinations of the Philippines. This app leverages SwiftUI for its user interface and Supabase for backend services, enabling features like user authentication, destination browsing, and itinerary planning.

[![Swift](https://img.shields.io/badge/Swift-5.9-orange)](https://developer.apple.com/swift/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0-blue)](https://developer.apple.com/xcode/swiftui/)
[![Supabase](https://img.shields.io/badge/Supabase-Connected-green)](https://supabase.com/)

## ✨ Features

*   **User Authentication:** Secure sign-up and login with email and password using Supabase.
*   **Explore Destinations:** Browse a curated list of Philippine destinations with details, images, and location.
*   **Interactive Map:** View destination locations on an interactive map.
*   **Itinerary Planning:** Save favorite spots and plan your trips with a day-by-day itinerary.
*   **User Profiles:** Manage your personal information and preferences.
*   **Dark Mode Support:** Enjoy a comfortable viewing experience with dark mode.
*   **Travel Settings:** Customize units and currency for your travel plans.

## 🚀 Tech Stack

*   **Language:** Swift
*   **UI Framework:** SwiftUI
*   **Backend:** Supabase
*   **Database:** PostgreSQL (via Supabase)
*   **Authentication:** Supabase Auth

## 🛠️ Installation

1.  **Prerequisites:**
    *   Xcode 15 or later
    *   macOS 13.0 or later
    *   Swift 5.9 or later

2.  **Clone the Repository:**
    ```bash
    git clone https://github.com/K1iff/WanderiOS.git
    cd WanderiOS
    ```

3.  **Open in Xcode:**
    Open the `Wander.xcodeproj` file in Xcode.

4.  **Configure Supabase (if necessary):**
    The Supabase client is initialized in `Wander/App/SupabaseManager.swift`. If you are running this project with your own Supabase project, ensure the `supabaseURL` and `supabaseKey` are updated accordingly.

    ```swift
    // Wander/App/SupabaseManager.swift
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "YOUR_SUPABASE_URL")!,
        supabaseKey: "YOUR_SUPABASE_KEY"
    )
    ```

5.  **Run the Application:**
    Select your desired simulator or device and click the Run button in Xcode.

## 📝 How to Use

1.  **Splash Screen:** Upon launching the app, you will see a splash screen with the WanderiOS logo and tagline.

2.  **Authentication:**
    *   **Login:** Enter your email and password to log in. If you don't have an account, tap "Don't have an account? Create Now!".
    *   **Sign Up:** Fill in your personal details and account information to create a new account.

3.  **Navigation:** The app uses a tab bar for primary navigation:
    *   **Explore 🧭:** Discover various destinations in the Philippines. You can filter destinations by experience type.
    *   **My Itinerary 🗓️:** View your planned trips and saved locations.
    *   **Settings ⚙️:** Customize app preferences like dark mode and travel settings.

4.  **Exploring Destinations:**
    *   Tap on a destination card in the "Explore" tab to view its details.
    *   The destination detail page includes images, location, history, opening hours, and an interactive map.
    *   You can save a destination to your itinerary from this page.

5.  **Profile:** Access your profile from the top right corner of the "Main Page" (after login). Here you can view your details and log out.

## 📂 Project Structure

```
WanderiOS/
├── Wander/
│   ├── App/
│   │   ├── MyApp.swift         // Main App View Logic
│   │   ├── SupabaseManager.swift // Supabase Client Configuration
│   │   └── WanderApp.swift     // App Entry Point
│   ├── Assets.xcassets/
│   │   └── ...                 // App Assets
│   ├── Components/
│   │   ├── AppPreferencesCard.swift
│   │   ├── DayHeader.swift
│   │   ├── FilterExperience.swift
│   │   ├── ItineraryCard.swift
│   │   ├── ProfileDetailRow.swift
│   │   ├── SpotCard.swift
│   │   └── TravelSettingsCard.swift
│   ├── Navigation/
│   │   └── TabViewNavigation.swift // Tab Bar Navigation
│   ├── Views/
│   │   ├── Auth/
│   │   │   ├── CreateAcctPage.swift
│   │   │   └── LogInPage.swift
│   │   ├── Explore/
│   │   │   ├── DestinationPage.swift
│   │   │   └── ExplorePage.swift
│   │   ├── Itinerary/
│   │   │   └── ItineraryPage.swift
│   │   ├── Main/
│   │   │   └── MainPage.swift
│   │   ├── Profile/
│   │   │   └── ProfilePage.swift
│   │   └── Settings/
│   │       └── SettingPage.swift
│   └── Views/Splash/
│       └── SplashScreenView.swift
├── Wander.xcodeproj/
│   └── ...                   // Xcode Project Configuration
└── README.md
```

## 🤝 Contributing

Contributions are welcome! Please feel free to:

*   Fork the repository.
*   Create a new branch for your feature (`git checkout -b feature/AmazingFeature`).
*   Commit your changes (`git commit -m 'Add some AmazingFeature'`).
*   Push to the branch (`git push origin feature/AmazingFeature`).
*   Open a Pull Request.

Please ensure your code adheres to the existing style and includes relevant tests if applicable.

## 🔗 Important Links

*   **Repository:** [https://github.com/K1iff/WanderiOS](https://github.com/K1iff/WanderiOS)
*   **Supabase:** [https://supabase.com/](https://supabase.com/)

---

> Built with ❤️ by K1iff
> 
> ⭐ [Star this repo](https://github.com/K1iff/WanderiOS)
> 👍 [Like this project](https://github.com/K1iff/WanderiOS)
> 🐛 [Report an issue](https://github.com/K1iff/WanderiOS/issues)


---
**<p align="center">Generated by [ReadmeCodeGen](https://www.readmecodegen.com/)</p>**
