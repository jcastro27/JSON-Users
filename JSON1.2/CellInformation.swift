//
//  CellInformation.swift
//  JSON1.2
//
//  Created by Joseph Castro on 6/21/22.
//

import UIKit

class CellInformation: UITableViewCell {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var companyName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
