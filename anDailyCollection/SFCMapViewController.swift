//
//  SFCMapViewController.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/24/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

class SFCMapViewController: UIViewController {

    var loadMoreButton = UIButton()
      let sv = UIStackView()
    
    let imgList:[String] = ["https://www.aviationweather.gov/data/products/progs/F018_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F024_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F030_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F036_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F048_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F060_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F072_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F096_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F120_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F144_wpc_prog.gif",
                            "https://www.aviationweather.gov/data/products/progs/F168_wpc_prog.gif",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Prog Charts"
       self.edgesForExtendedLayout = []
        self.view.backgroundColor = .white
        setupViews()
    }
    
    
    func setupViews(){
        let myScrollView = UIScrollView(frame: self.view.bounds)//1*changed to set frame on init
        self.view.addSubview(myScrollView)
        
        //2*commented these two lines out
//        myScrollView.stickToContainer(container: self.view)
//        myScrollView.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        myScrollView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        
        myScrollView.contentSize.width = sv.bounds.width//400
       myScrollView.contentSize.height = 1200// SFCImageView.bounds.height * 3//3200
        myScrollView.showsVerticalScrollIndicator = true
       // myScrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        myScrollView.flashScrollIndicators()
        myScrollView.addSubview(sv)
        sv.stickToContainer(container: myScrollView)
        sv.axis = .vertical
        sv.spacing = 20
        sv.distribution = .fillProportionally
     
        sv.addArrangedSubview(SFCImageView)
        sv.addArrangedSubview(SFC2ndImageView)
        sv.addArrangedSubview(SFC3rdImageView)
        sv.addArrangedSubview(loadMoreButton)

       // SFCImageView.setWH(width: 400, height: 300)
        
        //SFC2ndImageView.setWH(width: 400, height: 300)
        //SFC3rdImageView.setWH(width: 400, height: 300)
        
 
        setupLoadMoreButton()
    }
    
    func setupLoadMoreButton(){
    
    loadMoreButton.setTitle("Load More Results", for: .normal)
    loadMoreButton.layer.cornerRadius = 10
      //  loadMoreButton.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
//    loadMoreButton.translatesAutoresizingMaskIntoConstraints = false
    //loadMoreButton.setWH(width: 400, height: 100)
    loadMoreButton.layer.backgroundColor = UIColor.blue.cgColor
    loadMoreButton.titleLabel?.font = UIFont(name: "GillSans", size: 30)
    loadMoreButton.titleLabel?.textColor = .white
        loadMoreButton.addTarget(self, action: #selector(LoadMore), for: .touchUpInside)
        
    }
    
    @objc func LoadMore(){
    
    //print("Load more")
        sv.removeArrangedSubview(loadMoreButton)
        imgList.forEach {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill//.scaleAspectFit
//            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.urlToImg(urlString: $0)
            sv.addArrangedSubview(iv)
           // iv.setWH(width: 400, height: 300)
        }
        setupEndButton()
    }
    
    func setupEndButton(){
    var endButton = UIButton()
    endButton.setTitle("End of Results", for: .normal)
    endButton.layer.cornerRadius = 10
    //  loadMoreButton.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
//    endButton.translatesAutoresizingMaskIntoConstraints = false
   
    endButton.layer.backgroundColor = UIColor.blue.cgColor
    endButton.titleLabel?.font = UIFont(name: "GillSans", size: 30)
    endButton.titleLabel?.textColor = .white
    
    sv.addArrangedSubview(endButton)
   // endButton.setWH(width: 400, height: 100)
    
    }
//not needed below after change to official NSCache()
//    override func didReceiveMemoryWarning() {
//        print("memory warning")
//        [String: UIImage]() //refresh/dump cache
//    }
    
    
    func setupLabelTesters(){

 
        for i in 0...8 {
        let label = UILabel()
        label.backgroundColor = .orange
        label.text = "I'm label \(i)."
        label.textAlignment = .center
       
        }

     
    }
    
    var SFCImageView:UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        
//       iv.translatesAutoresizingMaskIntoConstraints = false//3* commented out
        
    //    iv.heightAnchor.constraint(equalToConstant: 400).isActive = true
   //     iv.widthAnchor.constraint(equalToConstant: 400).isActive = true
        //iv.imageFromUrl(urlString: "https://www.aviationweather.gov/data/products/progs/F000_wpc_sfc.gif", me: iv)
        iv.urlToImg(urlString: "https://www.aviationweather.gov/data/products/progs/F000_wpc_sfc.gif")
        return iv
    }()
    
    var SFC2ndImageView:UIImageView = {
        let av = UIImageView()
        av.contentMode = .scaleAspectFill
//       av.translatesAutoresizingMaskIntoConstraints = false
   //     av.heightAnchor.constraint(equalToConstant: 400).isActive = true
    //    av.widthAnchor.constraint(equalToConstant: 400).isActive = true
        av.urlToImg(urlString: "https://www.aviationweather.gov/data/products/progs/F006_wpc_prog.gif")
        return av
    }()
    
    var SFC3rdImageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
 //       iv.translatesAutoresizingMaskIntoConstraints = false
        iv.urlToImg(urlString: "https://www.aviationweather.gov/data/products/progs/F012_wpc_prog.gif")
        //iv.imageFromUrl(urlString: "https://www.aviationweather.gov/data/products/progs/F012_wpc_prog.gif", me: iv)
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
