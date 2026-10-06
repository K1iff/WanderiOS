import SwiftUI

struct MainPage: View {
    @Binding var isLoggedIn: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    HStack {
                        Color.clear.frame(width: 260, height: 0)
                        Image("wander")
                            .resizable()
                            .frame(width: 50, height: 70)
                    }
                    .padding(.bottom, 15)
                    
                    Color.clear.frame(width: 90, height: 0)
                    
                    NavigationLink {
                        ProfilePage(isLoggedIn: $isLoggedIn)
                    } label: {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.blue)
                    }
                    Color.clear.frame(width: 100, height: 0)
                }
                TabViewNavigation()
            }
        }
    }
}

#Preview {
    MainPage(isLoggedIn: .constant(false))
}
