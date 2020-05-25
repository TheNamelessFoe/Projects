//
//  mainViewVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/26/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class mainViewVC: UIViewController {

    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnFStatus: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnNearestAirports: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAbout.applyDesign()
        btnFStatus.applyDesign()
        btnSearch.applyDesign()
        btnNearestAirports.applyDesign()
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.jpeg")!)
        let backgroundImage = UIImage.init(named: "FlightImage.jpg")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)

        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7

        self.view.insertSubview(backgroundImageView, at: 0)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnClickAbout(_ sender: Any) {
        performSegue(withIdentifier: "seguemain2About", sender: self)
        
    }
    @IBAction func btnFlightStatus(_ sender: Any) {
        performSegue(withIdentifier: "mainViewVCToFlightStatusOptionsVC", sender: self)
    }
    
     @IBAction func btnSearchForFlights(_ sender: Any) {
        performSegue(withIdentifier: "mainViewVCToSearchForFlightsVC", sender: self)
     }
    
    @IBAction func btnNearestAirports(_ sender: Any) {
        performSegue(withIdentifier: "mainViewVCToGetAirportsVC", sender: self)
    }
    /*@IBAction func btnSearchForFlights(_ sender: Any) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
