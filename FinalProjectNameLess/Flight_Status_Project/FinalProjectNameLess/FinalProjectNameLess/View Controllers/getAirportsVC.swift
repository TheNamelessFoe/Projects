//
//  getAirportsVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/26/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class getAirportsVC: UIViewController {
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var lblView2: UITextView!
    @IBOutlet weak var lblView: UITextView!
    @IBOutlet weak var lblLong: UITextField!
    @IBOutlet weak var lblLat: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSearch.applyDesign()
        let backgroundImage = UIImage.init(named: "FlightImage.jpg")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        self.view.insertSubview(backgroundImageView, at: 0)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSearchForAirports(_ sender: Any) {
        
        let flightStatus = GetAirportsWithGPS()
        
        flightStatus.getNearestAiport(latitude: lblLat.text!,
                                      longitude: lblLong.text!)
            {(AirportCodeStruct) in
             DispatchQueue.main.async {
                
                var temp = " 1. " + (AirportCodeStruct!.Array[1]) + "\n 2. " + (AirportCodeStruct!.Array[2])
                var temp1 = "\n 3. " + (AirportCodeStruct!.Array[3]) + "\n 4. " + (AirportCodeStruct!.Array[4])
               var temp2 = "\n 5. " + (AirportCodeStruct!.Array[5] )
                self.lblView.text = temp + temp1 + temp2
                
                var temp3 = " 1. " + (AirportCodeStruct!.Cities[1]) + "\n 2. " + (AirportCodeStruct!.Cities[2])
                 var temp4 = "\n 3. " + (AirportCodeStruct!.Cities[3]) + "\n 4. " + (AirportCodeStruct!.Cities[4])
                var temp5 = "\n 5. " + (AirportCodeStruct!.Cities[5] )
                self.lblView2.text = temp3 + temp4 + temp5
                
                
                //self.lblView.text="Airport-City\n1.\(AirportCodeStruct?.Array[1])-\(AirportCodeStruct?.Cities[1])"
        
        
       // performSegue(withIdentifier: "getAirportsVCToResultsVC", sender: self)
    }
        }
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
