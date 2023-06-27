//
//  HomeVC.swift
//  MessageCursoViewCode
//
//  Created by Weslley Milani on 20/06/23.
//

import UIKit
import Firebase


class HomeVC: UIViewController {

    var screen:HomeScreen?
    
    var auth:Auth?
    var db:Firestore?
    var idUsuarioLogado: String?
    
    
    var screenContact: Bool?
    var emailUsuarioLogado: String?
    var alert:Alert?
    
    
    override func loadView() {
        screen = HomeScreen()
        view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = CustomColor.appLight
        configHomeView()
        configCollectionView()
        configAlert()
    }
    
    
    private func configHomeView(){
        self.screen?.naviView.delegate(delegate: self)
    }
    
    private func configCollectionView(){
        self.screen?.delegateCollectionView(delegate: self, dataSource: self)
    }
    
    private func configAlert(){
        self.alert = Alert(controller: self)
    }
   
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    
}




extension HomeVC:NavViewProtocol {
    func typeScreenMessage(type: TypeConversationOrContact) {
        
        switch type {
        case    .contact:
            self.screenContact = true
        case .conversation:
            self.screenContact = false
    
            }
        
        }
}
