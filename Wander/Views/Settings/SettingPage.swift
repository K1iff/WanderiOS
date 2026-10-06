import SwiftUI

struct SettingPage: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var pushNotifications = false
    @State private var locationServices = false
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 25, weight: .bold))
                .padding(.trailing, 230)
                .padding(.bottom, 20)

            Text("App Preferences")
                .padding(.trailing, 200)
            VStack {
                AppPreferencesCard(isOn: $pushNotifications, optionTitle: "Push Notifications")
                AppPreferencesCard(isOn: $isDarkMode, optionTitle: "Dark Mode")
                AppPreferencesCard(isOn: $locationServices, optionTitle: "Location Services")
            }
            
            Color.clear.frame(height: 20)
            
            Text("Travel Settings")
                .padding(.trailing, 200)

            VStack {
                TravelSettingsCard()
            }
            
            Spacer()
        }
    }
}

#Preview {
    SettingPage()
}
