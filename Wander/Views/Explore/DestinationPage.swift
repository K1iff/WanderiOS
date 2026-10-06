import SwiftUI

struct DestinationPage: View {
    let imageSpot: String
    let titleSpot: String
    let locationSpot: String
    let historyText: String
    let timeTable: String
    
    @State var isSaved: Bool = false
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(imageSpot)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .ignoresSafeArea(edges: .top)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.red)
                        Text(locationSpot)
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                            .italic()
                    }
                }
                .padding(.horizontal, 20)
                
                Divider()
                    .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("About this Destination")
                        .font(.system(size: 22, weight: .bold))
                    
                    Text(historyText)
                        .font(.system(size: 16))
                        .lineSpacing(5)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Opening Hours")
                        .font(.system(size: 22, weight: .bold))
                    
                    Text(timeTable)
                        .font(.system(size: 16))
                        .lineSpacing(5)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                Button(action: {
                    if isSaved {
                        alertTitle = "Remove Location?"
                        alertMessage = "Do you want to remove this from your itinerary?"
                    } else {
                        alertTitle = "Location Saved"
                        alertMessage = "Location saved to itinerary!"
                    }
                    showAlert = true
                }) {
                    Text(isSaved ? "Saved" : "Save to Itinerary")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(isSaved ? Color.blue : Color.orange)
                        .cornerRadius(15)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationTitle(titleSpot)
        .navigationBarTitleDisplayMode(.inline)
        .alert(alertTitle, isPresented: $showAlert) {
            if isSaved {
                Button("Cancel", role: .cancel) {}
                Button("Remove", role: .destructive) {
                    isSaved = false
                }
            } else {
                Button("OK") {
                    isSaved = true
                }
            }
        } message: {
            Text(alertMessage)
        }
    }
}

#Preview {
    DestinationPage(
        imageSpot: "",
        titleSpot: "Sample Title",
        locationSpot: "Sample Location",
        historyText: "Sample history text",
        timeTable: "Monday to Wednesday: 8:00 AM to 5:00 PM"
    )
}
