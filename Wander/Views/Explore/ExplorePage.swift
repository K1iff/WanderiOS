import SwiftUI

struct ExplorePage: View {
    @State var isShowSheet = false
    
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        NavigationLink {
                            DestinationPage(
                                imageSpot: "spot1",
                                titleSpot: "Fort Santiago",
                                locationSpot: "Intramuros, Manila",
                                historyText: "Fort Santiago is a historical citadel built by the Spanish in the late 1500s. It served as a defense fortress and is where Dr. Jose Rizal was imprisoned before his execution.",
                                timeTable: "Monday to Sunday: 8:00 AM to 11:00 PM")
                        } label: {
                            SpotCard(imageSpot: "spot1", titleSpot: "Fort Santiago", locationSpot: "Intramuros, Manila")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink {
                            DestinationPage(
                                imageSpot: "spot2",
                                titleSpot: "Rizal Park",
                                locationSpot: "Ermita, Manila",
                                historyText: "Also known as Luneta Park, this historical urban park is one of the largest in Asia. It holds massive national significance as the site of Jose Rizal's execution in 1986.",
                                timeTable: "Monday to Sunday: 5:00 AM to 10:00 PM")
                        } label: {
                            SpotCard(imageSpot: "spot2", titleSpot: "Rizal Park", locationSpot: "Ermita, Manila")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink {
                            DestinationPage(
                                imageSpot: "spot3",
                                titleSpot: "National Museum of Fine Arts",
                                locationSpot: "Ermita, Manila",
                                historyText: "The National Museum of Fine Arts is home to a vast collection of paintings and sculptures by classical Filipino artists, including Juan Luna's famous masterpiece, the Spoliarium.",
                                timeTable: "Monday: Closed\nTuesday to Sunday: 9:00 AM to 6:00 PM"
                            )
                        } label: {
                            SpotCard(imageSpot: "spot3", titleSpot: "National Museum of Fine Arts", locationSpot: "Ermita, Manila")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink {
                            DestinationPage(
                                imageSpot: "spot 4",
                                titleSpot: "Nacpan Beach",
                                locationSpot: "El Nido, Palawan",
                                historyText: "Known for its pristine 4 kilometer stretch of golden sand and crystal clear water. Nacpan Beach is consistently ranked as one of the most beautiful beaches in the world.",
                                timeTable: "Monday to Sunday: Open Daily")
                        } label: {
                            SpotCard(imageSpot: "spot4", titleSpot: "Nacpan Beach", locationSpot: "El Nido, Palawan")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink {
                            DestinationPage(
                                imageSpot: "spot5",
                                titleSpot: "Kawasan Falls",
                                locationSpot: "Badian, Cebu",
                                historyText: "A stunning three tiered cascading waterfall famous for its vibrant turquoise waters. It is a highly popular destination for canyoneering and thrilling cliff jumps.",
                                timeTable: "Monday to Friday: 7:00 AM to 5:00 PM\nSaturday to Sunday: 7:00 AM to 6:00 PM")
                        } label: {
                            SpotCard(imageSpot: "spot5", titleSpot: "Kawasan Falls", locationSpot: "Badian, Cebu")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink {
                            DestinationPage(
                                imageSpot: "spot6",
                                titleSpot: "Chocolate Hills",
                                locationSpot: "Carmen, Bohol",
                                historyText: "A famous geological formation consisting of over 1,200 perfectly cone shaped hills. Covered in lush green grass, they famously turn into a deep brown color during the dry season, resembling giant chocolate kisses.",
                                timeTable: "Monday to Sunday: 6:00 AM to 6:00 PM")
                        } label: {
                            SpotCard(imageSpot: "spot6", titleSpot: "Chocolate Hills", locationSpot: "Carmen, Bohol")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                        
                        NavigationLink {
                            DestinationPage(
                                imageSpot: "spot7",
                                titleSpot: "Boracay Island",
                                locationSpot: "Malay, Aklan",
                                historyText: "World renowned for its pristine White beach, powdery sand, and vibrant nightlife. It is a premier tropical island destination perfect for water sports, stunning sunsets, and ultimate relaxation.",
                                timeTable: "Monday to Sunday: Open Daily")
                        } label: {
                            SpotCard(imageSpot: "spot7", titleSpot: "Boracay Island", locationSpot: "Malay, Aklan")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 10)
                    }
                }
            }
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
