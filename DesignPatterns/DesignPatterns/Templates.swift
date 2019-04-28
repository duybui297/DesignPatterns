//
//  Templates.swift
//  DesignPatterns
//
//  Created by Duy Bui on 4/28/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import Foundation

struct Template {
  
  var title: String
  var price: Double
  
  func getPrice() -> String {
    return price != 0.0 ? "$\(self.price)": "Free"
  }
}

let templates = [Template(title: "Car Dealership App Template", price: 99.0),
                 Template(title: "Ecommerce iOS App Template", price: 69.0),
                 Template(title: "iOS Travel Booking App Template", price: 0.0),
                 Template(title: "WordPress iOS App Template", price: 39.0),
                 Template(title: "Personal Finance iOS App Template", price: 99.0),
                 Template(title: "Firebase Shopping App Template", price: 69.0),
                 Template(title: "Shopify iOS App Template", price: 0.0),
                 Template(title: "News Reader iPhone App Template", price: 39.0)]
