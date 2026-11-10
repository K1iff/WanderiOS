# Wander - iOS 🗺️

[![Swift](https://img.shields.io/badge/Swift-5.9%2B-orange.svg?style=flat&logo=swift)](https://developer.apple.com/swift/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0-blue.svg?style=flat&logo=swift)](https://developer.apple.com/xcode/swiftui/)
[![Supabase](https://img.shields.io/badge/Supabase-Connected-green.svg?style=flat&logo=supabase)](https://supabase.com/)
[![Xcode](https://img.shields.io/badge/Xcode-15%2B-blue.svg?style=flat&logo=xcode)](https://developer.apple.com/xcode/)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017%2B-lightgrey.svg?style=flat&logo=apple)](https://www.apple.com/ios/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A modern Swift-based mobile application crafted with SwiftUI and Supabase to discover, explore, and plan travel itineraries across breathtaking destinations in the Philippines.

```
+-------------------------------------------------------------------------+
|                                                                         |
|                       [ App Screenshot / Demo UI ]                      |
|                                                                         |
|            Explore Destinations  *  Interactive Maps  *  Itinerary       |
|                                                                         |
+-------------------------------------------------------------------------+
```

---

## 2. Key Features

- **User Authentication & Session Management:**
  - Secure account registration with full name, birthdate, sex, location, email, and password via Supabase Auth (`CreateAcctPage`).
  - Streamlined login with credentials verification, session persistence, and real-time auth state listener (`LogInPage`, `ContentView`).
  - Seamless logout with user confirmation alert dialog (`ProfilePage`).

- **Destination Discovery & Experience Filtering:**
  - Dynamic destination catalog fetched in real-time from Supabase database (`ExplorePage`).
  - Visual cards with destination imagery, title, and location overview (`SpotCard`).
  - Experience filter modal drawer supporting categories including *Culture & Heritage*, *Nature & Outdoors*, *Foods & Drink*, *Nightlife*, *Arts & Entertainment*, and *Wellness* (`FilterExperience`).

- **Rich Destination Details & Interactive Maps:**
  - Comprehensive view showcasing location historical background and operating schedules (`DestinationPage`).
  - Embedded interactive MapKit view featuring coordinate markers for destination geography (`Map`, `Marker`).
  - Toggleable bookmarking and action button to save or remove locations from trips.

- **Trip Itinerary Planning:**
  - Day-by-day scheduled itinerary dashboard organized with date headers (`DayHeader`).
  - Time-slotted attraction cards presenting thumbnail previews, spot names, and city tags (`ItineraryCard`).

- **User Profile & Account Insights:**
  - Visual profile dashboard displaying user badge, explorer title, and detailed info rows (`ProfileDetailRow`).
  - Profile retrieval from Supabase `profiles` table matching authenticated UUIDs (`ProfilePage`).

- **Personalization & Travel Settings:**
  - System-wide Dark Mode and Light Mode switching with `@AppStorage` persistence (`WanderApp`, `SettingPage`).
  - Preference toggles for Push Notifications and Location Services (`AppPreferencesCard`).
  - Travel customization for Distance Units (Imperial / Metric) and Default Currency (`PHP`, `USD`, `EUR`, `GBP`, `AUD`) (`TravelSettingsCard`).

- **Interactive UI & Fluid Launch:**
  - Animated branded splash screen with smooth logo scaling, opacity transitions, and automatic dismissal (`SplashScreenView`).
  - Native bottom tab bar navigation bridging Explore, My Itinerary, and Settings (`TabViewNavigation`).

---

## 3. Tech Stack

| Category | Technology / Library | Version / Requirement | Description |
| :--- | :--- | :--- | :--- |
| **Frontend / Native UI** | Swift | `5.9+` | Primary programming language |
| **Frontend / Native UI** | SwiftUI | `3.0` (iOS 17+) | Declarative user interface framework |
| **Frontend / Native UI** | MapKit | System Framework | Interactive destination mapping and marker rendering |
| **Backend / API** | Supabase Swift SDK (`supabase-swift`) | `2.55.3` (>= `2.5.1`) | Backend-as-a-Service Swift client for Auth and Data |
| **Backend / API** | Swift Concurrency Extras (`swift-concurrency-extras`) | `1.4.1` | Concurrency and async primitives for Swift |
| **Backend / API** | Swift HTTP Types (`swift-http-types`) | `1.8.0` | Standard HTTP types and structures |
| **Backend / API** | Swift Clocks (`swift-clocks`) | `1.1.1` | Clock scheduling utilities for asynchronous tasks |
| **Database & Auth** | Supabase Auth (GoTrue) | Built into SDK | User registration, authentication, and session handling |
| **Database & Auth** | Supabase Database (PostgreSQL) | Managed Cloud | Relational database (`destinations`, `profiles` tables) |
| **Database & Auth** | Apple Swift Crypto (`swift-crypto`) | `4.5.2` | Cryptographic operations and token validations |
| **Database & Auth** | Apple Swift ASN.1 (`swift-asn1`) | `1.7.3` | ASN.1 parser used for cryptographic payloads |
| **Hosting & Tools** | Xcode | `15.0+` | Apple Integrated Development Environment |
| **Hosting & Tools** | Swift Package Manager (SPM) | Swift 5.9+ | Native dependency management |
| **Hosting & Tools** | macOS | `13.0+` (Ventura or later) | Development operating system requirement |

---

## 4. Getting Started

### Prerequisites

Ensure you have the following installed on your machine:
- **macOS:** version `13.0` (Ventura) or later
- **Xcode:** version `15.0` or later
- **Swift:** version `5.9` or later
- **Active Supabase Account:** for backend database and authentication

### Clone the Repository

Clone the project from GitHub and navigate into the workspace directory:

```bash
git clone https://github.com/K1iff/WanderiOS.git
cd WanderiOS
```

### Dependency Installation

Dependencies are managed through Swift Package Manager (SPM) embedded within the Xcode project:

1. Open `Wander.xcodeproj` in Xcode:
   ```bash
   open Wander.xcodeproj
   ```
2. Xcode will automatically resolve and download the required Swift packages defined in `Package.resolved` (including `supabase-swift`).
3. To manually resolve or update packages via terminal or Xcode:
   - In Xcode: Navigate to **File** > **Packages** > **Resolve Package Versions**.
   - Via command line:
     ```bash
     xcodebuild -resolvePackageDependencies -project Wander.xcodeproj
     ```

### Local Server & Simulator Startup

1. Launch Xcode and open `Wander.xcodeproj`.
2. Select your target simulator (e.g., **iPhone 15 Pro** or **iPhone 16**) from the scheme dropdown at the top.
3. Press `Cmd + R` or click the **Play** (Run) button to build and run the application in the iOS Simulator.

---

## 5. Environment Variables

Supabase credentials are required to connect authentication and data services. Configure the connection parameters in `Wander/App/SupabaseManager.swift`:

```env
# Supabase Configuration Keys
SUPABASE_URL=https://your-project-ref.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.your-anon-jwt-token-here
```

In the codebase, these parameters initialize the global Supabase client instance:

```swift
// Wander/App/SupabaseManager.swift
import Foundation
import Supabase

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://your-project-ref.supabase.co")!,
    supabaseKey: "your-anon-jwt-token-here"
)
```

> **Note:** For security in production, replace hardcoded values with configuration files or scheme-based build configurations that load securely at build time.

---

## 6. Project Structure

```
WanderiOS/
├── README.md                                 # Project documentation
├── Wander.xcodeproj/                         # Xcode project configuration
│   ├── project.pbxproj                       # Build settings, targets, and file references
│   └── project.xcworkspace/
│       ├── contents.xcworkspacedata          # Workspace configuration
│       └── xcshareddata/
│           └── swiftpm/
│               └── Package.resolved          # SPM pinned package dependencies
└── Wander/                                   # Application source code
    ├── ContentView.swift                     # Root view coordinator (splash, auth & main flow)
    ├── App/                                  # App lifecycle & service configurations
    │   ├── MyApp.swift                       # Navigation flow handler based on login state
    │   ├── SupabaseManager.swift             # Supabase client initialization
    │   └── WanderApp.swift                   # Main app entry point (@main)
    ├── Assets.xcassets/                      # Graphic assets, icons, and colors
    │   ├── AccentColor.colorset              # System accent color definitions
    │   ├── AppIcon.appiconset                # Application icons
    │   ├── bg4.imageset                      # Login background artwork
    │   └── wander.imageset                   # Wander brand logo assets
    ├── Components/                           # Modular reusable UI components
    │   ├── AppPreferencesCard.swift          # Toggle setting card (notifications, dark mode)
    │   ├── DayHeader.swift                   # Date and day header component for itinerary
    │   ├── FilterExperience.swift            # Experience filter toggle button
    │   ├── ItineraryCard.swift               # Time-stamped travel destination card
    │   ├── ProfileDetailRow.swift            # Key-value row with SF Symbol icon
    │   ├── SpotCard.swift                    # Destination image card with bookmark button
    │   └── TravelSettingsCard.swift          # Picker settings for distance units and currency
    ├── Navigation/                           # Navigation scaffolding
    │   └── TabViewNavigation.swift           # Main bottom TabView (Explore, Itinerary, Settings)
    └── Views/                                # Screen views grouped by feature module
        ├── Auth/                             # Authentication views
        │   ├── CreateAcctPage.swift          # Account registration form and profile creation
        │   └── LogInPage.swift               # Login screen with credentials form
        ├── Explore/                          # Destination discovery views
        │   ├── DestinationPage.swift         # Destination detail page with MapKit map
        │   └── ExplorePage.swift             # Destination feed with category filter sheet
        ├── Itinerary/                        # Travel schedule views
        │   └── ItineraryPage.swift           # Multi-day itinerary schedule view
        ├── Main/                             # Main logged-in dashboard
        │   └── MainPage.swift                # Main wrapper view hosting TabView and profile link
        ├── Profile/                          # User account profile
        │   └── ProfilePage.swift             # User profile screen, stats, and sign-out action
        ├── Settings/                         # Application settings
        │   └── SettingPage.swift             # Settings dashboard (app preferences & travel options)
        └── Splash/                           # Onboarding and launch views
            └── SplashScreenView.swift        # Animated launch screen view
```

---

## 7. Scripts & Testing

Execute these terminal commands from the repository root for development, build, formatting, and testing workflows:

### Resolve Dependencies
```bash
xcodebuild -resolvePackageDependencies -project Wander.xcodeproj
```

### Build for Development (Simulator)
```bash
xcodebuild build \
  -project Wander.xcodeproj \
  -scheme Wander \
  -destination 'generic/platform=iOS Simulator' \
  CODE_SIGNING_ALLOWED=NO
```

### Build for Release / Archiving
```bash
xcodebuild archive \
  -project Wander.xcodeproj \
  -scheme Wander \
  -archivePath ./build/Wander.xcarchive \
  CODE_SIGNING_ALLOWED=NO
```

### Run Tests
```bash
xcodebuild test \
  -project Wander.xcodeproj \
  -scheme Wander \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro,OS=latest'
```

### Linting & Formatting (Optional Tooling)
```bash
# If SwiftLint is installed (brew install swiftlint)
swiftlint lint --path Wander

# If swift-format is installed (brew install swift-format)
swift-format lint --recursive Wander
```

### Clean Build Folder
```bash
xcodebuild clean -project Wander.xcodeproj -scheme Wander
```

---

## 8. License & Contact

### License
This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.

### Maintainer & Contact
- **Creator / Maintainer:** [Ryzel Realon (K1iff)](https://github.com/K1iff)
- **Repository:** [https://github.com/K1iff/WanderiOS](https://github.com/K1iff/WanderiOS)
- **Issue Tracker:** [https://github.com/K1iff/WanderiOS/issues](https://github.com/K1iff/WanderiOS/issues)
- **Supabase Documentation:** [https://supabase.com/docs](https://supabase.com/docs)

---

> Built with ❤️ by [K1iff](https://github.com/K1iff)
>
> ⭐ [Star this repo](https://github.com/K1iff/WanderiOS) &nbsp;|&nbsp; 👍 [Like this project](https://github.com/K1iff/WanderiOS) &nbsp;|&nbsp; 🐛 [Report an issue](https://github.com/K1iff/WanderiOS/issues)
