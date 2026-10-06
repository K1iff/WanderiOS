import SwiftUI

struct SplashScreenView: View {
    @Binding var showSplash: Bool
    @State private var logoScale: CGFloat = 0.6
    @State private var logoOpacity: Double = 0.0
    @State private var textOffset: CGFloat = 20
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                Image("wander")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                HStack (spacing: 0){
                    Text("Wan")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.orange)
                    Text("der")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.blue)
                }
                .opacity(logoOpacity)
                .offset(y: textOffset)
                
                Text("Explore the Philippines")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
                    .opacity(logoOpacity)
                    .offset(y: textOffset)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.2)) {
                logoScale = 1.0
                logoOpacity = 1.0
                textOffset = 0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    SplashScreenView(showSplash: .constant(true))
}
