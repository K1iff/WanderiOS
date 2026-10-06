import SwiftUI

struct ItineraryPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
                Text("My Itinerary")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    DayHeader(day: "Day 1", date: "Oct 12")
                    ItineraryCard(time: "09:00 AM", imageSpot: "spot1", titleSpot: "Fort Santiago", locationSpot: "Intramuros, Manila")
                    ItineraryCard(time: "02:00 PM", imageSpot: "spot2", titleSpot: "Rizal Park", locationSpot: "Ermita, Manila")
                    
                    DayHeader(day: "Day 2", date: "Oct 13")
                    ItineraryCard(time: "10:30 AM", imageSpot: "spot4", titleSpot: "Nacpan Beach", locationSpot: "El Nido, Palawan")
                    
                    DayHeader(day: "Day 3", date: "Oct 14")
                    ItineraryCard(time: "02:00 PM", imageSpot: "spot7", titleSpot: "Boracay", locationSpot: "Malay, Aklan")
                    
                    DayHeader(day: "Day 4", date: "Oct 15")
                    ItineraryCard(time: "08:00 AM", imageSpot: "spot5", titleSpot: "Kawasan Falls", locationSpot: "Badian, Cebu")
                    ItineraryCard(time: "03:00 PM", imageSpot: "spot6", titleSpot: "Chocolate Hills", locationSpot: "Carmen, Bohol")
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ItineraryPage()
}
