import SwiftUI
import Supabase

struct Destination: Codable, Identifiable, Hashable {
    let id: UUID
    let title: String
    let location_name: String
    let history_text: String?
    let time_table: String?
    let image_url: String
    let latitude: Double?
    let longitude: Double?
}

struct ExplorePage: View {
    @State private var isShowSheet = false
    @State private var destinations: [Destination] = []
    @State private var isLoading = true
    
    func fetchDestinations() async {
        do {
            let fetchedDestinations: [Destination] = try await supabase
                .from("destinations")
                .select()
                .execute()
                .value
            
            self.destinations = fetchedDestinations
        } catch {
            print("Error fetching destinations: \(error.localizedDescription)")
        }
        isLoading = false
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Explore Philippines!")
                        .font(.system(size: 25, weight: .bold))
                    Spacer()
                }
                
                Button {
                    isShowSheet = true
                } label: {
                    Image(systemName: "line.3.horizontal.circle")
                        .font(.system(size: 35))
                }
                .padding(.leading, 320)
                
                if isLoading {
                    Spacer()
                    ProgressView("Loading Destinations...")
                    Spacer()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(destinations) { destination in
                                NavigationLink(value: destination) {
                                    SpotCard(imageSpot: destination.image_url, titleSpot: destination.title, locationSpot: destination.location_name)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.bottom, 10)
                            }
                        }
                    }
                    .navigationDestination(for: Destination.self) { destination in
                        DestinationPage(destination: destination)
                    }
                }
            }
        }
        .task {
            await fetchDestinations()
        }
        .sheet(isPresented: $isShowSheet) {
            VStack {
                Color.clear.frame(height: 10)
                
                Text("Filter by: Experiences")
                    .font(.system(size: 25, weight: .semibold))
                
                FilterExperience(filterText: "Culture & Heritage")
                FilterExperience(filterText: "Nature & Outdoors")
                FilterExperience(filterText: "Foods & Drink")
                FilterExperience(filterText: "Nightlife")
                FilterExperience(filterText: "Arts & Entertainment")
                FilterExperience(filterText: "Wellness")
                
                Spacer()
                
                Button {
                    isShowSheet = false
                } label: {
                    Text("Apply Filter")
                        .foregroundColor(.white)
                }
                .frame(width: 350, height: 55)
                .background(Color.orange)
                .cornerRadius(20)
                
                Button {
                    isShowSheet = false
                } label: {
                    Text("Cancel")
                }
                
                Color.clear.frame(height: 10)
            }
            .presentationDetents([.height(500)])
            .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    ExplorePage()
}
