import SwiftUI

struct LogInPage: View {
    @Binding var isLoggedIn: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowAlert: Bool = false
    @State var isRememberMe: Bool = false
    
    func login() {
        if email.isEmpty || password.isEmpty {
            isShowAlert = true
        } else {
            isLoggedIn = true
        }
    }
    
    var body: some View {
        ZStack {
            Image("bg4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.8)
            
            VStack (alignment: .center) {
                Image("wander")
                    .resizable()
                    .frame(width: 100, height: 130)
                HStack (spacing: 0) {
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
                    
                    Button(action: login) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 40)
                    
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
        .alert("Email and Password must not be empty", isPresented: $isShowAlert) {
            Button("Ok", role: .cancel) { }
        }
    }
}

#Preview {
    LogInPage(isLoggedIn: .constant(false))
}
