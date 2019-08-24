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
        navigationItem.title = "Prog Charts"
       self.edgesForExtendedLayout = []
        
        
        
        self.view.addSubview(SFCImageView)
        
        let mv = self.view!
  
        SFCImageView.doConstraints(top: mv.topAnchor, leading: mv.leadingAnchor, bottom: nil, trailing: nil, topPad: 20, leadPad: 0, botPad: 0, trailPad: 0, width: 400, height: 300)

        self.view.addSubview(SFC2ndImageView)
        SFC2ndImageView.doConstraints(top: SFCImageView.bottomAnchor, leading: mv.leadingAnchor, bottom: nil, trailing: nil, topPad: 20, leadPad: 0, botPad: 0, trailPad: 0, width: 400, height: 300)
    }
    
//not needed below after change to official NSCache()
//    override func didReceiveMemoryWarning() {
//        print("memory warning")
//        [String: UIImage]() //refresh/dump cache
//    }
    
    func setupViews(){
        let myScrollView = UIScrollView()

        
        self.view.addSubview(myScrollView)
          myScrollView.stickToContainer(container: self.view)
        myScrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        let greenView = UIStackView()
        greenView.axis = .horizontal
        greenView.alignment = .top
        greenView.spacing = 0
        greenView.distribution = .fill
        
        greenView.backgroundColor = UIColor.green
        
        myScrollView.addSubview(greenView)
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor).isActive = true
        greenView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: myScrollView.topAnchor).isActive = true
        greenView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: myScrollView.heightAnchor).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 2500).isActive = true
        
        
        
        for i in 0...8 {
        let label = UILabel()
        label.backgroundColor = .orange
        label.text = "I'm label \(i)."
        label.textAlignment = .center
        greenView.addArrangedSubview(label)
        }
        //return

        
        
        
        
        
        
        
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .fill
//        stackView.spacing = 0
//        stackView.distribution = .fill
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        myScrollView.addSubview(stackView)
//
        
//        myScrollView.stickToContainer(container: self.view)
//        stackView.stickToContainer(container: myScrollView)
//
//        myScrollView.isScrollEnabled = true
//        myScrollView.showsHorizontalScrollIndicator = true
//        myScrollView.clipsToBounds = false

//        stackView.axis = .horizontal
        greenView.addArrangedSubview(SFCImageView)
        greenView.addArrangedSubview(SFC2ndImageView)
        //greenView.addArrangedSubview(SFC3rdImageView)
        //
 
//        stackView.heightAnchor.constraint(equalTo: myScrollView.heightAnchor).isActive = true
//        stackView.widthAnchor.constraint(equalToConstant: 1500).isActive = true
//
        
        
//        SFCImageView.translatesAutoresizingMaskIntoConstraints = false
//        SFCImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        SFCImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        SFC2ndImageView.translatesAutoresizingMaskIntoConstraints = false
//        SFC2ndImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        SFC2ndImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//        SFC3rdImageView.translatesAutoresizingMaskIntoConstraints = false
//        SFC3rdImageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        SFC3rdImageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//
        
       // SFCImageView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor, constant: 0).isActive = true
       // SFCImageView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor, constant: 0).isActive = true
//       SFCImageView.doConstraints(top: stackView.topAnchor, leading: stackView.leadingAnchor, bottom: nil, trailing: nil, topPad: 0, leadPad: 0, botPad: 0, trailPad: 0, width: 400, height:400)
////
////
//        SFC2ndImageView.doConstraints(top: SFCImageView.topAnchor, leading: SFCImageView.trailingAnchor, bottom:nil, trailing: nil, topPad: 0, leadPad: 0, botPad: 0, trailPad: 0, width: 400, height: 400)
//         SFC3rdImageView.doConstraints(top: SFCImageView.topAnchor, leading: SFC2ndImageView.trailingAnchor, bottom: nil, trailing: nil, topPad: 0, leadPad: 0, botPad: 0, trailPad: 0, width: 400, height: 400)
        //make this look a little shorter to simulate 3d depth around center image
       // myScrollView.contentSize.width = myScrollView.frame.width * 3
        
    }
    
    var SFCImageView:UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
       iv.translatesAutoresizingMaskIntoConstraints = false
    //    iv.heightAnchor.constraint(equalToConstant: 400).isActive = true
   //     iv.widthAnchor.constraint(equalToConstant: 400).isActive = true
        //iv.imageFromUrl(urlString: "https://www.aviationweather.gov/data/products/progs/F000_wpc_sfc.gif", me: iv)
        iv.urlToImg(urlString: "https://www.aviationweather.gov/data/products/progs/F000_wpc_sfc.gif")
        return iv
    }()
    
    var SFC2ndImageView:UIImageView = {
        let av = UIImageView()
        av.contentMode = .scaleAspectFit
       av.translatesAutoresizingMaskIntoConstraints = false
   //     av.heightAnchor.constraint(equalToConstant: 400).isActive = true
    //    av.widthAnchor.constraint(equalToConstant: 400).isActive = true
        av.urlToImg(urlString: "https://www.aviationweather.gov/data/products/progs/F006_wpc_prog.gif")
        return av
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
