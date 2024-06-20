//
//  SolinftecNavigation.swift
//  SolinftecNavigation
//
//  Created by Diego Oliveira de Souza Alves on 07/02/23.
//

import Foundation
import MapboxDirections
import MapKit

class SolinftecNavigation {
    typealias RouteCompletionHandler = (_ waypoints: [Waypoint]?, _ routes: [Route]?, _ error: NSError?) -> Void
    
    class func calculateRoute(url: URL, origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, completionHandler: @escaping RouteCompletionHandler) -> URLSessionDataTask {
        
        let waypoints = NavigationHelper.waypointsBy(origin: origin, destination: destination)
        
        let options = NavigationHelper.optionsBy(waypoints: waypoints)

        let task = NavigationRequest.dataTask(with: url, completionHandler: { (json) in
            let responses = NavigationHelper.responseJSON(from: json, waypoints: waypoints, options: options)
            if let routes = responses.1 {
                for route in routes {
                    route.accessToken = ""
                    route.apiEndpoint = url
                    route.routeIdentifier = json["uuid"] as? String
                }
            }
            completionHandler(responses.0, responses.1, nil)
        }) { (error) in
            completionHandler(nil, nil, error)
        }
        
        task.resume()
        
        return task
    }
}
