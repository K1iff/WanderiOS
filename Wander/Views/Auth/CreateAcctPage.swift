import SwiftUI

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
    
    let sexOptions = ["Select", "Male", "Female", "Prefer not to say"]
    
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
                    dismiss()
                }) {
                    Text("Create")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color(UIColor.systemGroupedBackground))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CreateAcctPage()
}
