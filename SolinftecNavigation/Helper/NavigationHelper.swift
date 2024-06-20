//
//  NavigationHelper.swift
//  SolinftecNavigation
//
//  Created by Diego Oliveira de Souza Alves on 07/02/23.
//

import Foundation
import MapboxDirections
import MapboxCoreNavigation
import CoreLocation

class NavigationHelper {
    class func waypointsBy(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) -> [Waypoint] {
        return [
            CLLocation(latitude: origin.latitude, longitude: origin.longitude),
            CLLocation(latitude: destination.latitude, longitude: destination.longitude)
        ].map { Waypoint(location: $0) }
    }
    
    class func optionsBy(waypoints: [Waypoint]) -> NavigationRouteOptions {
        let options = NavigationRouteOptions(waypoints: waypoints, profileIdentifier: .automobileAvoidingTraffic)
        options.includesAlternativeRoutes = true
        options.shapeFormat = .polyline6
        options.distanceMeasurementSystem = .metric
        options.roadClassesToAvoid = [.motorway]
        
        return options
    }
    
    class func responseRoute(from json: JSONDictionary, waypoints: [Waypoint], options: NavigationRouteOptions) -> ([Route]?) {
        
        var namedWaypoints: [Waypoint]?
        
        if let jsonWaypoints = (json["waypoints"] as? [JSONDictionary]) {
            namedWaypoints = zip(jsonWaypoints, waypoints).map { (api, local) -> Waypoint in
                let location = api["location"] as! [Double]
                let coordinate = CLLocationCoordinate2D(latitude: location[1], longitude: location[0])
                let possibleAPIName = api["name"] as? String
                let apiName = possibleAPIName?.nonEmptyString
                return Waypoint(coordinate: coordinate, name: local.name ?? apiName)
            }
        }
        
        let waypoints = namedWaypoints ?? waypoints
        
        let routes = (json["routes"] as? [JSONDictionary])?.map {
            Route(json: $0, waypoints: waypoints, options: options)
        }
        return routes
    }
    
    class func responseJSON(from json: JSONDictionary, waypoints: [Waypoint], options: NavigationRouteOptions) -> ([Waypoint]?, [Route]?) {
        var namedWaypoints: [Waypoint]?
        
        if let jsonWaypoints = (json["waypoints"] as? [JSONDictionary]) {
            namedWaypoints = zip(jsonWaypoints, waypoints).map { (api, local) -> Waypoint in
                let location = api["location"] as! [Double]
                let coordinate = CLLocationCoordinate2D(latitude: location[1], longitude: location[0])
                let possibleAPIName = api["name"] as? String
                let apiName = possibleAPIName?.nonEmptyString
                return Waypoint(coordinate: coordinate, name: local.name ?? apiName)
            }
        }
        
        let waypoints = namedWaypoints ?? waypoints
        
        let routes = (json["routes"] as? [JSONDictionary])?.map {
            Route(json: $0, waypoints: waypoints, options: options)
        }
        
        return (waypoints, routes)
    }
}

public typealias JSONDictionary = [String: Any]
