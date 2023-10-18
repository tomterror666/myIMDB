//
//  UINavigationController.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 28.09.23.
//

import Foundation
import UIKit

extension UINavigationController {

    func setStatusBarBackgroundColor(_ backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

}
