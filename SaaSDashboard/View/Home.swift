//
//  Home.swift
//  SaaSDashboard
//
//  Created by Shameem Reza on 15/3/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        // MARK: HOME VIEW
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18) {
                // MARK: TITLE
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SaaS Dashboard")
                            .font(.title.bold())
                        
                        Text("daily sales and analytics")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 10)
                    
                    // MARK: - NOTIFICATION
                    Button {
                        
                    } label: {
                        Image(systemName: "bell")
                            .font(.title)
                            .foregroundColor(.gray)
                            .overlay(
                                Text("2")
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.pink)
                                    .clipShape(Circle())
                                    .offset(x: 11, y: -12),
                                
                                alignment: .topTrailing
                            )
                            .offset(x: -2)
                            .padding(15)
                            .background(Color.white)
                            .clipShape(Circle())
                    } // NOTIFICATION END
                } // TITLE END
                
                // MARK: - ORDER VIEW
                HStack(spacing: 0) {
                    OrderProgress(title: "New Order", color: Color("chartColor2"), image: "cart.badge.plus", progress: 68)
                    
                    OrderProgress(title: "Order Completed", color: Color("roundColor"), image: "clock.badge.checkmark", progress: 72)
                } // USER VIEW END
                .padding()
                .background(Color.white)
                .cornerRadius(18)
                .padding(.bottom, -25)
                
                // MARK: GRAPH VIEW
                GraphView(sales: sales)
                
                // MARK: - TOP SELLING PRODUCT
                VStack {
                    // MARK: SECTION TITLE
                    HStack {
                        Text("Top Selling Products")
                            .font(.callout.bold())
                        
                        Spacer()
                        
                        Menu {
                            Button("Day"){}
                            Button("Week"){}
                            Button("Month"){}
                            Button("Year"){}
                        } label: {
                            Image("option")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.primary)
                        }
                    } // SECTION TITLE
                    
                    // MARK: PRODUCT LIST
                    HStack(spacing: 15) {
                        Image(systemName: "bag.fill")
                            .font(.title2)
                            .foregroundColor(.pink)
                            .padding(12)
                            .background(
                                Color.gray
                                    .opacity(0.25)
                                    .clipShape(Circle())
                            )
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Party Bag")
                                .fontWeight(.bold)
                            Text("1230 Sales")
                                .font(.caption2.bold())
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        Image(systemName: "cart.fill.badge.plus")
                            .font(.title2)
                            .foregroundColor(Color("chartColor2"))
                    } // END PRODUCT LIST
                    .padding(.top, 10)
                } // END TOP SELL
                .padding()
                .background(Color.white)
                .cornerRadius(18)
                
            }
            .padding()
            
        }
    }
    
    // MARK: USER PROGRESS VIEW
    @ViewBuilder
    func OrderProgress(title: String, color: Color, image: String, progress: CGFloat)->some View {
        HStack {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(color)
                .padding(10)
                .background(
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                        
                        Circle()
                            .trim(from: 0, to: progress / 100)
                            .stroke(color, lineWidth: 2)
                    }
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(Int(progress))")
                    .font(.title2.bold())
                
                Text(title)
                    .font(.caption2.bold())
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
