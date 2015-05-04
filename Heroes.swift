//
//  Heroes.swift
//  mymarvelapp
//
//  Created by it on 03/05/15.
//  Copyright (c) 2015 it. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Hero {
    var id : Int?
    var name: String?
    var urlImage : String?
    
    required init(i: Int, n: String, u: String){
        self.id = i
        self.name = n
        self.urlImage = u
    }
    
    
}
