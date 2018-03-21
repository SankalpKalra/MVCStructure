 //
//  NetworkController.swift
//  MVCStructure
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation
class NetworkController{
   
    fileprivate func RequestFailSucc(_ request: NSMutableURLRequest, _ failure: @escaping (String) -> Void, _ success: @escaping ([String : Any]) -> Void) {
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            
                if let err = error {
                    failure(err as! String)
//                }
//                    if let _ = response {
//                        //print(httpResponse)
//                    }
                }else{
              guard let rawdata=data else { return }
            do{
                let jsonData = try JSONSerialization.jsonObject(with: rawdata, options: .mutableContainers)
                success(jsonData as! [String : Any])
            }catch {
                print("Serialization Catch Error")
            }
        }
        })
        
        dataTask.resume()
    }
    
    func PostURLData(url:String,parameters:[String:Any],headers:[String:String], success:@escaping ([String:Any])->Void,failure:@escaping (String)->Void){
     
        let request = NSMutableURLRequest(url: NSURL(string:url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        var bodyString = ""
        let param = parameters
        for (key,value) in param{
            bodyString = bodyString + key + "=" + (value as? String)!
            bodyString.append("&")
        }
        bodyString.removeLast()
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        request.httpBody = bodyString.data(using: String.Encoding.utf8)
       RequestFailSucc(request, failure, success)
        
    }
    
    
    func GetURLData(url:String,parameters:[String:Any],headers:[String:String], success:@escaping ([String:Any])->Void,failure:@escaping (String)->Void){
        // for refrence of attaching parameters https://httpbin.org/get?p1=v1&p2=v2
        var finalUrl = url
        finalUrl.append("?")
        for (key,value) in parameters{
            finalUrl = finalUrl + key + "=" + (value as? String)!
            finalUrl.append("&")
        }
        finalUrl.removeLast()
        let request = NSMutableURLRequest(url: NSURL(string: finalUrl)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        RequestFailSucc(request, failure, success)
        
    }
    
    
    
    func DeleteURLData(url:String,parameters:[String:Any],headers:[String:String], success:@escaping ([String:Any])->Void,failure:@escaping (String)->Void){
        
        let request = NSMutableURLRequest(url: NSURL(string:url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        var bodyString = ""
        let param = parameters
        for (key,value) in param{
            bodyString = bodyString + key + "=" + (value as? String)!
            bodyString.append("&")
        }
        bodyString.removeLast()
    
        request.allHTTPHeaderFields = headers
        request.httpMethod = "DELETE"
        request.httpBody = bodyString.data(using: String.Encoding.utf8)
        RequestFailSucc(request, failure, success)
        
    }
    
    
//
//    func UpdateURLData(url:String,parameters:[String:Any],headers:[String:String], success:@escaping ([String:Any])->Void,failure:@escaping (String)->Void){
//
//        let request = NSMutableURLRequest(url: NSURL(string:url)! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        var bodyString = ""
//        let param = parameters
//        for (key,value) in param{
//            bodyString = bodyString + key + "=" + (value as? String)!
//            bodyString.append("&")
//        }
//        bodyString.removeLast()
//        request.allHTTPHeaderFields = headers
//        request.httpMethod = "POST"
//        request.httpBody = bodyString.data(using: String.Encoding.utf8)
//        RequestFailSucc(request, failure, success)
//
//    }
//
    
    
}
