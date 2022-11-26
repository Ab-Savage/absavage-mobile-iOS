//
//  LoginViewController.swift
//  absavage-ios
//
//  Created by MEKARI on 26/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var signInTitleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var eyePasswordImageView: UIImageView!
    @IBOutlet weak var forgotPasswordLabel: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var gradientBg: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupGradient()
    }
    
    // MARK: - SETUP METHODS
    private func setupUI() {
        // - Login button
        loginButton.layer.cornerRadius = 10
        loginButton.layer.shadowColor = UIColor(red: 119/255.0, green: 28/255.0, blue: 72/255.0, alpha: 1.0).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 20)
        loginButton.layer.shadowRadius = 15
        loginButton.layer.shadowOpacity = 0.7
        loginButton.layer.shadowPath = nil
        // - Alternate login buttons
        appleLoginButton.setTitle("", for: .normal)
        googleLoginButton.setTitle("", for: .normal)
        // Text view delegate
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "EMAIL",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "PASSWORD",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.gradientBg.bounds
        gradientLayer.colors = [
            UIColor.black.cgColor,
            UIColor.black.cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor,
            UIColor(red: 119/255, green: 28/255, blue: 72/255, alpha: 0.7).cgColor,
            UIColor(red: 119/255, green: 28/255, blue: 72/255, alpha: 0.9).cgColor
        ]
        gradientBg.layer.addSublayer(gradientLayer)
    }
    
    // MARK: - IBACTIONS
    @IBAction func handleLoginTapped(_ sender: Any) {
        // TODO: Handle login
    }
    @IBAction func handleSignUpTapped(_ sender: Any) {
        // - Go to register
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    @IBAction func handleAppleTapped(_ sender: Any) {
        // TODO: Handle login with apple
    }
    @IBAction func handleGoogleTapped(_ sender: Any) {
        // TODO: Handle login with google
    }
}

// MARK: - UITEXTFIELD DELEGATION
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // TODO: Handle when text field is begin editing
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODO: Handle when text field end editing
    }
}
