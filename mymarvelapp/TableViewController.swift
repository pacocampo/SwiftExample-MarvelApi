
//
//  TableViewController.swift
//  mymarvelapp
//
//  Created by it on 24/04/15.
//  Copyright (c) 2015 it. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var results: [JSON] = []
    var allHeroes = [NSDictionary] ()

    var limit = 3
    var offsetLoad = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(4, offset: self.offsetLoad)
        offsetLoad += 4
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(limit:Int, offset:Int){
        Alamofire.request(.GET, "http://gateway.marvel.com/v1/public/characters", parameters: [
            "limit" : String(limit),
            "offset" : String(offset),
            "apikey": "e7206e02ed4dc09304a8c2880e0ee6e9",
            "ts" : "15:18:45",
            "hash" : "772554f41689694e989e39403a53deea"
            ]).responseJSON(){
                (_, _, json, _) in
                let jsonObj = JSON(json!)
  
                for (key: String, subJson: JSON) in jsonObj["data"]["results"] {
                    
                    var heroes = [String:AnyObject]()
                    
                    let url = NSURL(string: subJson["thumbnail"]["path"].stringValue + "." + subJson["thumbnail"]["extension"].stringValue)
                    let data = NSData(contentsOfURL: url!)
                    
                    if (data != nil ) {
                        heroes["picture"] = UIImage(data: data!)
                    }
                    heroes["id"] = subJson["id"].stringValue
                    heroes["name"] = subJson["name"].stringValue
                    heroes["description"] = subJson["description"].stringValue
                    
                    self.allHeroes.append(heroes)
                    self.tableView.reloadData()
                }
                
            }
        }

    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //println(self.results.count)
        return self.allHeroes.count
        //return heroes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("celda") as! TableViewCell
        var hero = self.allHeroes[indexPath.row]
        cell.heroName.text = (hero["name"] as! String)
        var heroImage = UIImage()
        if (hero["picture"] != nil) {
            heroImage = hero["picture"] as! UIImage
        }
        
        cell.heroImage.image = heroImage
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (indexPath.row == limit) {
            loadData(4, offset: self.offsetLoad)
            self.limit += 4
            self.offsetLoad += 4
        }
        
            //self.tableView.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextScene = segue.destinationViewController as! DetailViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow(){
            let result = allHeroes[indexPath.row]
            
            nextScene.heroNameLabel = result["name"] as! String
            nextScene.heroIdLabel = result["id"] as! String
            var image = result["picture"] as! UIImage
            nextScene.heroImageView = image
            nextScene.heroDescriptionText = result["description"] as! String!

        }
    }

}
