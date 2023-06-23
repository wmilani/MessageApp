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
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = CustomColor.appLight
        
    }
    
    override func loadView() {
        screen = HomeScreen()
        view = self.screen
    }
}
