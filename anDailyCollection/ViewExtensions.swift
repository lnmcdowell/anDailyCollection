//
//  ViewExtensions.swift
//  anDailyCollection
//
//  Created by Larry Mcdowell on 8/18/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit
import SwiftyXMLParser

protocol  XMLCarrier {
    
    var xmlResponse:XML.Accessor?{get set}
    
    func reloadDataExt()
}
