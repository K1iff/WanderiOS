import SwiftUI

struct DayHeader: View {
    let day: String
    let date: String
    
    var body: some View {
        HStack {
            Text(day)
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Text(date)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.top, 10)
    }
}
