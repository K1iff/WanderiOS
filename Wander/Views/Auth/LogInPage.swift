import SwiftUI
import Supabase

struct LogInPage: View {
    @Binding var isLoggedIn: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isLoading = false
    @State private var isShowAlert: Bool = false
    @State private var alertMessage = ""
    @State var isRememberMe: Bool = false
    
    func login() async {
        if email.isEmpty || password.isEmpty {
            alertMessage = "Email and Password must not be empty"
            isShowAlert = true
            return
        }
        
        isLoading = true
        do {
            _ = try await supabase.auth.signIn(email: email, password: password)
        } catch {
            alertMessage = error.localizedDescription
            isShowAlert = true
        }
        isLoading = false
    }
    
    var body: some View {
        ZStack {
            Image("bg4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.8)
            
            VStack(alignment: .center) {
                Image("wander")
                    .resizable()
                    .frame(width: 100, height: 130)
                HStack(spacing: 0) {
                    Text("Wan")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.orange)
                    Text("der")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.blue)
                }
                .padding()
                Form {
                    TextField("Email Address", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    SecureField("Password", text: $password)
                        .keyboardType(.asciiCapable)
                        .textContentType(.password)
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .scrollContentBackground(.hidden)
                VStack {
                    Toggle("Remember Me", isOn: $isRememberMe)
                        .font(.system(size: 15).bold())
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                    
                    Button(action: {
                        Task {
                            await login()
                        }
                    }) {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(10)
                        } else {
                            Text("Log In")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 40)
                    .disabled(isLoading)
                    
                    NavigationLink {
                        CreateAcctPage()
                    } label: {
                        Text("Don't have an account? Create Now!")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .underline()
                            .padding(.top, 10)
                    }
                }
            }
        }
        .alert("Login Failed", isPresented: $isShowAlert) {
            Button("Ok", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    LogInPage(isLoggedIn: .constant(false))
}
