//
//  SolinftecMapBoxStyle.swift
//  SolinftecNavigation
//
//  Created by Diego Oliveira de Souza Alves on 23/03/23.
//

import Foundation
import MapboxNavigation

class SolinftecMapboxStyle: Style {
    required public init(style: String, isSatellite: Bool) {
        let urlpath = Bundle.main.path(forResource: isSatellite ? "style-satellite" : style, ofType: "json") ?? ""
        let url = NSURL.fileURL(withPath: urlpath)
        
        super.init(mapStyleURL: url)
    }
    
    @objc required init(mapStyleURL: URL) {
        fatalError("init(mapStyleURL:) has not been implemented")
    }
    
    public override func apply() {
        super.apply()
    }
}
