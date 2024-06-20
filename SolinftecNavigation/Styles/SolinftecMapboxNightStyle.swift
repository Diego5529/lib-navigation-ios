//
//  SolinftecMapboxNightStyle.swift
//  SolinftecNavigation
//
//  Created by Diego Oliveira de Souza Alves on 23/03/23.
//

import Foundation
import MapboxNavigation

public class SolinftecMapboxNightStyle: NightStyle {
    required public init(isSatellite: Bool) {
        super.init(mapStyleURL: SolinftecMapboxStyle(style: "style-dark", isSatellite: isSatellite).mapStyleURL)
        
        styleType = .night
    }
    
    required init(mapStyleURL: URL) {
        fatalError("init(mapStyleURL:) has not been implemented")
    }
    
    public override func apply() {
        super.apply()
    }
}
