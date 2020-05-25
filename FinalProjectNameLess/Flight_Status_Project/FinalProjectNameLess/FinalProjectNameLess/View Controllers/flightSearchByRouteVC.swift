//
//  flightSearchByRouteVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/26/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class flightSearchByRouteVC: UIViewController {
    
    private var datePicker: UIDatePicker?
    
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDest: UITextField!
    @IBOutlet weak var lblOrigin: UITextField!
    
    @IBOutlet weak var lblFlightList: UITextView!
    @IBOutlet weak var lblDate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSearch.applyDesign()
        
        
        lblOrigin.becomeFirstResponder()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
               
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flightSearchByNumberVC.viewTapped(gestureRecognizer:)))
               
        view.addGestureRecognizer(tapGesture)
               
        lblDate.inputView = datePicker
        
        let backgroundImage = UIImage.init(named: "FlightImage.jpg")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        self.view.insertSubview(backgroundImageView, at: 0)
        //lblFlightList.backgroundColor = [UIColor clearColor];
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSearchByRoute(_ sender: Any) {
        let flightStatus = FlightStatusByRouteService()
               
        flightStatus.getStatus(originAirport: lblDest.text!, destAirport: lblOrigin.text!,flightDate:lblDate.text!)
            {(FlightStatusByRoute) in
                DispatchQueue.main.async {
                    self.lblDesc.text = "All flights from " + (self.lblDest.text!) + " to " + (self.lblOrigin.text!) + " are listed below:"
                print("hello")
                    print(FlightStatusByRoute.list)
                    
                    
                   
                    
                    var temp = ""
                    for index in 1..<FlightStatusByRoute.list.count
                    {
                        if index <= FlightStatusByRoute.list.count && FlightStatusByRoute.list[index] != nil
                        {
                            temp =  temp + "\n" + (String(index)) + ". " + FlightStatusByRoute.list[index] + " "
                            //print(temp)
                        }
                    }
                    print(temp)
                    self.lblFlightList.text = temp
                    
                    
                /*self.lblFlightList.text = "1. " + (FlightStatusByRoute.list[1]!) + "\n 2. " + (FlightStatusByRoute.list[2]!) + "\n 3. " + (FlightStatusByRoute.list[3]! ) + "\n 4. " + (FlightStatusByRoute.list[4]! ) + "\n 5. " + (FlightStatusByRoute.list[5]! ) + "\n 6. " + (FlightStatusByRoute.list[6]! )*/
                }
            }
        
        //performSegue(withIdentifier: "flightSearchByRouteVCToResultsVC", sender: self)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
       {
           view.endEditing(true)
       }
    @objc func dateChanged(datePicker: UIDatePicker)
       {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           
           lblDate.text = dateFormatter.string(from: datePicker.date)
           view.endEditing(true)
           
       }
    
    }
    extension UIButton {
    func applyDesign() {
        self.backgroundColor = UIColor.darkGray
        self.frame.size = CGSize(width: 90.0, height: 50.0)
        self.layer.cornerRadius = self.frame.height / 2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
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
