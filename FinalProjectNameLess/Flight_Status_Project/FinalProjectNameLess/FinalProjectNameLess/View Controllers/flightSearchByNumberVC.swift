//
//  flightSearchByNumberVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/26/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class flightSearchByNumberVC: UIViewController {

    @IBOutlet weak var txtFlightDate: UITextField!
    @IBOutlet weak var txtFlightNumber: UITextField!
    @IBOutlet weak var lblTest: UILabel!
    private var datePicker: UIDatePicker?
    @IBOutlet weak var lblDepAirport: UILabel!
    @IBOutlet weak var lblDepTime: UILabel!
    @IBOutlet weak var lblArrAirport: UILabel!
    @IBOutlet weak var lblArrTime: UILabel!
    @IBOutlet weak var lblDepDelay: UILabel!
    @IBOutlet weak var lblArrDelay: UILabel!
    @IBOutlet weak var lblDepartureGate: UILabel!
    @IBOutlet weak var lblArrGate: UILabel!
    
    @IBOutlet weak var btnSearch: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSearch.applyDesign()
        txtFlightNumber.becomeFirstResponder()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flightSearchByNumberVC.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        txtFlightDate.inputView = datePicker

        let backgroundImage = UIImage.init(named: "FlightImage.jpg")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        self.view.insertSubview(backgroundImageView, at: 0)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnSearchByNumber(_ sender: Any) {
        let flightStatus = FlightStatusService()
        
        flightStatus.getStatus(flightNumber: txtFlightNumber.text!, flightDate: txtFlightDate.text!)
        {(FlightStatusByNumber) in
            DispatchQueue.main.async {
                self.lblDepAirport.text = FlightStatusByNumber?.departureAirport
                self.lblDepTime.text = FlightStatusByNumber?.departureTime
                self.lblArrAirport.text = FlightStatusByNumber?.arrivalAirport
                self.lblArrTime.text = FlightStatusByNumber?.arrivalTime
                self.lblDepDelay.text = FlightStatusByNumber?.departureFlightDelay
                self.lblArrDelay.text = FlightStatusByNumber?.arrivalFlightDelay
                self.lblDepartureGate.text = FlightStatusByNumber?.departureGate
                self.lblArrGate.text = FlightStatusByNumber?.arrivalGate
            }
          
            //do nothing
        }

        
       // performSegue(withIdentifier: "flightSearchByNumberVCToResultsVC", sender: self)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        txtFlightDate.text = dateFormatter.string(from: datePicker.date)
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
