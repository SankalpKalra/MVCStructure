//
//  ViewController.swift
//  MVCStructure
//
//  Created by Appinventiv on 20/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.GetData()
        self.PostData()
        //self.DeleteData()
    }
    
    let parameters = [
        "Username":"Sankalp",
        "Password":"********"
    ]
    
    func GetData(){
        APIController().signUpGet(param: parameters, user: { (user) in
            print("USERNAME:",user.args.Username)
            print("----------------------------------------")
            print("PASSWORD:",user.args.Password)
            print("----------------------------------------")
            print()
            let header = user.headers
            for(key,value) in header{
                print("\(key):\(value)")
                print("----------------------------------------")
            }
            print()
            print("ORIGIN:",user.origin)
            print()
            print("URL:",user.url)
        }) { (fail) in
            print(fail)
        }
      }
    func PostData(){
        APIController().signUpPost(param: parameters, user: { (user) in
            print("USERNAME:",user.form.Username)
            print("----------------------------------------")
            print("PASSWORD:",user.form.Password)
            print("----------------------------------------")
            print()
            print("ORIGIN:",user.origin)
            print()
            print("URL:",user.url)
        }) { (failure) in
            print(failure)
        }
    }
    func DeleteData(){
        APIController().signUpDelete(param: parameters, user: { (user) in
            print("USERNAME:",user.form.Username)
            print("----------------------------------------")
            print("PASSWORD:",user.form.Password)
            print("----------------------------------------")
            print()
            print("ORIGIN:",user.origin)
            print()
            print("URL:",user.url)
        }) { (failure) in
            print(failure)
        }
    }
}

