//
//  stateRepresentativeTableViewCell.swift
//  Representative
//
//  Created by Apps on 8/14/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class stateRepresentativeTableViewCell: UITableViewCell {
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!

    func updateViews() {
        guard let representative = representative else { return }
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = ("District: \(representative.district)")
        websiteLabel.text = representative.link
        phoneNumberLabel.text = representative.phone
}
}
