//
//  DataModel.swift
//  MVCStructure
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

struct DataModel{
    //let args: [String:Any]
    let args : Args
    let headers: [String:Any]
    let origin:String
    let url:String
    init(json:[String:Any]){
        let arg = json["args"] as? [String:Any] ?? [:]
        args = Args(json: arg)
        //args = json["args"] as? [String:Any] ?? [:]
        headers = json["headers"] as? [String:Any] ?? [:]
        origin = json["origin"] as? String ?? ""
        url = json["url"] as? String ?? ""
    }
}

struct Args{
    let Username:String
    let Password:String
    
    init(json:[String:Any]) {
        Username = json["Username"] as? String ?? ""
        Password = json["Password"] as? String ?? ""
    }
}
