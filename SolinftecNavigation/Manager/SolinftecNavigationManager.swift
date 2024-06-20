//
//  SolinftecNavigationManager.swift
//  SolinftecNavigation
//
//  Created by Diego Oliveira de Souza Alves on 09/02/23.
//

import Foundation

public final class SolinftecNavigationManager {
    public static let shared = SolinftecNavigationManager()
    
    var mapTilerURL: String = "https://api.maptiler.com/maps/streets-v2/style.json?key="
    var token: String = ""
    
    public static func configure(mapTilerURL: String, token: String) {
        SolinftecNavigationManager.shared.mapTilerURL = mapTilerURL
        SolinftecNavigationManager.shared.token = token
    }
}
