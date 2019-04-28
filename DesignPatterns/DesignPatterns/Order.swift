//
//  Order.swift
//  DesignPatterns
//
//  Created by Duy Bui on 4/28/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import Foundation

struct Order {
  var title: String
  var quantity: Int
  var price: Double
  
  mutating func setQuantity(_ quantity: Int) {
    self.quantity = quantity
  }
  
  mutating func setTitle(_ title: String) {
    self.title = title
  }
  
  mutating func setPrice(_ price: Double) {
    self.price = price
  }
  
  func getOrderInformation() -> String {
    return "Your order: \(title) x\(quantity) - Total: $\(price * Double(quantity))"
  }
}
