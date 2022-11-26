//
//  SubscriptionViewController.swift
//  absavage-ios
//
//  Created by MEKARI on 26/11/22.
//

import UIKit

class SubscriptionViewController: UIViewController {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var freeTrialButton: UIButton!
    @IBOutlet weak var subscriptionTableView: UITableView!
    // MARK: DATA
    private var subscriptions: [Subscription] = [.monthly, .yearly]
    private var selectedSubscription: Subscription = .monthly
    
    // MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.setupTableView()
    }
    
    // MARK: - SETUP METHODS
    private func setupUI() {
        // - Hide navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // - Login button
        freeTrialButton.layer.cornerRadius = 10
        freeTrialButton.titleLabel?.font = .monumentExtendedUltrabold(size: 14)
        freeTrialButton.layer.shadowColor = UIColor(red: 119/255.0, green: 28/255.0, blue: 72/255.0, alpha: 1.0).cgColor
        freeTrialButton.layer.shadowOffset = CGSize(width: 0, height: 20)
        freeTrialButton.layer.shadowRadius = 15
        freeTrialButton.layer.shadowOpacity = 0.7
        freeTrialButton.layer.shadowPath = nil
    }
    
    private func setupTableView() {
        subscriptionTableView.register(UINib(nibName: "subscriptionTableViewCell", bundle: .main), forCellReuseIdentifier: "subscriptionTableViewCell")
        subscriptionTableView.delegate = self
        subscriptionTableView.dataSource = self
    }
    
    // MARK: - IBACTION METHODS
    @IBAction func handleFreeTrialTapped(_ sender: Any) {
        let subscribedVC = SubscribedViewController()
        self.navigationController?.pushViewController(subscribedVC, animated: true)
    }
}

// MARK: UITABLEVIEW DELEGATION
extension SubscriptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.subscriptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "subscriptionTableViewCell", for: indexPath) as? subscriptionTableViewCell
        else {
            return UITableViewCell()
        }
        // - Get model
        let model = subscriptions[indexPath.row]
        // - Setup cell
        cell.setupUI(isActive: model == self.selectedSubscription, subscription: model)
        cell.selectionStyle = .none
        // - Return cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // - Deselect row
        tableView.deselectRow(at: indexPath, animated: false)
        // - Get model
        let model = subscriptions[indexPath.row]
        // - Update selected model
        self.selectedSubscription = model
        // - Reload tableView
        self.subscriptionTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
