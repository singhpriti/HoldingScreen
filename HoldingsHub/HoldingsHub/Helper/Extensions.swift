//
//  Extensions.swift
//  HoldingsHub
//
//  Created by Preity Singh on 14/11/24.
//

import Foundation
import UIKit

extension UIDevice {
   var hasTopNotch: Bool {
      return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
   }
}
