//
//  OrderViewPresenter.swift
//  DesignPatterns
//
//  Created by Duy Bui on 4/28/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import Foundation

protocol OrderViewProtocol: class {
  
  func updateModel(order: Order?)
  func updateUI(order: Order?)
}

class OrderViewPresenter {
  
  private var order: Order?
  private weak var delegate: OrderViewProtocol?
  
  init(order: Order?, delegate: OrderViewProtocol?) {
    self.order = order
    self.delegate = delegate
    self.updateUIByOrder()
  }
  
  func setInformation(_ title: String, price: Double) {
    self.order?.setTitle(title)
    self.order?.setPrice(price)
    updateUIByOrder()
  }
  
  func increaseQuantity(_ currentQuantity: String?) {
    let updatedQuantity = (Int(currentQuantity ?? "0") ?? 0) + 1
    order?.setQuantity(updatedQuantity)
    updateUIByOrder()
  }
  
  func decreaseQuantity(_ currentQuantity: String?) {
    let updatedQuantity = (Int(currentQuantity ?? "0") ?? 0) - 1
    order?.setQuantity(updatedQuantity)
    updateUIByOrder()
  }
  
  func updateUIByOrder() {
    delegate?.updateModel(order: order)
    delegate?.updateUI(order: order)
  }
}


