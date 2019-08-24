//
//  ViewExtensions.swift
//  anDailyCollection
//
//  Created by Larry Mcdowell on 8/18/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit
import SwiftyXMLParser
import Alamofire

protocol  XMLCarrier {
    
    var xmlResponse:XML.Accessor?{get set}
    
    func reloadDataExt()
}

//extension UIImageView {
//    public func imageFromUrl(urlString: String) {
//        if let url = NSURL(string: urlString) {
//            let request = NSURLRequest(url: url as URL)
//         //   NSURLSession dataTaskWithRequest:completionHandler:]
//
//
//            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {
//                (response: URLResponse!, data: Data!, error: Error!) -> Void in
//                self.image = UIImage(data: data as Data)
//            }
//        }
//    }
//}

extension  UIImageView {
    public func imageFromUrl(urlString:String,me:UIImageView){
        
        Alamofire.request(urlString).responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    me.image = UIImage(data: data, scale:1)
                }//end assignment of image
            }//end response error
        }//end Alamofire
    }//end func
}//end extension

extension UIView {
    public func stickToContainer(container:UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
}

//var imageCache = [String: UIImage]()
var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    public func urlToImg(urlString:String){
       // print("entered")
        
      //  if let image = imageCache[urlString]{
        if let image = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = image
            //print("from cache")
        } else {
        
      let websession = URLSession.shared.dataTask(with: URL(string: urlString)!, completionHandler: { (data,response,error) ->
            Void in
           // print(response.debugDescription)
            if error != nil {
                //print(error.debugDescription)
                return
            }
        
        if let rx = response as? HTTPURLResponse {
            //print(rx.statusCode)
        }
            if let img = data {
                //print("from web")
                
                DispatchQueue.main.async {
                    let image = UIImage(data: img, scale: 1)
                    self.image = image
                    
                    //imageCache[urlString] = image // cache in dictionary under url string
                    imageCache.setObject(image!, forKey: urlString as AnyObject)
                }
            
            }
        })
        websession.resume()
        //could asign session to variable, then call its resume() method
        }
    }
}
