//
//  Extension+Button.swift
//  MessageCursoViewCode
//
//  Created by Weslley Milani on 14/06/23.
//

import Foundation
import UIKit

extension UIButton {
    
    func toucAnimation(s: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            s.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
        }, completion: { finish in UIButton.animate(withDuration: 0.5, delay: 0,  usingSpringWithDamping: 0.3,
            initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            s.transform = .identity
        }
        )}
        )}
}
