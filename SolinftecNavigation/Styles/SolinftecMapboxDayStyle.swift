//
//  SolinftecMapboxDayStyle.swift
//  SolinftecNavigation
//
//  Created by Diego Oliveira de Souza Alves on 23/03/23.
//

import Foundation
import MapboxNavigation

public class SolinftecMapboxDayStyle: DayStyle {
    required public init(isSatellite: Bool) {
        super.init(mapStyleURL: SolinftecMapboxStyle(style: "style-light", isSatellite: isSatellite).mapStyleURL)
        
        styleType = .day
    }
    
    required init(mapStyleURL: URL) {
        fatalError("init(mapStyleURL:) has not been implemented")
    }
    
    public override func apply() {
        super.apply()
    }
}
