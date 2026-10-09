import SwiftUI
import Supabase

struct ContentView: View {
    @State private var isLoggedIn = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var showSplash = true
    
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
        .task {
            do {
                _ = try await supabase.auth.session
                isLoggedIn = true
            } catch {
                isLoggedIn = false
            }
            
            for await state in await supabase.auth.authStateChanges {
                if state.event == .signedIn {
                    isLoggedIn = true
                } else if state.event == .signedOut {
                    isLoggedIn = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
