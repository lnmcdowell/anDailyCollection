//
//  MainViewController.swift
//  anDailyCollection
//
//  Created by Larry Mcdowell on 8/19/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Metar Minder Home"
        setupViews()
        self.view.backgroundColor = .green
     
    }
    
    func setupViews(){
        
        self.view.addSubview(goButton)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        goButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        goButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //implement labels, input fields, etc.
    }

    @objc func goButtonPressed(sender:UIButton){
    self.navigationController?.pushViewController(TableViewController(), animated: true)
    
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
    
}
