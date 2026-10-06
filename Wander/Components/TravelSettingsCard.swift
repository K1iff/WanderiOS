import SwiftUI

struct TravelSettingsCard: View {
    @State var selectedUnits = ""
    @State var selectedCurrency = ""
    
    let units = ["Imperial (km)", "Metric (mi)"]
    let currency = ["PHP", "USD", "EUR", "GBP", "AUD"]
    
    var body: some View {
        HStack {
            Text("Distance Units")
            Spacer()
            Picker("Distance Units", selection: $selectedUnits) {
                ForEach(units, id: \.self) { units in
                    Text(units)
                }
            }
        }
        .frame(width: 300, height: 40)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        
        HStack {
            Text("Default Currency")
            Spacer()
            Picker("Currency", selection: $selectedCurrency) {
                ForEach(currency, id: \.self) { currency in
                    Text(currency)
                }
            }
        }
        .frame(width: 300, height: 40)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}
