import SwiftUI

struct MyApp: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            if isLoggedIn {
                MainPage(isLoggedIn: $isLoggedIn)
            } else {
                LogInPage(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    MyApp(isLoggedIn: .constant(false))
}
