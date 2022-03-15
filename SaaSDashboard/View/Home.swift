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
                
                // MARK: - USER VIEW
                HStack(spacing: 0) {
                    
                } // USER VIEW END
                
                // MARK: GRAPH VIEW
                GraphView(sales: sales)
            }
            .padding()
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
