//
//  subscriptionTableViewCell.swift
//  absavage-ios
//
//  Created by MEKARI on 26/11/22.
//

import UIKit

class subscriptionTableViewCell: UITableViewCell {
    // MARK: - PROPERTIES
    // MARK: IBOUTLET
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var radioButtonImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var perMonthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(isActive: Bool, subscription: Subscription) {
        if isActive {
            mainContainer.backgroundColor = UIColor(red: 255.0/255.0, green: 36.0/255.0, blue: 36.0/255.0, alpha: 0.1)
            mainContainer.layer.borderColor = UIColor(red: 244/255.0, green: 43/255.0, blue: 87/255.0, alpha: 1).cgColor
            radioButtonImageView.image = UIImage(named: "radio-on")
            mainContainer.layer.borderWidth = 1
        } else {
            mainContainer.backgroundColor = UIColor(red: 0.173, green: 0.173, blue: 0.18, alpha: 1)
            mainContainer.layer.borderColor = UIColor.clear.cgColor
            radioButtonImageView.image = UIImage(named: "radio-off")
            mainContainer.layer.borderWidth = 0
        }
        // - Style
        contentView.backgroundColor = .clear
        mainContainer.layer.cornerRadius = 10
        // - Data
        titleLabel.text = subscription.name
        subtitleLabel.text = subscription.description
        priceLabel.text = "\(subscription.price)"
        currencyLabel.text = "$"
        perMonthLabel.text = "\(subscription.perString)"
    }
}
