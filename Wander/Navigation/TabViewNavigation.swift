import SwiftUI

struct TabViewNavigation: View {
    var body: some View {
        TabView {
            ExplorePage()
                .tabItem {
                    Image(systemName: "safari")
                    Text("Explore")
                }
            
            ItineraryPage()
                .tabItem {
                    Image(systemName: "map.circle")
                    Text("My Itinerary")
                }
            
            SettingPage()
                .tabItem {
                    Image(systemName: "gear.circle")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    TabViewNavigation()
}
