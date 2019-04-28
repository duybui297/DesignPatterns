//
//  Extension.swift
//  DesignPatterns
//
//  Created by Duy Bui on 4/28/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import UIKit

extension UIButton {
  var isAppTemplateButtonEnable: Bool {
    set {
      self.isEnabled = newValue
      self.alpha = newValue ? 1 : 0.5
    }
    get {
      return self.isEnabled
    }
  }
}
