//
//  ViewController.swift
//  PersonalProject
//
//  Created by 42media on 06/11/2018.
//  Copyright © 2018 42media. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("baidu.com")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

