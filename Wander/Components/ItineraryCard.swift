import SwiftUI

struct ItineraryCard: View {
    let time: String
    let imageSpot: String
    let titleSpot: String
    let locationSpot: String
    
    var body: some View {
        HStack(spacing: 15) {
            Text(time)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 70, alignment: .leading)
            
            HStack(spacing: 0) {
                Image(imageSpot)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(titleSpot)
                        .font(.system(size: 16, weight: .semibold))
                        .lineLimit(1)
                    
                    Text(locationSpot)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                        .italic()
                        .lineLimit(1)
                }
                .padding(.horizontal, 10)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
                    .padding(.trailing, 15)
            }
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)
        }
    }
}
