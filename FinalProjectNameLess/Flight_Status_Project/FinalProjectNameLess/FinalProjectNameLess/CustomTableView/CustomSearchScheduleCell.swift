//
//  CustomSearchScheduleCell.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 12/11/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class CustomSearchScheduleCell: UITableViewCell {

    @IBOutlet weak var lblNumberOfStops: UILabel!
    @IBOutlet weak var lblTotalDuration: UILabel!
    @IBOutlet weak var lblArrivalTime: UILabel!
    @IBOutlet weak var lblDepartureTime: UILabel!
    @IBOutlet weak var lblArrivalTerminal: UILabel!
    @IBOutlet weak var lblDepartureAirportCode: UILabel!
    @IBOutlet weak var lblArrivalAirportCode: UILabel!
    @IBOutlet weak var lblDepartureTerminal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
