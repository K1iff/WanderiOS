import SwiftUI

struct ProfilePage: View {
    @Binding var isLoggedIn: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var showLogoutAlert = false
    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)
                    .padding(.top, 40)
                
                Text("Matt")
                    .font(.system(size: 28, weight: .bold))
                
                Text("The Explorer")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .italic()
            }
            .padding(.bottom, 30)
            
            VStack(spacing: 0) {
                ProfileDetailRow(icon: "person.fill", title: "Full Name", value: "Matt Julian Tiang")
                ProfileDetailRow(icon: "envelope.fill", title: "Email", value: "matt@example.com")
                ProfileDetailRow(icon: "calendar", title: "Birthdate", value: "January 31, 2004")
                ProfileDetailRow(icon: "figure.dress.line.vertical.figure", title: "Sex", value: "Male")
                ProfileDetailRow(icon: "mappin.and.ellipse", title: "Location", value: "Cabuyao, Laguna")
            }
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(15)
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
                showLogoutAlert = true
            }) {
                Text("Log Out")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.orange)
                    .cornerRadius(15)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .alert("Logout Confirmation", isPresented: $showLogoutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Log Out", role: .destructive) {
                    dismiss()
                    isLoggedIn = false
                }
            } message: {
                Text("Do you want logout?")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
    
#Preview {
    ProfilePage(isLoggedIn: .constant(true))
}
