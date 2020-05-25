//
//  ResultsVC.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/27/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
  //  @IBOutlet weak var lblToShowLoading: UILabel!
   // @IBOutlet weak var activityIN: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var departureAirportCode:[String]=[]
    var arrivalAirportCode:[String]=[]
    var departureTerminal:[String]=[]
    var arrivalTerminal:[String]=[]
    var departureTime:[String]=[]
    var arrivalTime:[String]=[]
    var totalDuration:[String]=[]
    var numberOfStops:[Int]=[]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departureAirportCode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomSearchScheduleCell
        cell.lblDepartureAirportCode.text=departureAirportCode[indexPath.row]
        cell.lblArrivalAirportCode.text=arrivalAirportCode[indexPath.row]
        cell.lblDepartureTerminal.text=departureTerminal[indexPath.row]
        cell.lblArrivalTerminal.text=arrivalTerminal[indexPath.row]
        cell.lblDepartureTime.text=departureTime[indexPath.row]
        cell.lblArrivalTime.text=arrivalTime[indexPath.row]
        cell.lblTotalDuration.text=totalDuration[indexPath.row]
        cell.lblNumberOfStops.text=String(numberOfStops[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155;
    }

    

    //@IBOutlet weak var lblForTest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
            //lblToShowLoading.text="Loading........"
        
        let backgroundImage = UIImage.init(named: "FlightImage.jpg")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        self.view.insertSubview(backgroundImageView, at: 0)
        // Do any additional setup after loading the view.
        let flightSearch = FlightScheduleSearchService()
        
        flightSearch.getAirlines(departFrom:departureAirport1 , arriveAt:arrivalAirport1,flightDate:date1)
        {(FlightScheduleSearchStruct) in
                DispatchQueue.main.async {                //self.lblForTest.text=(FlightScheduleSearchStruct?.departureAirportCode[0])!+(FlightScheduleSearchStruct?.arrivalAirportCode[0])!
                    //print(FlightScheduleSearchStruct?.dateTimeArrival[0])
                    self.departureAirportCode=FlightScheduleSearchStruct!.departureAirportCode
                    self.arrivalAirportCode=FlightScheduleSearchStruct!.arrivalAirportCode
                    self.departureTerminal=FlightScheduleSearchStruct!.departureTerminalName
                    self.arrivalTerminal=FlightScheduleSearchStruct!.arrivalTerminalName
                    self.departureTime=FlightScheduleSearchStruct!.dateTimeDeparture
                    self.arrivalTime=FlightScheduleSearchStruct!.dateTimeArrival
                    self.totalDuration=FlightScheduleSearchStruct!.durationOfFlight
                    self.numberOfStops=FlightScheduleSearchStruct!.numberOfStops
                    self.tableView.isHidden=false
                  
                        //self.lblToShowLoading.text=""
                    
                        
                    
                    self.tableView.reloadData()
                    //self.activityIN.hidesWhenStopped=true
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
