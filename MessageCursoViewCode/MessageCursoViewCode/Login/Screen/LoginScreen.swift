//
//  LoginScreen.swift
//  CursoViewCode
//
//  Created by Weslley Milani on 25/02/23.
//

import UIKit

protocol LoginScreenProtocol:AnyObject{
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
   private weak var delegate:LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var loginLabel:UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
        
    }()
    
    lazy var logoAppImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        
        return image
    }()

    lazy var emailTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder  = "Digite Seu e-mail:"
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
        tf.placeholder = "Digite Sua Senha:"
        tf.textColor = .darkGray
        
        return tf
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor  = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 3.0)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
       
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Registre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)

        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        self.setUpConstraits()
        self.configButtonEnable(false)
    }
    
    private func configSuperView(){
        
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor (red: 119/255, green: 136/255, blue: 153/255, alpha: 1.0)
        
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton (){
        self.delegate?.actionLoginButton()
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
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.setTitleColor(.darkGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String {
        return self .emailTextField.text ?? " "
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? " "
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraits () {
        NSLayoutConstraint.activate([
        
            self.loginLabel.topAnchor.constraint(equalTo:
                    self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            
            self.logoAppImageView.topAnchor.constraint(equalTo:
                    self.loginLabel.bottomAnchor, constant: 20),
            self.logoAppImageView.leadingAnchor.constraint(equalTo:
                    self.leadingAnchor, constant: 60),
            self.logoAppImageView.trailingAnchor.constraint(equalTo:
                    self.trailingAnchor, constant: -60),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),

            
            self.emailTextField.topAnchor.constraint(equalTo:
                    self.logoAppImageView.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo:
                    self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo:
                    self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            self.passwordTextField.topAnchor.constraint(equalTo:
                    self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo:
                    self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo:
                    self.trailingAnchor, constant: -20),
            self.passwordTextField.heightAnchor.constraint(equalTo:
                    self.emailTextField.heightAnchor),
            
            
            self.loginButton.topAnchor.constraint(equalTo:
                    self.passwordTextField.bottomAnchor, constant:15),
            self.loginButton.leadingAnchor.constraint(equalTo:
                    self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo:
                    self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo:
                    self.emailTextField.heightAnchor),
            
            
            
            self.registerButton.topAnchor.constraint(equalTo:
                    self.loginButton.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo:
                    self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo:
                    self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo:
                    self.emailTextField.heightAnchor),
      
        ])
    }
}
