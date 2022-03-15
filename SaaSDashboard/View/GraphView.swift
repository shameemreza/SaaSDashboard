//
//  GraphView.swift
//  SaaSDashboard
//
//  Created by Shameem Reza on 15/3/22.
//

import SwiftUI

struct GraphView: View {
    var sales: [Sale]
    var body: some View {
        // MARK: GRAPH VIEW
        VStack(spacing: 20) {
            // MARK: GRAPH TITLE
            HStack {
                Text("Total Sales")
                    .fontWeight(.bold)
                
                Spacer()
                
                Menu {
                    Button("Day"){}
                    Button("Week"){}
                    Button("Month"){}
                    Button("Year"){}
                } label: {
                    HStack(spacing: 4) {
                        Text("this week")
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .scaleEffect(0.7)
                    }
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.gray)
                }
            } // GRAPH TITLE END
            
            // MARK: UNDERLINE
            HStack(spacing: 10) {
                Capsule()
                    .fill(Color("chartColor2"))
                    .frame(width: 20, height: 8)
                
                Text("Sales")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.gray)
            } // UNDERLINE END
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - CHART VIEW
            ChartView()
                .padding(.top, 20)
            
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.top, 25)
    }
    
    @ViewBuilder
    func ChartView()->some View {
        GeometryReader{proxy in
            
            ZStack {
                VStack(spacing: 0) {
                    ForEach(getGraphLines(), id: \.self) {line in
                        HStack(spacing: 8) {
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height: 20)
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: -15) //REMOVE TEXT SIZE
                    }
                }
                
                HStack {
                    ForEach(sales) {sale in
                        VStack(spacing: 0) {
                            VStack(spacing: 5) {
                                Capsule()
                                    .fill(Color("chartColor2"))
                                
                                Capsule()
                                    .fill(Color("chartColor1"))
                            }
                            .frame(width: 8)
                            .frame(height: getBarHeight(point: sale.sales, size: proxy.size))
                            
                            Text(sale.weekDay)
                                .font(.caption)
                                .frame(height: 25, alignment: .bottom)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                }
                .padding(.leading, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }
        .frame(height: 190) // FIXED HEIGHT
    }
    
    // MARK: - BAR HEIGHT
    
    func getBarHeight(point: CGFloat, size: CGSize)->CGFloat {
        let max = getMAx()
        let height = (point / max) * (size.height - 45)
        
        return height
    }
    
    // MARK: - GET SAMPLE LINE BASED ON MAX
    func getGraphLines()->[CGFloat] {
        let max = getMAx()
        
        var lines: [CGFloat] = []
        
        for index in 1...4 {
            let progress = max / 4
            lines.append(max - (progress * CGFloat(index)))
        }
        return lines
    }
    
    // MARK: - GET MAX AMOUNT
    func getMAx()->CGFloat{
        let max = sales.max { first, scnd in
            return scnd.sales > first.sales
        }?.sales ?? 0
        return max
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
