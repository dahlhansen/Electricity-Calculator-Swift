//
//  ContentView.swift
//  Frederik_Hansen_A3_INFO10229
//
//  Created by Frederik Dahl Hansen on 24/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var OnPeakEntry: String = ""
    
    @State private var OffPeakEntry: String = ""
    
    @State private var MidPeakEntry: String = ""
    
    @State private var result: Double = 0
    
    
    private var OnPeakCalc : Double {
        var result = Double(OnPeakEntry) ?? 0.0
        
        return result * 0.132
    }
    private var OffPeakCalc : Double {
        var result = Double(OffPeakEntry) ?? 0.0
        
        return result * 0.065
    }
    private var MidPeakCalc : Double {
        var result = Double(MidPeakEntry) ?? 0.0
        
        return result * 0.094
    }
    
    private var TotalConsumptionCalc : Double {
        var result = OnPeakCalc + OffPeakCalc + MidPeakCalc
        
        return result
    }
    
    private var HSTCalc : Double {
        var result = TotalConsumptionCalc * 0.13
        
        return result
    }
    private var ProvRebateCalc : Double {
        var result = TotalConsumptionCalc * 0.08
        
        return result
    }
    private var TotalRegCharges : Double {
        var result = HSTCalc - ProvRebateCalc
        
        return result
    }
    private var BillAmount : Double {
        var result = TotalConsumptionCalc + TotalRegCharges
        
        return result
    }
    private var OffPeakCalcText: String = "Off-Peak Charges: $"
    
    
    
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("                           Frederik Dahl Hansen")
                .foregroundColor(Color(UIColor(named: "DarkModeTextColor")!))
                .bold()
            
            
            Form{
                
                Section(header: Text("Usage Details")){
                    
                    TextField("On-peak usage in kWh", text: self.$OnPeakEntry)
                    
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 2)
                        }
                        .keyboardType(.decimalPad)
                        .foregroundColor(Color(UIColor(named: "DarkModeTextColor")!))
                    
                    
                    TextField("Off-peak usage in kWh", text: self.$OffPeakEntry)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 2)}
                        .keyboardType(.decimalPad)
                        .foregroundColor(Color(UIColor(named: "DarkModeTextColor")!))
                    
                    
                    TextField("Mid-peak usage in kWh", text: self.$MidPeakEntry)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 2)}
                            
                            .foregroundColor(Color(UIColor(named: "DarkModeTextColor")!))
                            .keyboardType(.decimalPad)
                        
                    
                        
                }
                
                Section(header: Text("Consumption Charges")){
                    
                    
                    
                    Text("On-Peak Charges : $\(self.OnPeakCalc, specifier: "%.2f")")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(UIColor(named: "InAppDarkMode")!))
                        
                        
                    
                    Text("Off-Peak Charges : $\(self.OffPeakCalc, specifier: "%.2f")")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(UIColor(named: "InAppDarkMode")!))
                    
                    Text("Mid-Peak Charges : $\(self.MidPeakCalc, specifier: "%.2f")")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(UIColor(named: "InAppDarkMode")!))
                    
                    Text("Total Consumption Charges : $\(self.TotalConsumptionCalc, specifier: "%.2f")")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(UIColor(named: "DarkModeTotal")!))                }
                
                
                Section(header: Text("Regulatory Charges")){
                    
                    Text("HST (13 percent): $\(self.HSTCalc, specifier: "%.2f")")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(UIColor(named: "InAppDarkMode")!))
                    
                    Text("Provicial Rebate (8 percent): $\(self.ProvRebateCalc, specifier: "%.2f")")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(UIColor(named: "InAppDarkMode")!))
                    
                    Text("Total Regulatory Charges : $\(self.TotalRegCharges, specifier: "%.2f")")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(UIColor(named: "DarkModeTotal")!))
                        
                }
                
                Section(header: Text("Bill Amount")){
                    
                    Text("Net Bill Amount : $\(self.BillAmount, specifier: "%.2f")")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(UIColor(named: "DarkModeTotal")!))
                }
            }
        }
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
