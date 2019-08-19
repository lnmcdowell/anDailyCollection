
//
//  CollectionViewController.swift
//  anDailyCollection
//
//  Created by Nathaniel Mcdowell on 8/15/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit
import MBProgressHUD
import SwiftyXMLParser

private let CELL_ID = "CELL_ID"

public var mySemaphore:Bool = false

struct DataNode {
    var name:String?
    var age:Int?
    var title:String?
}



class CollectionViewController: UICollectionViewController, XMLCarrier {
    func reloadDataExt() {
        self.collectionView.reloadData()
    }
    
    
    /////////////
   
        var xmlResponse: XML.Accessor?{
            get{
                
                return response!
                
                
            } set(newValue){
                response = newValue
            }
        }
        /////////////////

    
    var data:[DataNode] = [DataNode]()
    var metar:Metar?
   
    var response:XML.Accessor?
    
    override init(collectionViewLayout layout: UICollectionViewLayout){
        super.init(collectionViewLayout: layout)
        //fixes app crashing error for not having a layout parameter
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        navigationItem.title = "CView from Scratch"
        let fl = UICollectionViewFlowLayout()
        fl.itemSize = CGSize(width: 190, height: 150)
        showLoadingHUD()
        //////////////////////////////////////////
        let fAAGetter:FAAGetter = FAAGetter()
        fAAGetter.getMetar(sender: self)
     
        //////////////////////////////////////////
        //fl.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: fl)
        self.collectionView = cv
        self.view.backgroundColor = .green
        self.collectionView.isUserInteractionEnabled = true
        // Register cell classes
        self.collectionView!.register(myCell.self, forCellWithReuseIdentifier: CELL_ID)
       
        data.append(DataNode(name: "Star", age: 23, title: "Extra"))
        data.append(DataNode(name: "Sam", age: 22, title: "Biggie"))
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if self.xmlResponse != nil {
          hideLoadingHUD()
        }
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if let count = response {
            let ret = Int(count.data.attributes["num_results"]!)!
            
            navigationItem.title = " \(ret) Results Returned"
            return ret
        } else {
            return 0
        }
//        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! myCell
        print("getting cell")
        //cell.data = data[indexPath.item]
      
        
        if let myRx = response {
           cell.metar_accessor = myRx.data.METAR[indexPath.item]
        }
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = data.remove(at: sourceIndexPath.item)
        data.insert(temp, at: destinationIndexPath.item)
        
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    private func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.collectionView, animated: true)
        hud.label.text = "Loading..."
    }
    
    private func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.collectionView, animated: true)
    }

}
