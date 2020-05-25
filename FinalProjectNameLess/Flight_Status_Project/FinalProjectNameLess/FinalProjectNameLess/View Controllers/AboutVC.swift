//
//  AboutVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 12/11/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var rest: UITextField!
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var viewLbl: UITextView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var b: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        rest.becomeFirstResponder()
        btnAdd.applyDesign()
        
        
        //viewLbl.text = "This app gives you flight status based on different parameters like Flight Number, date, arival/destination airports and GPS coordinates. This is the work of 3 programmers who didn't know how to find flight schedules on Google. Oh! If you want to search for flights from Emirates, Qatar, Jet Airways or any other airlines other than Lufthansa, then we can't help you. You see Lufthansa gave us their API for free!!!, while others wanted us to pay. All this info is found on google any way. If you can use this app then we are sure that you can Google for flights too."

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var lblDetails: UITextView!
    
    @IBAction func btnAdd(_ sender: Any) {
        
        if rest.text! == String(154){
            viewLbl.text = "Welcome!! Nameless Airlines. This app gives you flight status based on different parameters like Flight Number, date, arival/destination airports and GPS coordinates. This is the work of 3 programmers who didn't know how to find flight schedules on Google and help others like them. Oh! If you want to search for flights from Emirates, Qatar, Jet Airways or any other airlines other than Lufthansa, then we can't help you. You see, Lufthansa gave us their API for free!!!, while others wanted us to pay. All this info is found on google any way. If you can use this app then we are sure that you can Google for flights too."
            lblDetails.text! = "All rights reserved by @NamelessAirlines" + "\n"
            + "Developed by: " + "\n" + "1. Nameless Programmer" + "\n" + "2. Thadisetti, Hari Kishore" + "\n" + "3. Krishnapriya Parumanchala" + "\n" + "Software Version: 6.1β"
        }
        else if rest.text! == String(0){
            viewLbl.text = "Something Just Like This - Coldplay" + "\n" + "\n" +
            "I've been reading books of old" + "\n" +
            "The legends and the myths" + "\n" +
            "Achilles and his gold" + "\n" +
            "Hercules and his gifts" + "\n" +
            "Spiderman's control" + "\n" +
            "And Batman with his fists" + "\n" +
            "And clearly I don't see myself upon that list" + "\n" +
            "But she said, where'd you wanna go?" + "\n" +
            "How much you wanna risk?" + "\n" +
            "I'm not looking for somebody" + "\n" +
            "With some superhuman gifts" + "\n" +
            "Some superhero" + "\n" +
            "Some fairytale bliss" + "\n" +
            "Just something I can turn to" + "\n" +
            "Somebody I can kiss" + "\n" +
            "I want something just like this"
            lblDetails.text! = " Wrong answer but, you have unlocked the real thing that matters. Enjoy the Lyrics!!!"
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
