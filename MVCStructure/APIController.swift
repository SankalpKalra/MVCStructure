//
//  APIController.swift
//  MVCStructure
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation


class APIController{
    
    
    func signUpGet(param:[String:Any],user:@escaping (DataModel)->(),fail:@escaping (String)->()){
        let headers = [
            "Authorization": "Basic ZXBpY2dlbTpBMG9pOFVubWhZSEhqdTk2OE1MaQ==",
            "Cache-Control": "no-cache",
            "Postman-Token": "d9dee99d-17df-4f8e-8ca2-a0162187d363"
        ]
        let baseURL = "https://httpbin.org/get"
        NetworkController().GetURLData(url: baseURL, parameters: param, headers: headers, success: { (json) in
            user(DataModel(json: json))
        }) { (failure) in
            fail(failure)
        }
    }
    
    func signUpPost(param:[String:Any],user:@escaping (PostDataModel)->(),fail:@escaping (String)->()){
        let headers = [
            "Cache-Control": "no-cache",
            "Postman-Token": "9d17335a-8690-4ed2-b49a-34694dd850bf"
        ]
        let baseURL = "https://httpbin.org/post"
        NetworkController().PostURLData(url: baseURL, parameters: param, headers: headers, success: { (json) in
            user(PostDataModel(json: json))
        }) { (failure) in
            fail(failure)
        }
    }
    
    func signUpDelete(param:[String:Any],user:@escaping (PostDataModel)->(),fail:@escaping (String)->()){
        let headers = [
            "Cache-Control": "no-cache",
            "Postman-Token": "9d17335a-8690-4ed2-b49a-34694dd850bf"
        ]
        let baseURL = "https://httpbin.org/delete"
        NetworkController().DeleteURLData(url: baseURL, parameters: param, headers: headers, success: { (json) in
            user(PostDataModel(json: json))
        }) { (failure) in
            fail(failure)
        }
        }
    }
 
