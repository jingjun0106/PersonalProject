//
//  ViewController.swift
//  PersonalProject
//
//  Created by 42media on 06/11/2018.
//  Copyright © 2018 42media. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonStr = "[{\"name\": \"hangge\", \"age\": 100, \"phones\": [{\"name\": \"公司\",\"number\": \"123456\"}, {\"name\": \"家庭\",\"number\": \"001\"}]}, {\"name\": \"big boss\",\"age\": 1,\"phones\": [{ \"name\": \"公司\",\"number\": \"111111\"}]}]"
        
        if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            if let userArray = try? JSONSerialization.jsonObject(with: jsonData,
                                                                 options: .allowFragments) as? [[String: AnyObject]],
                let phones = userArray?[0]["phones"] as? [[String: AnyObject]],
                let number = phones[0]["number"] as? String {
                // 找到电话号码
                
                print("userArray--\(userArray!)")
                print("第一个联系人的第一个电话号码：",number)
            }
            let json = try! JSON(data: jsonData)
            if let number = json[0]["phones"][0]["a"].string {
                // 找到电话号码
                print("第一个联系人的第一个电话号码：",number)
            }else {
                // 打印错误信息
                print(json[0]["phones"][0]["a"])
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        let json = JSON.init(parseJSON: jsonStr)
        print("json--\(json)")
        
        KJNetworkHelper.shareInstance.GET("http://www.hangge.com/getJsonData.php", nil, false, success: { (dic, json) in
            print("dic-\(dic)")
            print("json-\(json)")
        },failed: { (error) in
            print(error)
        })
        
    }


}

