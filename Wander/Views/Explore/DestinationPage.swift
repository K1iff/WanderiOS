import SwiftUI
import MapKit

struct DestinationPage: View {
    let destination: Destination
    
    @State private var isSaved: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(destination.image_url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .ignoresSafeArea(edges: .top)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.red)
                        Text(destination.location_name)
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
                    
                    Text(destination.history_text ?? "History information not available.")
                        .font(.system(size: 16))
                        .lineSpacing(5)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Opening Hours")
                        .font(.system(size: 22, weight: .bold))
                    
                    Text(destination.time_table ?? "Schedule not available.")
                        .font(.system(size: 16))
                        .lineSpacing(5)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                if let lat = destination.latitude, let lon = destination.longitude {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Location")
                            .font(.system(size: 22, weight: .bold))
                        
                        Map(initialPosition: .region(MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: lat, longitude: lon),
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        ))) {
                            Marker(destination.title, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
                                .tint(.orange)
                        }
                        .frame(height: 250)
                        .cornerRadius(15)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
                
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
        .navigationTitle(destination.title)
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
        destination: Destination(
            id: UUID(),
            title: "Sample Location",
            location_name: "Sample City",
            history_text: "A beautiful sample location with rich history.",
            time_table: "Open Daily",
            image_url: "spot1",
            latitude: 14.5942,
            longitude: 120.9704
        )
    )
}
