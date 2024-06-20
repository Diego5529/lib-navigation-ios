//
//  SolinftecDirections.swift
//  SolinftecNavigation
//
//  Created by Diego Oliveira de Souza Alves on 06/02/23.
//

import Foundation
import MapboxDirections
import CoreLocation

public class SolinftecDirections {
    public class func calculateResponse(url: URL, dataResponse: Data, origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) -> ([Route]?) {
        
        let waypoints = NavigationHelper.waypointsBy(origin: origin, destination: destination)
        
        let options = NavigationHelper.optionsBy(waypoints: waypoints)
        
        var json: JSONDictionary = [:]
        
        do {
            json = try JSONSerialization.jsonObject(with: dataResponse, options: []) as! JSONDictionary
        } catch {
            assert(false, "Invalid data")
        }
        
        let responses = NavigationHelper.responseRoute(from: json, waypoints: waypoints, options: options)
        if let routes = responses {
            for route in routes {
                route.accessToken = ""
                route.apiEndpoint = url
                route.routeIdentifier = json["uuid"] as? String
            }
        }
        
        return responses ?? []
    }
}
