//
//  MainViewController.swift
//  anDailyCollection
//
//  Created by Larry Mcdowell on 8/19/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, StoreSubscriber {
    func newState(state: State) {
        //do nothing
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        store.subscribe(self)
        navigationItem.title = "Metar Minder Home"
        setupViews()
        self.view.backgroundColor = .green
     
    }
    
    func setupViews(){
        
        self.view.addSubview(goButton)
        self.view.addSubview(mapButton)
        
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        goButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        goButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //implement labels, input fields, etc.
       
        mapButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mapButton.doConstraints(top: goButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, topPad: 10, leadPad: 0, botPad: 0, trailPad: 0, width: 250, height: 200)
       
    }

    @objc func goButtonPressed(sender:UIButton){
   // self.navigationController?.pushViewController(TableViewController(), animated: true)
        store.Dispatch(action: navigationAction(currentScreen: self, nextScreen: TableViewController()))
    }
    
    @objc func mapButtonPressed(sender:UIButton){
        
        store.Dispatch(action: navigationAction(currentScreen: self, nextScreen: SFCMapViewController()))
    }
    var goButton:UIButton = {
       let gb = UIButton()
        //gb.titleLabel?.text = "To Metar"
        gb.tag = 1
        gb.addTarget(self, action: #selector(goButtonPressed), for: .touchUpInside)
        gb.setTitle("To Metar", for: .normal)
        gb.setTitleColor(.black, for: .normal)
        gb.titleEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
        gb.backgroundColor = .white
        gb.layer.borderColor = UIColor.black.cgColor
        gb.layer.borderWidth = 1
        gb.layer.cornerRadius = 10
        return gb
    }()
    var mapButton:UIButton = {
        let gb = UIButton()
        //gb.titleLabel?.text = "To Metar"
        gb.tag = 1
        gb.addTarget(self, action: #selector(mapButtonPressed), for: .touchUpInside)
        gb.setTitle("To SFC Map", for: .normal)
        gb.setTitleColor(.black, for: .normal)
        gb.titleEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30)
        gb.backgroundColor = .white
        gb.layer.borderColor = UIColor.black.cgColor
        gb.layer.borderWidth = 1
        gb.layer.cornerRadius = 10
        return gb
    }()
}
