import SwiftUI

struct AppPreferencesCard: View {
    @Binding var isOn: Bool
    let optionTitle: String
    
    var body: some View {
        Toggle(optionTitle, isOn: $isOn)
            .frame(width: 300, height: 40)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}
