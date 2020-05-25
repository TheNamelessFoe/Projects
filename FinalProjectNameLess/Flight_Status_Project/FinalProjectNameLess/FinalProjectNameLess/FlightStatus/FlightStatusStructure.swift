//
//  FlightStatusStructure.swift
//  FinalProjectNameLess
//
//  Created by Thadisetti, Hari Kishore on 11/27/19.
//  Copyright © 2019 NameLess. All rights reserved.
//

import Foundation

struct LocalTimeScheduledDeparture: Decodable {
    var DateTime: String
}

struct LocalTimeScheduledArrival: Decodable {
    var DateTime: String
}

struct ArrivalTerminal: Decodable {
    var Name: String
}

struct DepartureTerminal: Decodable {
    var Name: String
}

struct ArrivalTimeStatus: Decodable {
    var Code: String
    var Definition: String
}

struct DepartureTimeStatus: Decodable {
    var Code: String
    var Definition: String
}

struct DepartureDetails: Decodable {
    var AirportCode: String
    var ScheduledTimeLocal: LocalTimeScheduledDeparture
    var TimeStatus: DepartureTimeStatus
    var Terminal: DepartureTerminal
}

struct ArrivalDetails: Decodable {
    var AirportCode: String
    var ScheduledTimeLocal: LocalTimeScheduledArrival
    var TimeStatus: ArrivalTimeStatus
    var Terminal: ArrivalTerminal
}

struct FlightDetails: Decodable {
    var Departure: DepartureDetails
    var Arrival: ArrivalDetails
}

struct FlightsDetail: Decodable {
    var Flight: [FlightDetails]
}

struct FlightStatusStructure: Decodable {
    var Flights: FlightsDetail
}

