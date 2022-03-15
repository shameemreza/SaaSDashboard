//
//  Download.swift
//  SaaSDashboard
//
//  Created by Shameem Reza on 15/3/22.
//

import SwiftUI

// MARK: SALES MODEL

struct Sale: Identifiable {
    var id = UUID().uuidString
    var sales: CGFloat
    var weekDay: String
}

var sales: [Sale] = [
    Sale(sales: 500, weekDay: "Sun"),
    Sale(sales: 240, weekDay: "Mon"),
    Sale(sales: 350, weekDay: "Tue"),
    Sale(sales: 430, weekDay: "Wed"),
    Sale(sales: 690, weekDay: "Thu"),
    Sale(sales: 540, weekDay: "Fri"),
    Sale(sales: 920, weekDay: "Sat"),
]
