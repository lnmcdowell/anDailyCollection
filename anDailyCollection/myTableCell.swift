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
                condView.text = metar_acc.flight_category.text
                
               
                titleView.text = metar_acc.station_id.text ?? "None"
                rawView.text = metar_acc.raw_text.text ?? "No raw text"
                nameView.text = "default"
                if let first = metar_acc.wind_dir_degrees.text {
                    if let second = metar_acc.wind_speed_kt.text {
                        nameView.text = first + " at " + second + "kt"
                        //draw arrow rotated
                        rotateArrow(angle:Double(metar_acc.wind_dir_degrees.text!)!)
                    }
                }
                let altimeterSetting = metar_acc.altim_in_hg.double ?? 0
                altView.text = String(format: "%.2f", altimeterSetting)
              
                
                tempView.text = metar_acc.temp_c.text! + "/" + metar_acc.dewpoint_c.text!
                
                
                        //let formatter = ISO8601DateFormatter()//this guy stinks
        let formatter = DateFormatter()
               formatter.timeZone = TimeZone(secondsFromGMT: 0)      // original string in GMT
                 formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"        //ISO8601 format
               let date = formatter.date(from: metar_acc.observation_time.text!)
         
         ///////////////////////////////////////////////////////
                 formatter.timeZone = TimeZone.current
                formatter.dateFormat = "HH:mm"
                //print(formatter.string(from: date!)) // shows HH:mm format perfectly
                
                let calendar = Calendar.current
//                let comp = calendar.dateComponents([.hour, .minute], from: date!)
//                let hour = comp.hour
//                let minute = comp.minute
//                print(hour!)
//                print(minute!)
//
                
                ///////////Time Since//////////////////
                let interval = calendar.dateComponents([.hour, .minute], from: date!, to: Date())
                
                var prettyTime = ""

                switch interval.hour! {
                case 0: break
                
                case 1: prettyTime += "1 hr,"
                    
                default: prettyTime += "\(interval.hour!)hrs,"
         
                }
                
                switch interval.minute! {
                case 0: prettyTime += " 0 mins old"
                case 1: prettyTime += " 1 min old"
                default: prettyTime += " \(interval.minute!) mins old"
                }
                
                
                elapsedView.text = prettyTime
                
            }
        }
    }
    
    
    func rotateArrow(angle:Double){
     
        
            var radians:CGFloat = CGFloat(angle * .pi/180)
            radians -= (.pi * 0.5) //original image points East, not North - this adjusts
            windImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            windImageView.transform = CGAffineTransform(rotationAngle: radians)
        
            
        
    }
    var data:DataNode?{
        didSet{
            condView.text = "\(data!.age ?? 0) yrs"
            nameView.text = data?.name
            titleView.text = data?.title
            
        }
    }
    
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        contentView.backgroundColor = .yellow
        contentView.addSubview(condView)
        contentView.addSubview(nameView)
        contentView.addSubview(titleView)
        contentView.addSubview(rawView)
        contentView.addSubview(altView)
        contentView.addSubview(windImageView)
        contentView.addSubview(tempView)
        contentView.addSubview(elapsedView)
        
        condView.doConstraints(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: altView.topAnchor, trailing:titleView.leadingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        nameView.doConstraints(top: contentView.topAnchor, leading: windImageView.trailingAnchor, bottom: titleView.topAnchor, trailing: tempView.leadingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        titleView.doConstraints(top: nameView.bottomAnchor, leading: condView.trailingAnchor, bottom: rawView.topAnchor, trailing: contentView.trailingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        windImageView.doConstraints(top: contentView.topAnchor, leading: condView.trailingAnchor, bottom: titleView.topAnchor, trailing: nameView.leadingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 60, height: 60)
        
        tempView.doConstraints(top: contentView.topAnchor, leading: nameView.trailingAnchor, bottom: titleView.topAnchor, trailing: contentView.trailingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        
        rawView.doConstraints(top: altView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
      
        
        condView.widthAnchor.constraint(equalTo: titleView.widthAnchor, multiplier: 0.5).isActive = true
        nameView.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 2).isActive = true
        titleView.heightAnchor.constraint(equalTo: nameView.heightAnchor, multiplier: 0.5).isActive = true
        altView.heightAnchor.constraint(equalTo: condView.heightAnchor, multiplier: 0.3).isActive = true
        
        altView.doConstraints(top: condView.bottomAnchor, leading: contentView.leadingAnchor, bottom: rawView.topAnchor, trailing: titleView.leadingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        
        elapsedView.doConstraints(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, topPad: 0, leadPad: 5, botPad: 0, trailPad: 0, width: 100, height: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var windImageView:UIImageView = {
        //how do you fail gracefully if image isn't created for some reason?
        let img = UIImageView(image: UIImage(named:"Arrow"))
        //(named: "Arrow")!
        return img
       }()
    
    
    var condView:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "GillSans", size: 30)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.layer.borderColor = UIColor.red.cgColor
        lbl.layer.borderWidth = 1
        lbl.layer.backgroundColor = UIColor.red.cgColor
        return lbl
    }()
    
    var nameView:UILabel = {
        let nlbl = UILabel()
        nlbl.textAlignment = .center
        nlbl.backgroundColor = .white
        nlbl.layer.cornerRadius = 10
        nlbl.layer.borderWidth = 2
        nlbl.layer.borderColor = UIColor.black.cgColor
        nlbl.font = UIFont(name: "GillSans", size: 18)
        nlbl.textColor = .black
        return nlbl
    }()
    
    var tempView:UILabel = {
       let tv = UILabel()
        tv.font = UIFont(name: "GillSans", size: 14)
        tv.textColor = .black
        tv.layer.borderWidth = 1
        tv.layer.borderColor = UIColor.orange.cgColor
        tv.layer.cornerRadius = 5
        tv.textAlignment = .center
        return tv
    }()
    
    var altView:UILabel = {
        let nlbl = UILabel()
        nlbl.textAlignment = .center
        nlbl.layer.backgroundColor = UIColor.clear.cgColor
        nlbl.layer.cornerRadius = 1
        nlbl.layer.borderWidth = 1
        nlbl.layer.borderColor = UIColor.black.cgColor
        nlbl.font = UIFont(name: "GillSans", size: 10)
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
        rl.textAlignment = .center
        rl.textColor = .blue
        rl.font = UIFont(name: "GillSans", size: 10)
        rl.numberOfLines = 3
        rl.layer.cornerRadius = 2
        rl.layer.borderColor = UIColor.blue.cgColor
        rl.layer.borderWidth = 2
        
        return rl
    }()
    
    var elapsedView:UILabel = {
       let ev = UILabel()
        
        ev.textAlignment = .center
        ev.font = UIFont(name: "GillSans", size: 14)
        ev.textColor = .purple
        ev.backgroundColor = .white
        ev.layer.borderColor = UIColor.purple.cgColor
        ev.layer.borderWidth = 1
        return ev
        
    }()
}

