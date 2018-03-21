//
//  PostDataModel.swift
//  MVCStructure
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

struct PostDataModel{
    let form : Form
    let origin:String
    let url :String
    init(json:[String:Any]){
        let form = json["form"] as? [String:Any] ?? [:]
        self.form = Form(json: form)
        origin = json["origin"] as? String ?? ""
        url = json["url"] as? String ?? ""
    }
    
}

struct Form{
    let Username :String
    let Password :String
    init(json:[String:Any]) {
        Username = json["Username"] as? String ?? ""
        Password = json["Password"] as? String ?? ""
    }
}
