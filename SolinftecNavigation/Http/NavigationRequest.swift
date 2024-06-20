//
//  NavigationRequest.swift
//  SolinftecNavigation
//
//  Created by Diego Oliveira de Souza Alves on 07/02/23.
//

import Foundation

class NavigationRequest {
    class func dataTask(with url: URL, data: Data? = nil, completionHandler: @escaping (_ json: JSONDictionary) -> Void, errorHandler: @escaping (_ error: NSError) -> Void) -> URLSessionDataTask {
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(SolinftecNavigationManager.shared.token, forHTTPHeaderField: "x-auth-token")
        
        return URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            var json: JSONDictionary = [:]
            if let data = data, response?.mimeType == "application/json" {
                do {
                    json = try JSONSerialization.jsonObject(with: data, options: []) as! JSONDictionary
                } catch {
                    assert(false, "Invalid data")
                }
            }
            
            let apiStatusCode = json["code"] as? String
            let apiMessage = json["message"] as? String
            guard data != nil && error == nil && ((apiStatusCode == nil && apiMessage == nil) || apiStatusCode == "Ok") else {
                let apiError = ErrorResponse.informativeError(describing: json, response: response, underlyingError: error as NSError?)
                DispatchQueue.main.async {
                    errorHandler(apiError)
                }
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(json)
            }
        }
    }
}
