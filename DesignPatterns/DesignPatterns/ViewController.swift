//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Duy Bui on 4/28/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var templatesTableView: UITableView!
  @IBOutlet weak var quantityLabel: UILabel!
  @IBOutlet weak var decreaseButton: UIButton!
  @IBOutlet weak var reviewYourOrdersLabel: UILabel!
  @IBOutlet weak var buyButton: UIButton!
  
  var yourOrder: Order?
  var orderViewPresenter: OrderViewPresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataInitialization()
    orderViewPresenter = OrderViewPresenter(order: yourOrder, delegate: self)
  }
  
  @IBAction func didTapOnDecreaseButton(_ sender: Any) {
    orderViewPresenter?.decreaseQuantity(quantityLabel.text)
  }
  
  @IBAction func didTapOnIncreaseButton(_ sender: Any) {
    orderViewPresenter?.increaseQuantity(quantityLabel.text)
  }
  
  @IBAction func didTapOnBuyButton(_ sender: Any) {
    let alert = UIAlertController(title: "Successful", message: yourOrder?.getOrderInformation(), preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
      self?.templatesTableView.reloadData()
      self?.dataInitialization()
      self?.updateUIBy(self?.yourOrder)
    })
    self.present(alert, animated: true)
  }
  
  private func dataInitialization() {
    yourOrder = Order(title: "", quantity: 0, price: 0.0)
  }
  
  private func updateUIBy(_ order: Order?) {
    if let order = order {
      decreaseButton.isAppTemplateButtonEnable = order.quantity > 0
      quantityLabel.text = String(describing: order.quantity)
      if order.quantity > 0 && !order.title.isEmpty {
        buyButton.isAppTemplateButtonEnable = true
        reviewYourOrdersLabel.text = order.getOrderInformation()
      } else {
        buyButton.isAppTemplateButtonEnable = false
        reviewYourOrdersLabel.text = "Please choose a template"
      }
    } else {
      quantityLabel.text = "0"
      buyButton.isAppTemplateButtonEnable = false
      decreaseButton.isAppTemplateButtonEnable = false
      reviewYourOrdersLabel.text = "Please choose a template"
    }
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return templates.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
    cell.textLabel?.text = templates[indexPath.row].title
    cell.detailTextLabel?.text = templates[indexPath.row].getPrice()
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    orderViewPresenter?.setInformation(templates[indexPath.row].title, price: templates[indexPath.row].price)
  }
}

extension ViewController: OrderViewProtocol {
  func updateModel(order: Order?) {
    yourOrder = order
  }
  
  func updateUI(order: Order?) {
    updateUIBy(order)
  }
}
