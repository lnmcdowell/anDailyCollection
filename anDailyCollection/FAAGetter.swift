//
//  FAAGetter.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/16/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyXMLParser

public class FAAGetter {
    
    
    init(){
        
    }
    public func getMetar(sender:UIViewController) {
       var localmetar:Metar?
        Alamofire.request("https://www.aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=xml&stationString=KDEN%20KSEA%20PHNL&hoursBeforeNow=2").response { response in
            if let data = response.data {
                let xml = XML.parse(data)
                // let datastring = String.init(data: data, encoding: String.Encoding.utf8)
                
//                print(xml["response","data","METAR",0,"station_id"].text!)
//                for i in 0...3 {
//                    print(xml.response.data.METAR[i].station_id.text!)
//                    if let myInt = Int(xml.response.time_taken_ms.text!) {
//                        print(myInt)
//                    }
//                    if let myTxt = xml.response.data.METAR[i].sky_condition[0].attributes["sky_cover"]{
//                        print(myTxt)
//                    }              //print(xml["response","data","METAR",i,"station_id"].text!)
//                }
                //print(datastring)// the top title of iTunes app raning.
               localmetar = Metar(station_id:xml.response.data.METAR[0].station_id.text ?? "Empty",
                            temp_c: Double(xml.response.data.METAR[0].temp_c.text!) ?? 0,
                            wind_speed_kt: Int(xml.response.data.METAR[0].wind_speed_kt.text!) ?? 0,
                            visibility_statute_mi: Double(xml.response.data.METAR[0].visibility_statute_mi.text!) ?? 0)
                print("here we go")
              let iterator = xml.response.data.METAR.makeIterator()
                while let next = iterator.next(){
                    if let txt = next.raw_text.text{
                        
                    print(txt)
                        let cc = next.sky_condition.makeIterator()
                        while let nextcc = cc.next(){
                          
                            if let outpt = Int(nextcc.attributes["cloud_base_ft_agl"]!) {
                              
                                print("\(outpt)")
                            }
                        }
                        
                        
                        
                    }
                }
            
                
            }
           
            let boss = sender as! CollectionViewController
            boss.metar = localmetar!
            boss.collectionView.reloadData()
            
        }//end response
    
            print("returning from Metar function")
        
    }
}
