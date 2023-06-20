//
//  HomeVC.swift
//  MessageCursoViewCode
//
//  Created by Weslley Milani on 20/06/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen:HomeScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = screen
    }
}
