//
//  ComicsCollectionViewController.swift
//  mymarvelapp
//
//  Created by it on 30/04/15.
//  Copyright (c) 2015 it. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let reuseIdentifier = "Cell"

class ComicsCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var ComicsView: UICollectionView!
    
    
    var idHero = ""
    var comicsCover: [NSDictionary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComics(idHero)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func loadComics(id: String){
        Alamofire.request(.GET, "http://gateway.marvel.com/v1/public/characters/\(id)/comics", parameters: [
            "characterId" : id,
            "limit": "15",
            "apikey": "e7206e02ed4dc09304a8c2880e0ee6e9",
            "ts" : "15:18:45",
            "hash" : "772554f41689694e989e39403a53deea"
            ]).responseJSON(){
                (_, _, json, _) in
                let jsonObj = JSON(json!)
                for (key: String, subJson: JSON) in jsonObj["data"]["results"] {
                    
                    var comics = [String:AnyObject]()
                    
                    let url = NSURL(string: subJson["thumbnail"]["path"].stringValue + "." + subJson["thumbnail"]["extension"].stringValue)
                    let data = NSData(contentsOfURL: url!)
                    
                    if (data != nil ) {
                        comics["picture"] = UIImage(data: data!)
                    }
                    /*heroes["id"] = subJson["id"].stringValue
                    heroes["name"] = subJson["name"].stringValue
                    heroes["description"] = subJson["description"].stringValue*/
                    
                    self.comicsCover.append(comics)
                    
                }
                self.ComicsView.reloadData()
                
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return self.comicsCover.count
    }

    /*override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = ComicsView.dequeueReusableCellWithReuseIdentifier("comics") as! ComicsCollectionCellViewController
        
        // Configure the cell
    
        return cell
    }*/
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = ComicsView.dequeueReusableCellWithReuseIdentifier("ComicsCellView", forIndexPath: indexPath) as! ComicsCollectionCellViewController
        
        var covers = self.comicsCover[indexPath.row]
        
        var comicImg = UIImage()
        comicImg = covers["picture"] as! UIImage
        
        cell.comicImage.image = comicImg
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
