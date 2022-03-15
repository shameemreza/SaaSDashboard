//
//  BaseView.swift
//  SaaSDashboard
//
//  Created by Shameem Reza on 15/3/22.
//

import SwiftUI

struct BaseView: View {
    
    @State var currentTab = "home"
    
    // MARK: HIDE NATIVE TAB
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: BOTTOM NAV ITEM
             TabView(selection: $currentTab) {
                 Home()
                     .modifier(BGModifier())
                     .tag("home")
                 Text("Graph")
                     .modifier(BGModifier())
                     .tag("chart")
                 Text("Message")
                     .modifier(BGModifier())
                     .tag("chat")
                 Text("Settings")
                     .modifier(BGModifier())
                     .tag("setting")
             } // END NAV ITEM
            
            // MARK: - CUSTOM TAB BAR
            HStack(spacing: 40) {
                // MARK: - TAB BUTTON
                TabButton(image: "home")
                TabButton(image: "chart")
                
                // MARK: - CENTER BUTTON
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(22)
                        .background(
                            Circle()
                                .fill(Color("menuTab"))
                                .shadow(color: Color("menuTab").opacity(0.15), radius: 5, x: 0, y: 8)
                        )
                }
                .offset(y: -20)
                .padding(.horizontal, -15)
                
                TabButton(image: "chat")
                TabButton(image: "setting")

            }
            .padding(.top, -10)
            .frame(maxWidth: .infinity)
            .background(
                Color("BG")
                    .ignoresSafeArea()
            )
        }
    }
    @ViewBuilder
    func TabButton(image: String)-> some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(
                    currentTab == image ? Color.black : Color.gray.opacity(0.8)
                )
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}


// MARK: BACKGROUND MODIFIER

struct BGModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG").ignoresSafeArea())
    }
}
