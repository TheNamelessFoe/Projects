//
//  FlightStatusByArrival.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 12/10/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import Foundation


//
//  FlightStatusService.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 12/7/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import Foundation

class FlightStatusByArrival
{
   struct FlightStatusByArrivalStruct {
        var flightNumber:String = ""
        var departureAirport:String = ""
        var arrivalAirport:String = ""
        var departureTime:String = ""
        var arrivalTime:String = ""
        var departureFlightDelay:String = ""
        var arrivalFlightDelay:String = ""
        //var departureGate:String = ""
        var arrivalGate:String = ""
    }
    var flightsArrival: [FlightStatusByArrivalStruct] = []
    
    let FlightStatusBaseURL: URL? = URL(string: "https://api.lufthansa.com/v1/operations/flightstatus/arrivals")
    
    // https://api.lufthansa.com/v1/operations/flightstatus/arrivals/HYD/2019-12-11T05:30
     func getStatus(IATA_Airport: String, dateTime: String, completion: @escaping ([FlightStatusByArrivalStruct]) -> Void)
    {
        
       if let flightStatusURL = URL(string: "\(FlightStatusBaseURL!)/\(IATA_Airport)/\(dateTime)") {
        print(flightStatusURL)
            do
            {
              
            let networkHandler = NetworkHandler(url: flightStatusURL)
            networkHandler.downloadJSONFromURL { (jsonDictionary) in
            
                var f = self.flightsArrival
                let dictionary = jsonDictionary! as? [String:Any]
                let FlightStatusResource = dictionary?["FlightStatusResource"] as! [String: AnyObject]
                let Flights = FlightStatusResource["Flights"]! as! [String: AnyObject]
                let Flight = Flights["Flight"]! as! [AnyObject]             //print(Flight)
                let flightCount = Flight.count
                
                    for index in 0..<flightCount{
                        let thisFlight = Flight[index]
                        let Departure = thisFlight["Departure"]! as! [String: AnyObject]
                        let Arrival = thisFlight["Arrival"]! as! [String: AnyObject]
                        var departureAirport = Departure["AirportCode"]!
                        var arrivalAirport = Arrival["AirportCode"]!
                        //print(departureAirport)
                        //print(arrivalAirport)
                        let DepartureScheduledTimeLocal = Departure["ScheduledTimeLocal"]! as! [String: AnyObject]
                        let ArrivalScheduledTimeLocal = Arrival["ScheduledTimeLocal"]! as! [String: AnyObject]
                        var departureTime = DepartureScheduledTimeLocal["DateTime"]!
                        var arrivalTime = ArrivalScheduledTimeLocal["DateTime"]!
                        //print(departureTime)
                        //print(arrivalTime)
                        let departureTimeStatus = Departure["TimeStatus"]! as! [String: AnyObject]
                        let ArrivalTimeStatus = Arrival["TimeStatus"]! as! [String: AnyObject]
                        var departureFlightDelay = departureTimeStatus["Definition"]!
                        var arrivalFlightDelay = ArrivalTimeStatus["Definition"]!
                        //print(departureFlightDelay)
                        //print(arrivalFlightDelay)
                        //let departureTerminal = Departure["Terminal"]! as! [String: AnyObject]
                        let ArrivalTerminal = Arrival["Terminal"]! as! [String: AnyObject]
                        //var departureGate = departureTerminal["Gate"]
                        var arrivalGate = ArrivalTerminal["Name"]!
                        //print(departureGate)
                        //print(arrivalGate)
                     let FlightNmuber = thisFlight["MarketingCarrier"]! as! [String: AnyObject]
                     //print(FlightNmuber)
                     var AirlineID = FlightNmuber["AirlineID"]!
                     var FlightNum = FlightNmuber["FlightNumber"]!
                     var fullFlightNmuber = "\(AirlineID)\(FlightNum)"
                     //print(fullFlightNmuber)
                        //print("------------------------------------------------------------------")
                     
                     f.append(FlightStatusByArrivalStruct(flightNumber: fullFlightNmuber, departureAirport: departureAirport as! String, arrivalAirport: arrivalAirport as! String, departureTime: departureTime as! String, arrivalTime: arrivalTime as! String, departureFlightDelay: departureFlightDelay as! String, arrivalFlightDelay: arrivalFlightDelay as! String, arrivalGate: arrivalGate as! String))
                     //print(flightsArrival)
                    }
                         //print("hell yeah")
                         //print(f[0].departureAirport)
                        completion(f)
                }
            }catch let error as NSError
                {
                    print("Error processing json data: \(error)")
                }
           
                }
        
             }
        }
    

