//
//  KJNetworkHelper.swift
//  PersonalProject
//
//  Created by 42media on 06/11/2018.
//  Copyright © 2018 42media. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

//success
typealias NetworkSuccessBlock = (NSDictionary, SwiftyJSON.JSON) -> Void

//fail
typealias NetworkFailedBlock = (AFError) -> Void

class KJNetworkHelper: NSObject {
    private var sessionManager: Alamofire.SessionManager?
    private var baseUrl = ""
    static let shareInstance = KJNetworkHelper()
    
    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20.0
        sessionManager = Alamofire.SessionManager(configuration: configuration)
    
    }
    
    func GET(_ urlStr:String, _ param:Parameters?,_ isShowHUD:Bool,success:@escaping NetworkSuccessBlock,failed:@escaping NetworkFailedBlock) {
        let url = baseUrl + urlStr
        let encodeStr = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        let headers: HTTPHeaders = ["Content-Type":"appilcation/json;charset=utf-8"]
        self.sessionManager?.request(encodeStr!, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON(completionHandler: {(response) in
            switch response.result.isSuccess {
                case true:
                    if let value = response.result.value {
                        let json = JSON(value)
                        success(value as! NSDictionary,json)
                    }
                case false:
                    print(response.result.error!)
            }
        })
    }
    
    
}




