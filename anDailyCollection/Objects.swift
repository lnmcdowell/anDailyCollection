//
//  Objects.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/16/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import Foundation

public enum sky_cover: CaseIterable  {
    case clr, few, overcast
    
}

public struct SkyCover {
    var sky_cover:sky_cover
    var cloud_base_ft_agl:Int
}

public struct Metar {
    
    let station_id:String
    let temp_c:Double
    let wind_speed_kt:Int
    let visibility_statute_mi:Double
   // let sky_condition:[SkyCover]?
}
