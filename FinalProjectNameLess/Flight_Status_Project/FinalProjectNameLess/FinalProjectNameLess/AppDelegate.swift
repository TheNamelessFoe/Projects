//
//  AppDelegate.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 10/26/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


   /* struct FlightStatusByArrival {
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

    var flightsArrival: [FlightStatusByArrival] = []*/
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // https://api.lufthansa.com/v1/operations/flightstatus/route/FRA/JFK/2019-12-11?serviceType=passenger
     /*
      let url = URL(string: "https://api.lufthansa.com/v1/operations/flightstatus/arrivals/MUC/2019-12-11T05:30" )!
              
        
        
        
      let networkHandler1 = NetworkHandler(url: url)
                  networkHandler1.downloadJSONFromURL { (jsonDictionary) in
                      //print(jsonDictionary)
          
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
                  print(departureAirport)
                  print(arrivalAirport)
                  let DepartureScheduledTimeLocal = Departure["ScheduledTimeLocal"]! as! [String: AnyObject]
                  let ArrivalScheduledTimeLocal = Arrival["ScheduledTimeLocal"]! as! [String: AnyObject]
                  var departureTime = DepartureScheduledTimeLocal["DateTime"]!
                  var arrivalTime = ArrivalScheduledTimeLocal["DateTime"]!
                  print(departureTime)
                  print(arrivalTime)
                  let departureTimeStatus = Departure["TimeStatus"]! as! [String: AnyObject]
                  let ArrivalTimeStatus = Arrival["TimeStatus"]! as! [String: AnyObject]
                  var departureFlightDelay = departureTimeStatus["Definition"]!
                  var arrivalFlightDelay = ArrivalTimeStatus["Definition"]!
                  print(departureFlightDelay)
                  print(arrivalFlightDelay)
                  //let departureTerminal = Departure["Terminal"]! as! [String: AnyObject]
                  let ArrivalTerminal = Arrival["Terminal"]! as! [String: AnyObject]
                  //var departureGate = departureTerminal["Gate"]
                  var arrivalGate = ArrivalTerminal["Name"]!
                  //print(departureGate)
                  print(arrivalGate)
               let FlightNmuber = thisFlight["MarketingCarrier"]! as! [String: AnyObject]
               print(FlightNmuber)
               var AirlineID = FlightNmuber["AirlineID"]!
               var FlightNum = FlightNmuber["FlightNumber"]!
               var fullFlightNmuber = "\(AirlineID)\(FlightNum)"
               print(fullFlightNmuber)
                  print("------------------------------------------------------------------")
               
               f.append(FlightStatusByArrival(flightNumber: fullFlightNmuber, departureAirport: departureAirport as! String, arrivalAirport: arrivalAirport as! String, departureTime: departureTime as! String, arrivalTime: arrivalTime as! String, departureFlightDelay: departureFlightDelay as! String, arrivalFlightDelay: arrivalFlightDelay as! String, arrivalGate: arrivalGate as! String))
               //print(flightsArrival)
                  
              }
                   print("hell yeah")
             // print(f)
                   print(f[0].departureAirport)
           
           
           /*let dictionary = jsonDictionary! as? [String:Any]
           
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
       }*/
           
                          
       //print(f.list)
       //completion(f)
           }
             /*   let dictionary = jsonDictionary! as? [String:Any]
                let FlightStatusResource = dictionary?["FlightStatusResource"] as! [String: AnyObject]
                
               let Flights = FlightStatusResource["Flights"]! as! [String: AnyObject]
                let Flight = Flights["Flight"]! as! [AnyObject]
                
               // print(Flight)
                let flightCount = Flight.count
                var list = [String]()
                
                print(flightCount)
                for index in 0..<flightCount {
                 let thisFlight = Flight[index]
                 let FlightNmuber = thisFlight["MarketingCarrier"]! as! [String: AnyObject]
                    print("Hello111111-------------------------------------------------")
                    print(FlightNmuber)
                   var AirlineID = FlightNmuber["AirlineID"]!
                    var FlightNum = FlightNmuber["FlightNumber"]!
                    var fullFlightNmuber = "\(AirlineID)\(FlightNum)"
                    print(fullFlightNmuber)
                    list.append(fullFlightNmuber)
                    print(list)
                    
                }
                    print(list[1])
                    
                  //print("FLIGHT")
                   // print(index)
                   //print(thisFlight[index] )
                   // print(Flight[index])
                    //print("---------------------------------------------------------------------------")
                    
        }
                    /*
                    let Departure = thisFlight["Departure"]! as! [String: AnyObject]
                   // let Departure = thisFlight["Departure"]! as! [String: AnyObject]

                    //print(Departure["AirportCode"]!)
                    var name = Departure["AirportCode"]!

                    let Arrival = thisFlight["Arrival"]! as! [String: AnyObject]
                    // let Departure = thisFlight["Departure"]! as! [String: AnyObject]

                     //print(Departure["AirportCode"]!)
                     var nameD = Departure["AirportCode"]!
                     var nameA = Arrival["AirportCode"]!
                    
                     let ScheduledTimeLocal = Departure["ScheduledTimeLocal"]! as! [String: AnyObject]
                     print(nameA)
                     print(nameD)
                    //print(Flights)
    }
                
                
                print(flightCount)
                   print("hello")
               }
               print("hello")*/
        // Override point for customization after application launch.*/*/
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

