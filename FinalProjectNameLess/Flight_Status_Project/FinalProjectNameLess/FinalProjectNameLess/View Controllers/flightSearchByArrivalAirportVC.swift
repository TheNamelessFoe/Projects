//
//  flightSearchByArrivalAirportVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/27/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class flightSearchByArrivalAirportVC: UIViewController {

    @IBOutlet weak var txtArrAirport: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var txtArrDate: UITextField!
    private var datePicker: UIDatePicker?
    
    @IBOutlet weak var txtLbl: UILabel!
    @IBOutlet weak var lblArrFlights: UITextView!
    @IBOutlet weak var txtTime: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSearch.applyDesign()
        txtArrAirport.becomeFirstResponder()
        let backgroundImage = UIImage.init(named: "FlightImage.jpg")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        self.view.insertSubview(backgroundImageView, at: 0)
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flightSearchByNumberVC.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        txtArrDate.inputView = datePicker
        // Do any additional setup after loading the view.
    }
    //var DateTime:String =
    
    @IBAction func btnSearchByArrivalAirport(_ sender: Any) {
        var DateTime:String = txtArrDate.text! + "T" + txtTime.text!
        print(DateTime)
        let flightStatus = FlightStatusByArrival()
        struct FlightArrivals {
            var list:[String] = [""]
        }
        var g = FlightArrivals()
        flightStatus.getStatus(IATA_Airport: txtArrAirport.text!, dateTime: DateTime) {(FlightStatusByArrivalStruct) in
            DispatchQueue.main.async {
                self.txtLbl.text = "All flights arriving to " + (self.txtArrAirport.text!) + " in next 5 hrs are listed below:"
                var f = FlightStatusByArrivalStruct
                var fCount = f.count
                //print(f)
                for index in 0..<fCount{
                    g.list.append(f[index].flightNumber)
                }
                var temp = ""
                for index in 1..<g.list.count
                {
                    if index <= g.list.count && g.list[index] != nil
                    {
                        temp =  temp + "\n" + (String(index)) + ". " + g.list[index] + " "
                        //print(temp)
                    }
                }
                print(temp)
                self.lblArrFlights.text = temp
                //self.lblDepAirport.text = FlightStatusByNumber?.departureAirport
            }
        
        
        }
        
        //performSegue(withIdentifier: "flightSearchByArrivalAirportVCToResultsVC", sender: self)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
       {
           view.endEditing(true)
       }
       @objc func dateChanged(datePicker: UIDatePicker)
       {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           
           txtArrDate.text = dateFormatter.string(from: datePicker.date)
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
