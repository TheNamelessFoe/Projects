//
//  FlightStatusRequest.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 11/27/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import Foundation

enum FlightStatusError:Error{
    case noDataFromJSON
    case canNotProcessData
}


class FlightStatusRequest
{
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
       //lazy var session: URLSession = URLSession(configuration: URLSessionConfiguration)
       lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    init (number:String, date:String)
    {
        //self.number = number
        //self.date = date
    }
    
    func getFlightStatus(completion: @escaping(Result<[FlightDetails], FlightStatusError>) -> Void) {
        let resourceURL:URL
              let resourceString = URL(string: "https://api.lufthansa.com/v1/operations/flightstatus/LH2039/2019-11-29" )!
        var request = URLRequest(url: resourceString)
               
               request.setValue("Bearer 4rg9yuxv43qy6sfcne3n86m2", forHTTPHeaderField: "Authorization")  // the request is JSON
               request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")        // the expected response is also JSON
               request.httpMethod = "GET"
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataFromJSON))
                return
            }
            do {
                let decoder = JSONDecoder()
                let FlightResponse = try decoder.decode(FlightStatusStructure.self, from: jsonData)
                let FlightDetail = FlightResponse.Flights.Flight
                completion(.success(FlightDetail))
                print(data)
            }
            catch {
                completion(.failure(.canNotProcessData))
            }
        }
        
    }

}
