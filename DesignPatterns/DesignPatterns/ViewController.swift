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
  @IBOutlet weak var descreaseButton: UIButton!
  @IBOutlet weak var reviewYourOrdersLabel: UILabel!
  @IBOutlet weak var buyButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  @IBAction func didTapOnDescreaseButton(_ sender: Any) {
    
  }
  
  @IBAction func didTapOnIncreaseButton(_ sender: Any) {
    
  }
  
  
  @IBAction func didTapOnBuyButton(_ sender: Any) {
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
    print("Did tap row \(indexPath.row)")
  }
}
