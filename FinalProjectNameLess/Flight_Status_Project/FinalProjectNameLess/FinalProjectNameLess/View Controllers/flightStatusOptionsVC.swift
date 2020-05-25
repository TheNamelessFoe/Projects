//
//  flightStatusOptionsVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/26/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class flightStatusOptionsVC: UIViewController {

    @IBOutlet weak var btnNum: UIButton!
    @IBOutlet weak var btnRoute: UIButton!
    @IBOutlet weak var btn3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNum.applyDesign()
        btnRoute.applyDesign()
        btn3.applyDesign()
        let backgroundImage = UIImage.init(named: "FlightImage.jpg")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        self.view.insertSubview(backgroundImageView, at: 0)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSearchByFlightNumber(_ sender: Any) {
        performSegue(withIdentifier: "flightStatusOptionsVCToFlightSearchByNumberVC", sender: self)
    }
    @IBAction func btnSearchByRoute(_ sender: Any) {
        performSegue(withIdentifier: "flightStatusOptionsVCToFlightSearchByRouteVC", sender: self)
    }
    @IBAction func btnSearchByArrivalAirport(_ sender: Any) {
        performSegue(withIdentifier: "flightStatusOptionsVCToFlightSearchByArrivalAirportVC", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
