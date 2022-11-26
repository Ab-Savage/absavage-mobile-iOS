//
//  RegisterViewController.swift
//  absavage-ios
//
//  Created by MEKARI on 26/11/22.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var eyePasswordImageView: UIImageView!
    @IBOutlet weak var freeTrialButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var gradientBg: UIView!
    
    // MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.setupGradient()
    }
    
    // MARK: - SETUP METHODS
    private func setupUI() {
        // - Hide navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // - Login button
        freeTrialButton.layer.cornerRadius = 10
        freeTrialButton.layer.shadowColor = UIColor(red: 119/255.0, green: 28/255.0, blue: 72/255.0, alpha: 1.0).cgColor
        freeTrialButton.layer.shadowOffset = CGSize(width: 0, height: 20)
        freeTrialButton.layer.shadowRadius = 15
        freeTrialButton.layer.shadowOpacity = 0.7
        freeTrialButton.layer.shadowPath = nil
        // - Alternate login buttons
        appleLoginButton.setTitle("", for: .normal)
        googleLoginButton.setTitle("", for: .normal)
        // - Set textField delegate
        emailTextField.delegate = self
        passwordTextField.delegate = self
        // - Set textfield placeholder
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "EMAIL",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "PASSWORD",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "NAME",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: "USERNAME",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        // - Image view
        emailImageView.isHidden = true
        // - Password
        passwordTextField.isSecureTextEntry = true
        addGesture(someView: eyePasswordImageView, methods: #selector(clickOnShowPassword(_:)))
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
    
    // MARK: - IBACTION METHODS
    @IBAction func handleFreeTrialTapped(_ sender: Any) {
        // TODO: Handle free trial
        let subscriptionVC = SubscriptionViewController()
        self.navigationController?.pushViewController(subscriptionVC, animated: true)
    }
    @IBAction func handleLoginTapped(_ sender: Any) {
        // TODO: Handle when login tapped
        navigationController?.popViewController(animated: true)
    }
    @IBAction func handleAppleButtonTapped(_ sender: Any) {
        // TODO: Handle login with apple
    }
    @IBAction func handleGoogleButtonTapped(_ sender: Any) {
        // TODO: Handle login with google
    }
    
    @objc private func clickOnShowPassword(_ gesture: UITapGestureRecognizer) {
        let status = passwordTextField.isSecureTextEntry
        passwordTextField.isSecureTextEntry = !status
    }
    
    // MARK: - HELPER METHODS
    private func addGesture(someView: UIView, methods: Selector?) {
        // - Create and setup UITapGestureRecognizer instance
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: methods)
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        // - Add GestureRecognizer to view
        someView.addGestureRecognizer(gestureRecognizer)
        someView.isUserInteractionEnabled = true
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // TODO: Handle when textField begin editing
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.placeholder == "EMAIL",
           let text = textField.text,
           text.contains("@"),
           text.contains(".") {
            emailImageView.isHidden = false
        } else if textField.placeholder == "EMAIL" {
            emailImageView.isHidden = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.placeholder == "EMAIL",
           let text = textField.text,
           text.contains("@"),
           text.contains(".") {
            emailImageView.isHidden = false
        } else if textField.placeholder == "EMAIL" {
            emailImageView.isHidden = true
        }
    }
}
