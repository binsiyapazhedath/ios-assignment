//
//  ViewController.swift
//  ios-assignment
//
//  Created by Binsu on 27/04/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeAPI().getHome { (response) in
            print(response)
        } failed: { (error) in
            
        }
    }
}

