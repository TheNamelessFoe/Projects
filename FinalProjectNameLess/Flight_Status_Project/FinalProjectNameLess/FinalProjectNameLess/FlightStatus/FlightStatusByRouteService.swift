//
//  FlightStatusService.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 12/7/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import Foundation


class FlightStatusByRouteService
{
    struct FlightStatusByRoute {
        var list:[String] = [""]
    }
    
    let FlightStatusBaseURL: URL? = URL(string: "https://api.lufthansa.com/v1/operations/flightstatus/route")
    
    // https://api.lufthansa.com/v1/operations/flightstatus/route/FRA/JFK/2019-12-11?serviceType=passenger
     func getStatus(originAirport: String, destAirport: String, flightDate: String, completion: @escaping (FlightStatusByRoute) -> Void)
    {
        
        var f = FlightStatusByRoute()
         var arrayNoOptionals:[String?] = [""]
       if let flightStatusURL = URL(string: "\(FlightStatusBaseURL!)/\(originAirport)/\(destAirport)/\(flightDate)?serviceType=passenger") {
        print(flightStatusURL)
            do
            {
              
            let networkHandler = NetworkHandler(url: flightStatusURL)
            networkHandler.downloadJSONFromURL { (jsonDictionary) in
            let dictionary = jsonDictionary! as? [String:Any]
            let FlightStatusResource = dictionary?["FlightStatusResource"] as! [String: AnyObject]
            let Flights = FlightStatusResource["Flights"]! as! [String: AnyObject]
            let Flight = Flights["Flight"]! as! [AnyObject]
            let flightCount = Flight.count
            //print(flightCount)
            for index in 0..<flightCount {
                let thisFlight = Flight[index]
                let FlightNmuber = thisFlight["MarketingCarrier"]! as! [String: AnyObject]
                print("-------------------------------------------------")
                print(FlightNmuber)
                var AirlineID = FlightNmuber["AirlineID"]!
                var FlightNum = FlightNmuber["FlightNumber"]!
                var fullFlightNmuber = "\(AirlineID)\(FlightNum)"
                //print(fullFlightNmuber)
                
                f.list.append(fullFlightNmuber)
               //print(arrayNoOptionals)
            }
                
                               
            //print(f.list)
            completion(f)
                }
            }catch let error as NSError
                {
                    print("Error processing json data: \(error)")
                }
           
                }
        
             }
        }
    

