import SwiftUI

struct FilterExperience: View {
    @State var filterColor = Color.gray.opacity(0.3)
    @State var filterText: String
    @State var filterState = "Off"
    @State var textColor = Color.primary
    
    var body: some View {
        Button {
            if filterState == "Off" {
                filterState = "On"
                filterColor = Color.orange
                textColor = Color.white
            } else {
                filterState = "Off"
                filterColor = Color.gray.opacity(0.3)
                textColor = Color.primary
            }
        } label: {
            HStack {
                Color.clear.frame(width: 10)
                
                Text(filterText)
                    .font(.system(size: 15))
                    .foregroundColor(textColor)
                
                Spacer()
                
                Text(filterState)
                    .font(.system(size: 15))
                    .foregroundColor(textColor)
                
                Color.clear.frame(width: 8)
            }
            .frame(width: 350, height: 40)
            .background(filterColor)
            .cornerRadius(10)
        }
    }
}
