//
//  searchForFlightsVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/26/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit
var departureAirport1=""
var arrivalAirport1=""
var date1=""
class searchForFlightsVC: UIViewController {
// private var datePicker: UIDatePicker?
    @IBOutlet weak var txtDepartureAirport: UITextField!
    
    @IBOutlet weak var txtArrivalAirport: UITextField!
    
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
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
    

    @IBAction func btnSearchForFlights(_ sender: Any) {
        departureAirport1=txtDepartureAirport.text!
        arrivalAirport1=txtArrivalAirport.text!
        date1=txtDate.text!
        
        performSegue(withIdentifier: "searchForFlightsVCToResultsVC", sender: self)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
       {
           view.endEditing(true)
       }
       @objc func dateChanged(datePicker: UIDatePicker)
       {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           
           //txtFlightDate.text = dateFormatter.string(from: datePicker.date)
           view.endEditing(true)
           
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
