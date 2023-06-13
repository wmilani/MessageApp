//
//  RegisterScreen.swift
//  CursoViewCode
//
//  Created by Weslley Milani on 13/03/23.
//

import UIKit


protocol RegisterScreenProtocol: AnyObject {
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    
    weak private var delegate:RegisterScreenProtocol?
    func delegate (delegate:RegisterScreenProtocol) {
        self.delegate = delegate
        
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "seta voltar"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)

        return button
    }()

    
    lazy var imageAddUser: UIImageView  = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "add-user")
        image.contentMode = .scaleAspectFit

        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu e-mail"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.placeholder = "Digite sua senha"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 3.0)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        self.setUpConstraints()
        self.configButtonEnable(false) 
        
    }
    
    private func configSuperView (){
        self.addSubview(self.backButton)
        self.addSubview(self.imageAddUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor (red: 119/255, green: 136/255, blue: 153/255, alpha: 1.0)
        
    }
    
    public func configTextFieldDelegate (delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton(){
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    public func validaTextFields(){
        
        let email:String  = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
        
    }
    
    private func configButtonEnable(_ enable:Bool) {
        if enable {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.darkGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    
    public func getEmail() -> String {
        return self .emailTextField.text ?? " "
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? " "
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            
        
            self.imageAddUser.topAnchor.constraint(equalTo:
                    self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imageAddUser.centerXAnchor.constraint(equalTo:
                    self.centerXAnchor),
            self.imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            self.imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            
            self.backButton.topAnchor.constraint(equalTo:
                    self.imageAddUser.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo:
                    self.leadingAnchor, constant: 20),

            
            self.emailTextField.topAnchor.constraint(equalTo:
                    self.imageAddUser.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo:
                    self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo:
                    self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.passwordTextField.topAnchor.constraint(equalTo:
                    self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo:
                    self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo:
                    self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo:
                    self.emailTextField.heightAnchor),

            
            self.registerButton.topAnchor.constraint(equalTo:
                    self.passwordTextField.bottomAnchor,constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo:
                    self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo:
                    self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo:
                    self.emailTextField.heightAnchor),
            
        ])
    }
    
    
    
}
