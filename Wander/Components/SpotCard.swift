import SwiftUI

struct SpotCard: View {
    let imageSpot: String
    let titleSpot: String
    let locationSpot: String
    
    @State var bookmarkIcon: String = "bookmark"
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageSpot)
                .resizable()
                .frame(width: 360, height: 200)
                .padding(.bottom, -8)
           
            HStack {
                VStack(alignment: .leading) {
                    Text(titleSpot)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text(locationSpot)
                        .font(.system(size: 15))
                        .italic()
                }
                .padding(.leading, 20)
                
                Spacer()
                                
                Button {
                    if bookmarkIcon == "bookmark" {
                        bookmarkIcon = "bookmark.fill"
                    } else {
                        bookmarkIcon = "bookmark"
                    }
                } label: {
                    Image(systemName: bookmarkIcon)
                }
                .padding(.trailing, 20)
            }
            .padding(.bottom, 5)
        }
        .frame(width: 360)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20)
    }
}
