import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var showSplash = false
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView(showSplash: $showSplash)
            } else {
                NavigationStack {
                    MyApp(isLoggedIn: $isLoggedIn)
                }
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .transition(.opacity)
            }
        }
    }
}

#Preview {
    ContentView()
}
