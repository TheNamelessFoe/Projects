//
//  FlightScheduleSearchService.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 12/11/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import Foundation
class FlightScheduleSearchService{
    struct FlightScheduleSearchStruct {
        var durationOfFlight:[String] = []
        var departureAirportCode:[String]=[]
        var arrivalAirportCode:[String]=[]
        var dateTimeDeparture:[String]=[]
        var dateTimeArrival:[String]=[]
        var departureTerminalName:[String]=[]
        var arrivalTerminalName:[String]=[]
        var numberOfStops:[Int]=[]
        
    }
    let flightSearchBaseURL : URL?=URL(string:"https://api.lufthansa.com/v1/operations/schedules")
    func getAirlines(departFrom: String, arriveAt:String,flightDate:String, completion: @escaping(FlightScheduleSearchStruct?)->Void)
    {
        var f = FlightScheduleSearchStruct()
        if let flightSearchURL=URL(string:"\(flightSearchBaseURL!)/\(departFrom)/\(arriveAt)/\(flightDate)"){
            do{
                let networkHandler = NetworkHandler(url: flightSearchURL)
                networkHandler.downloadJSONFromURL { (jsonDictionary) in
                    
                //networkHandler.downloadJSONFromURL(jsonDictionary) in
                //TODO: Parse jsondICTIONARY into swift object.
                
                let dictionary = jsonDictionary! as? [String:Any]
                    let scheduleResource=dictionary?["ScheduleResource"] as! [String:AnyObject]
                    let schedule=scheduleResource["Schedule"] as! [AnyObject]
                    for index in 0..<schedule.count{
                        let thisSchedule=schedule[index]
                        let totalJourney = thisSchedule["TotalJourney"]! as! [String: AnyObject]
                        let duration = totalJourney["Duration"]
                        let parsed = duration?.replacingOccurrences(of: "PT", with: "")
                        f.durationOfFlight.append(parsed!)
                        let flight = thisSchedule["Flight"] as? [String:Any]
                        //print(flight)
                        if let flight1=flight{
                        let departureDetailsDic=flight1["Departure"] as! [String: AnyObject]
                        let departureAirport=departureDetailsDic["AirportCode"]
                        f.departureAirportCode.append(departureAirport as! String)
                        let scheduleTimeDepartureDic=departureDetailsDic["ScheduledTimeLocal"] as! [String: AnyObject]
                        let dateTimeOfDeparture=scheduleTimeDepartureDic["DateTime"]
                        f.dateTimeDeparture.append(dateTimeOfDeparture as! String)
                        let departureTerminalDetailsDic=departureDetailsDic["Terminal"] as! [String: AnyObject]
                        let departureTerminalName=departureTerminalDetailsDic["Name"]
                        f.departureTerminalName.append(departureTerminalName as! String)
                        let arrivalDetailsDic=flight1["Arrival"] as! [String: AnyObject]
                        let arrivalAirport=arrivalDetailsDic["AirportCode"]
                        f.arrivalAirportCode.append(arrivalAirport as! String)
                        let scheduleTimeArrivalDic=arrivalDetailsDic["ScheduledTimeLocal"] as! [String: AnyObject]
                        let dateTimeOfArrival=scheduleTimeArrivalDic["DateTime"]
                            f.dateTimeArrival.append(dateTimeOfArrival as! String)
                        let arrivalTerminalDetailsDic=arrivalDetailsDic["Terminal"] as! [String: AnyObject]
                        let arrivalTerminalName=arrivalTerminalDetailsDic["Name"]
                        f.arrivalTerminalName.append(arrivalTerminalName as! String)
                        let detailsDic=flight1["Details"] as! [String: AnyObject]
                        let numberOfStopsDic=detailsDic["Stops"] as! [String: AnyObject]
                            let numberOfStops=numberOfStopsDic["StopQuantity"]
                            f.numberOfStops.append(numberOfStops as! Int)
                        }
                        
                        
                    }
                   /* print(f.durationOfFlight)
                    print(f.departureAirportCode)
                    print(f.dateTimeDeparture)
                    print(f.departureTerminalName)
                    print(f.arrivalAirportCode)
                    print(f.dateTimeArrival)
                    print(f.arrivalTerminalName)
                    print(f.numberOfStops)*/
                    completion(f)

            }
        }
            catch let error as NSError
                 {
                     print("Error processing json data: \(error)")
                 }
            
    }
    }
}
