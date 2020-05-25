//
//  GetAirportsService.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 12/10/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import Foundation
class GetAirportsWithGPS{

    struct AirportCodeStruct {
    var Array:[String] = [""]
        var Cities:[String] = [""]
    }

//var thisCity:[String] = ["","","","",""]
let nearestAirportBaseURL: URL? = URL(string: "https://api.lufthansa.com/v1/references/airports/nearest")
func getNearestAiport(latitude:String,longitude:String,completion: @escaping (AirportCodeStruct?) -> Void){
    var f = AirportCodeStruct()
    
    if let nearestAirportURL=URL(string: "\(nearestAirportBaseURL!)/\(latitude),\(longitude)"){
        do
        {//https://api.lufthansa.com/v1/references/airports/nearest/51.5,-0.142
            //print(nearestAirportURL)
            let networkHandler=NetworkHandler(url:nearestAirportURL)
            networkHandler.downloadJSONFromURL {(jsonDictionary) in
                let dictionary = jsonDictionary! as [String:Any]
                //print(jsonDictionary)
                let NearestAirportResource = dictionary["NearestAirportResource"] as! [String: AnyObject]
                let Airports = NearestAirportResource["Airports"] as! [String: AnyObject]
                let Airport = Airports["Airport"]! as! [AnyObject]
                let airportCount = Airport.count
                
                
                 for index in 0..<airportCount {
                     let thisAirport = Airport[index]
                     let AirportCode=thisAirport["AirportCode"]!
                    let CityCode=thisAirport["CityCode"]
                    f.Cities.append(CityCode as! String)
                    f.Array.append(AirportCode as! String)
                    
                 }
                print(f.Cities)
                print(f.Array)
                 /*
                //let thisAirport=Airport[0]
               // let AirportCode=thisAirport["AirportCode"]
                
                //print(AirportCode!!)
                var f = AirportCodeStruct()
                f.airportCode = AirportCode as! String*/
                completion(f)
                
            }
        }
}
}
}
