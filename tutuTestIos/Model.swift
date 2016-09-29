//
//  Model.swift
//  tutuTestIos
//
//  Created by Nick on 28.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import Foundation

//Модель данных

class Model: NSObject {
    let country: String
    let city: String
    let station: String
    let districtTitle: String
    let regionTitle: String
    
    override var description: String {
        return "Country: \(country), City: \(city), Station: \(station), DistrictTitle: \(districtTitle), RegionTitle: \(regionTitle)\n"
    }
    
    init(Country: String?, City: String?, Station: String?, DistrictTitle: String?, RegionTitle: String?) {
        self.country = Country ?? ""
        self.city = City ?? ""
        self.station = Station ?? ""
        self.districtTitle = DistrictTitle ?? ""
        self.regionTitle = RegionTitle ?? ""
    }
}
