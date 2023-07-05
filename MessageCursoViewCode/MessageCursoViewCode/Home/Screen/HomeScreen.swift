//
//  HomeScreen.swift
//  MessageCursoViewCode
//
//  Created by Weslley Milani on 20/06/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var naviView:NaviView = {
        let view = NaviView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var collectionView:UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.delaysContentTouches = false
        cv.register(MessageLastCollectionViewCell.self, forCellWithReuseIdentifier: MessageLastCollectionViewCell.identifier)
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        cv.setCollectionViewLayout(layout, animated: false)
    
        
        return cv
    }()
    
    public func delegateCollectionView(delegate:UICollectionViewDelegate, dataSource:UICollectionViewDataSource){
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
    }
    
    public func reloadCollectionView(){
        collectionView.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElement()
        setUpConstraints()
    }
    
    private func addElement(){
        addSubview(naviView)
        addSubview(collectionView)
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
        
        
            self.naviView.topAnchor.constraint(equalTo: self.topAnchor),
            self.naviView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.naviView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.naviView.heightAnchor.constraint(equalToConstant: 140),
            
            self.collectionView.topAnchor.constraint(equalTo: self.naviView.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
        
        
        
        
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
