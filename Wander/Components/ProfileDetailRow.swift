import SwiftUI

struct ProfileDetailRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.blue)
                .frame(width: 30)
            
            Text(title)
            Spacer()
            Text(value)
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(.primary)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
    }
}
