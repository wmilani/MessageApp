//
//  NaviView.swift
//  MessageCursoViewCode
//
//  Created by Weslley Milani on 20/06/23.
//

import UIKit

enum TypeConversationOrContact{
    case conversation
    case contact
}

protocol NavViewProtocol:AnyObject {
    func typeScreenMessage(type:TypeConversationOrContact)
}

class NaviView: UIView {
    
    weak private var delegate:NavViewProtocol?
    
    func delegate(delegate:NavViewProtocol?){
        self.delegate = delegate
    }
    
     var  naviBackGroundView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.02).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        
        return view
    }()
    
    var navBar: UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }
    
    var searchBar: UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.appLight
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
    
        return view
    }
    
    var searchLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite Aqui"
        label.font = UIFont(name: CustomFont.poppinsMedium, size: 16)
        label.textColor = .lightGray
        
        return label
    }
    
    var searchBtn:UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "search"), for: .normal)
        
        return button
    }
    
    let stackView:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        
        return stack
    }()
    
    var conversationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "message")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .systemPink
        button.addTarget(NaviView.self, action: #selector(tappedConversationButton), for: .touchUpInside)
        
        return button
    }()
    
    var contactButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "group")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(NaviView.self, action: #selector(tappedContactButton), for: .touchUpInside)
        return button
    }()
    
    
    @objc func tappedConversationButton(){
        self.delegate?.typeScreenMessage(type: .conversation)
        self.conversationButton.tintColor = .systemPink
        self.contactButton.tintColor = .black
    }
    
    @objc func tappedContactButton(){
        self.delegate?.typeScreenMessage(type: .contact)
        self.contactButton.tintColor = .black
        self.contactButton.tintColor = .systemPink
        
    }
    
    func setUpContraints(){
        NSLayoutConstraint.activate([
        
            self.naviBackGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.naviBackGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.naviBackGroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.naviBackGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.navBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBar.topAnchor.constraint(equalTo: self.topAnchor),
            self.navBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.searchBar.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: 30),
            self.searchBar.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant:  -20),
            self.searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            self.stackView.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: -30),
            self.stackView.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.stackView.widthAnchor.constraint(equalToConstant: 100),
            self.stackView.heightAnchor.constraint(equalToConstant: 30),
            
            self.searchLabel.leadingAnchor.constraint(equalTo: self.searchBar.leadingAnchor, constant: 25),
            self.searchLabel.centerYAnchor.constraint(equalTo: self.searchBar.centerYAnchor),
            
            self.searchBtn.leadingAnchor.constraint(equalTo: self.searchBar.leadingAnchor,constant: -20),
            self.searchBtn.centerYAnchor.constraint(equalTo: self.searchBar.centerYAnchor),
            self.searchBtn.widthAnchor.constraint(equalToConstant: 20),
            self.searchBtn.heightAnchor.constraint(equalToConstant: 20),
                        
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpContraints()
    }
    
    func addElemented(){
        self.addSubview(naviBackGroundView)
        self.naviBackGroundView.addSubview(navBar)
        self.navBar.addSubview(searchBar)
        self.navBar.addSubview(stackView)
        self.searchBar.addSubview(searchLabel)
        self.searchBtn.addSubview(searchBtn)
        self.stackView.addArrangedSubview(conversationButton)
        self.stackView.addArrangedSubview(contactButton)
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
