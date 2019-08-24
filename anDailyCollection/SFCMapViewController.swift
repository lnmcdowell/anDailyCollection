//
//  SFCMapViewController.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/24/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

class SFCMapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews(){
        let myScrollView = UIScrollView()
        self.view.frame = UIScreen.main.bounds
        
        self.view.addSubview(myScrollView)
        
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        myScrollView.addSubview(stackView)
        
        
        myScrollView.stickToContainer(container: self.view)
        stackView.stickToContainer(container: myScrollView)
        
        myScrollView.isScrollEnabled = true
        myScrollView.showsHorizontalScrollIndicator = true
        myScrollView.clipsToBounds = false
        //myScrollView.contentSize.width = 1200
        
        //self.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        stackView.addSubview(SFCImageView)
        stackView.addSubview(SFC2ndImageView)
        stackView.addSubview(SFC3rdImageView)
        
        stackView.heightAnchor.constraint(equalTo: myScrollView.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 1500).isActive = true
        
        SFCImageView.translatesAutoresizingMaskIntoConstraints = false
       // SFCImageView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor, constant: 0).isActive = true
       // SFCImageView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor, constant: 0).isActive = true
        SFCImageView.doConstraints(top: stackView.topAnchor, leading: stackView.leadingAnchor, bottom: nil, trailing: SFC2ndImageView.leadingAnchor, topPad: 0, leadPad: 0, botPad: 0, trailPad: 0, width: 400, height: 400)
  
   
        SFC2ndImageView.doConstraints(top: SFCImageView.topAnchor, leading: SFCImageView.trailingAnchor, bottom:nil, trailing: SFC3rdImageView.leadingAnchor, topPad: 5, leadPad: 0, botPad: 0, trailPad: 0, width: 400, height: 400)
         SFC3rdImageView.doConstraints(top: SFCImageView.topAnchor, leading: SFC2ndImageView.trailingAnchor, bottom: nil, trailing: nil, topPad: 5, leadPad: 0, botPad: 0, trailPad: 0, width: 400, height: 400)
        //make this look a little shorter to simulate 3d depth around center image
        
    }
    
    var SFCImageView:UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.imageFromUrl(urlString: "https://www.aviationweather.gov/data/products/progs/F000_wpc_sfc.gif", me: iv)
        return iv
    }()
    
    var SFC2ndImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.imageFromUrl(urlString: "https://www.aviationweather.gov/data/products/progs/F006_wpc_sfc.gif", me: iv)
        return iv
    }()
    
    var SFC3rdImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.imageFromUrl(urlString: "https://www.aviationweather.gov/data/products/progs/F006_wpc_sfc.gif", me: iv)
        return iv
    }()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
