import SwiftUI
import Supabase

struct ProfilePage: View {
    @Binding var isLoggedIn: Bool
    @Environment(\.dismiss) private var dismiss
    
    @State private var showLogoutAlert = false
    @State private var isLoading = true
    
    @State private var profile: UserProfile?
    @State private var email: String = ""
    
    func fetchUserData() async {
        isLoading = true
        do {
            let user = try await supabase.auth.session.user
            self.email = user.email ?? "No Email"
            
            let fetchedProfile: UserProfile = try await supabase
                .from("profiles")
                .select()
                .eq("id", value: user.id)
                .single()
                .execute()
                .value
            
            self.profile = fetchedProfile
        } catch {
            print("Error fetching profile: \(error.localizedDescription)")
        }
        isLoading = false
    }
    
    func logout() async {
        do {
            try await supabase.auth.signOut()
            isLoggedIn = false
        } catch {
            print("Logout error: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        VStack {
            if isLoading {
                Spacer()
                ProgressView("Loading Profile...")
                Spacer()
            } else {
                VStack(spacing: 15) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .foregroundColor(.blue)
                        .padding(.top, 40)
                    
                    Text(profile?.full_name.components(separatedBy: " ").first ?? "Explorer")
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("The Explorer")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .italic()
                }
                .padding(.bottom, 30)
                
                VStack(spacing: 0) {
                    ProfileDetailRow(icon: "person.fill", title: "Full Name", value: profile?.full_name ?? "Unknown")
                    ProfileDetailRow(icon: "envelope.fill", title: "Email", value: email)
                    ProfileDetailRow(icon: "calendar", title: "Birthdate", value: profile?.birthdate ?? "Unknown")
                    ProfileDetailRow(icon: "figure.dress.line.vertical.figure", title: "Sex", value: profile?.sex ?? "Unknown")
                    ProfileDetailRow(icon: "mappin.and.ellipse", title: "Location", value: profile?.location ?? "Unknown")
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
                        Task {
                            await logout()
                        }
                    }
                } message: {
                    Text("Do you want logout?")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await fetchUserData()
        }
    }
}
    
#Preview {
    ProfilePage(isLoggedIn: .constant(true))
}
