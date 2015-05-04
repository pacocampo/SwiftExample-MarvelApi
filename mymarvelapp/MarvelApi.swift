//
//  MarvelApi.swift
//  mymarvelapp
//
//  Created by it on 30/04/15.
//  Copyright (c) 2015 it. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MarvelApi {
    var url, ts, hash:String
    var limit, offset: Int
    let apiKey = "e7206e02ed4dc09304a8c2880e0ee6e9"
    
    init(limit:Int, offset:Int, ts:String, hash:String){
        self.url = ""
        self.limit = limit
        self.offset = offset
        self.ts = ts
        self.hash = hash
    }
   
    
    func searchCharacter(name:String){

            var hero = [String]()
            self.url = "http://gateway.marvel.com/v1/public/characters"
            Alamofire.request(.GET, self.url, parameters: [
                "nameStartsWith": name,
                "limit": String(self.limit),
                "offset": String(self.offset),
                "apikey": self.apiKey,
                "ts": self.ts,
                "hash": self.hash
                ]).responseJSON()
                    {
                        (_, _, json, _) in
                        let objJson = JSON(json!)
                        for(key: String, theJson: JSON) in objJson["data"]["results"]
                        {
                            hero.append(theJson["name"].stringValue)
                        }
               
                    }

        }
}