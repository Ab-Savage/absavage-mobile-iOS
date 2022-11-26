//
//  SubscribedViewController.swift
//  absavage-ios
//
//  Created by MEKARI on 26/11/22.
//

import UIKit

class SubscribedViewController: UIViewController {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var quickIntroButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var gradientBg: UIView!
    
    // MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.setupGradient()
    }
    
    // MARK: - SETUP METHODS
    private func setupUI() {
        // - imageView
        imageView.layer.cornerRadius = 10
        // - Hide navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // - Login button
        quickIntroButton.layer.cornerRadius = 10
        quickIntroButton.layer.shadowColor = UIColor(red: 119/255.0, green: 28/255.0, blue: 72/255.0, alpha: 1.0).cgColor
        quickIntroButton.layer.shadowOffset = CGSize(width: 0, height: 20)
        quickIntroButton.layer.shadowRadius = 15
        quickIntroButton.layer.shadowOpacity = 0.7
        quickIntroButton.layer.shadowPath = nil
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.gradientBg.bounds
        gradientLayer.colors = [
            UIColor(red: 119/255, green: 28/255, blue: 72/255, alpha: 0.4).cgColor,
            UIColor(red: 119/255, green: 28/255, blue: 72/255, alpha: 0.6).cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor,
            UIColor.black.cgColor,
            UIColor.black.cgColor
        ]
        gradientBg.layer.addSublayer(gradientLayer)
    }
    
    // MARK: - IBACTION METHODS
    @IBAction func handleQuickIntroTapped(_ sender: Any) {
        // TODO: Handle quick intro tapped
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func handleSkipTapped(_ sender: Any) {
        // TODO: Handle skip tapped
        self.navigationController?.popToRootViewController(animated: true)
    }
}
