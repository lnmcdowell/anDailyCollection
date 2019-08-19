//
//  myTableCell.swift
//  anDailyCollection
//
//  Created by Larry Mcdowell on 8/17/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
import UIKit
import SwiftyXMLParser

class myTableCell: UITableViewCell {
    var metar_accessor:XML.Accessor?{
        didSet{
            if let metar_acc = metar_accessor {
                ageView.text = metar_acc.flight_category.text
                
                //print(metar_acc.flight_category.text ?? "No FC")
                titleView.text = metar_acc.station_id.text ?? "None"
                rawView.text = metar_acc.raw_text.text ?? "No raw text"
                nameView.text = "default"
                if let first = metar_acc.wind_dir_degrees.text {
                    if let second = metar_acc.wind_speed_kt.text {
                        nameView.text = first + " at " + second + "kt"
                    }
                }
                let altimeterSetting = metar_acc.altim_in_hg.double ?? 0
                altView.text = String(format: "%.2f", altimeterSetting)
                ////altView.text = metar_acc.altim_in_hg.text ?? "Alt"
                let dateFormatter = ISO8601DateFormatter()
                dateFormatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)
               
                let date = dateFormatter.date(from: metar_acc.observation_time.text!)
                
                print(date)
            }
        }
    }
    
    var data:DataNode?{
        didSet{
            ageView.text = "\(data!.age ?? 0) yrs"
            nameView.text = data?.name
            titleView.text = data?.title
            
        }
    }
    
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        contentView.backgroundColor = .yellow
        contentView.addSubview(ageView)
        contentView.addSubview(nameView)
        contentView.addSubview(titleView)
        contentView.addSubview(rawView)
        contentView.addSubview(altView)
        ageView.doConstraints(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: rawView.topAnchor, trailing:nil, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        nameView.doConstraints(top: contentView.topAnchor, leading: ageView.trailingAnchor, bottom: titleView.topAnchor, trailing: contentView.trailingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        titleView.doConstraints(top: nameView.bottomAnchor, leading: ageView.trailingAnchor, bottom: rawView.topAnchor, trailing: contentView.trailingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        
        
        
        rawView.doConstraints(top: ageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        rawView.heightAnchor.constraint(equalTo: ageView.heightAnchor, multiplier: 0.5).isActive = true
        ageView.widthAnchor.constraint(equalTo: titleView.widthAnchor, multiplier: 0.5).isActive = true
        
        altView.doConstraints(top: titleView.topAnchor, leading: contentView.leadingAnchor, bottom: rawView.topAnchor, trailing: titleView.leadingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ageView:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "GillSans", size: 30)
        lbl.textColor = .red
        lbl.textAlignment = .left
        return lbl
    }()
    
    var nameView:UILabel = {
        let nlbl = UILabel()
        nlbl.textAlignment = .center
        nlbl.backgroundColor = .white
        nlbl.layer.cornerRadius = 10
        nlbl.layer.borderWidth = 2
        nlbl.layer.borderColor = UIColor.black.cgColor
        nlbl.font = UIFont(name: "GillSans", size: 14)
        nlbl.textColor = .black
        return nlbl
    }()
    
    var altView:UILabel = {
        let nlbl = UILabel()
        nlbl.textAlignment = .center
        nlbl.layer.backgroundColor = UIColor.clear.cgColor
        nlbl.layer.cornerRadius = 1
        nlbl.layer.borderWidth = 1
        nlbl.layer.borderColor = UIColor.black.cgColor
        nlbl.font = UIFont(name: "GillSans", size: 8)
        nlbl.textColor = .blue
        return nlbl
    }()
    
    var titleView:UILabel = {
        let tlbl = UILabel()
        tlbl.textAlignment = .center
        tlbl.backgroundColor = .orange
        return tlbl
    }()
    
    var rawView:UILabel = {
        let rl = UILabel()
        rl.backgroundColor = .cyan
        rl.textAlignment = .left
        rl.textColor = .blue
        rl.font = UIFont(name: "GillSans", size: 8)
        rl.numberOfLines = 3
        rl.layer.cornerRadius = 2
        rl.layer.borderColor = UIColor.blue.cgColor
        rl.layer.borderWidth = 2
        
        return rl
    }()
}

