import SwiftUI
import Supabase

struct UserProfile: Codable {
    let id: UUID
    let full_name: String
    let birthdate: String
    let sex: String
    let location: String
}

struct CreateAcctPage: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var fullName = ""
    @State private var email = ""
    @State private var birthdate = Date()
    @State private var sex = "Select"
    @State private var location = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var agreeToTerms = false
    
    @State private var isLoading = false
    @State private var errorMessage = ""
    @State private var showError = false
    
    let sexOptions = ["Select", "Male", "Female", "Prefer not to say"]
    
    func createAccount() async {
        if password != confirmPassword {
            errorMessage = "Passwords do not match."
            showError = true
            return
        }
        
        isLoading = true
        do {
            let response = try await supabase.auth.signUp(email: email, password: password)
            let user = response.user
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dateString = formatter.string(from: birthdate)
            
            let profile = UserProfile(
                id: user.id,
                full_name: fullName,
                birthdate: dateString,
                sex: sex,
                location: location
            )
            
            try await supabase.from("profiles").insert(profile).execute()
            dismiss()
        } catch {
            errorMessage = error.localizedDescription
            showError = true
        }
        isLoading = false
    }
    
    var body: some View {
        VStack {
            Text("Create Account")
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 20)
            
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Full Name", text: $fullName)
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                    Picker("Sex", selection: $sex) {
                        ForEach(sexOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Location", text: $location)
                }
                
                Section(header: Text("Account Details")) {
                    TextField("Email Address", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    SecureField("Password", text: $password)
                    SecureField("Confirm Password", text: $confirmPassword)
                }
                
                Section {
                    Toggle("I agree to the Terms and Conditions", isOn: $agreeToTerms)
                        .tint(.orange)
                }
            }
            .scrollContentBackground(.hidden)
            
            HStack(spacing: 20) {
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    Task {
                        await createAccount()
                    }
                }) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.orange)
                            .cornerRadius(10)
                    } else {
                        Text("Create")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                }
                .disabled(!agreeToTerms || isLoading)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationBarBackButtonHidden(true)
        .alert("Error", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
}

#Preview {
    CreateAcctPage()
}
