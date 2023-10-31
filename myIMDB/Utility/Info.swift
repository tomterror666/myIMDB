//
//  Info.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 17.10.23.
//

import UIKit
import Popover

enum MessageType: Int {
    case info = 0
    case warning = 1
    case error = 2
}

fileprivate class ColorsOfMessage: NSObject {
    var messageType: MessageType
    
    var textColor: UIColor
    
    var backgroundColor: UIColor
    
    init(messageType: MessageType) {
        self.messageType = messageType
        self.textColor = messageType == .error ? .white : .black
        self.backgroundColor = messageType == .error ? .red : messageType == .warning ? .yellow : .white
    }
}

class Info: NSObject {
    static let horizontalMargin = 10.0
    static let verticalMargin = 5.0
    
    static func show(message: String, of type: MessageType, in width: CGFloat, connect to: UIView) {
        let colors = ColorsOfMessage(messageType: type)
        guard let font = UIFont(name: "AvenirNextCondensed-Regular", size: 17) else { return }
        let height = message.height(withConstrainedWidth: width, font: font)
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: width + 2 * horizontalMargin, height: height + 2 * verticalMargin))
        let messageLabel = UILabel(frame: CGRect(x: horizontalMargin, y: 3 * verticalMargin, width: width, height: height))
        
        messageLabel.text = message
        messageLabel.font = font
        messageLabel.textColor = colors.textColor
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.accessibilityIdentifier = "InfoViewMessageLabel"
        
        bgView.accessibilityIdentifier = "InfoBackgoundView"
        bgView.addSubview(messageLabel)
        
        let popover = Popover(options: [.color(colors.backgroundColor)])
        
        popover.accessibilityIdentifier = "InfoView"
        popover.show(bgView, fromView: to)
    }
}
