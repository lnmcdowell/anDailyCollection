//
//  myCell.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/15/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

class myCell: UICollectionViewCell {
    var data:DataNode?{
        didSet{
            ageView.text = "\(data!.age ?? 0) yrs"
             nameView.text = data?.name
             titleView.text = data?.title
            
        }
    }
    var metar:Metar?{
        didSet{
            if let nmetar = metar {
            titleView.text = nmetar.station_id
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        contentView.backgroundColor = .yellow
        contentView.addSubview(ageView)
        contentView.addSubview(nameView)
        contentView.addSubview(titleView)
        ageView.doConstraints(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing:nil, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        nameView.doConstraints(top: contentView.topAnchor, leading: ageView.trailingAnchor, bottom: titleView.topAnchor, trailing: contentView.trailingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        titleView.doConstraints(top: nameView.bottomAnchor, leading: ageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, topPad: 5, leadPad: 5, botPad: -5, trailPad: -5, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ageView:UILabel = {
       let lbl = UILabel()
        lbl.font = UIFont(name: "GillSans", size: 30)
        lbl.textColor = .red
        lbl.textAlignment = .center
        return lbl
    }()
    
    var nameView:UILabel = {
        let nlbl = UILabel()
        nlbl.textAlignment = .center
        nlbl.backgroundColor = .white
        nlbl.layer.cornerRadius = 10
        nlbl.layer.borderWidth = 2
        nlbl.layer.borderColor = UIColor.black.cgColor
        return nlbl
    }()
    
    var titleView:UILabel = {
        let tlbl = UILabel()
        tlbl.textAlignment = .center
        tlbl.backgroundColor = .orange
        return tlbl
    }()
}
