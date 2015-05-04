//
//  DetailViewController.swift
//  mymarvelapp
//
//  Created by it on 24/04/15.
//  Copyright (c) 2015 it. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var heroId: UILabel!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroDescription: UITextView!

    var heroIdLabel = ""
    var heroNameLabel = ""
    var heroImageView = UIImage(named: "placeholder")   
    var heroImageUrl = ""
    var heroDescriptionText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //heroName.text = heroNameLabel
        
        //image url
        /*var imageUrl : NSURL = NSURL(string: heroImageUrl)!
        let request: NSURLRequest = NSURLRequest(URL: imageUrl)
        let dataImage = NSData(contentsOfURL: imageUrl)
        heroImage.image = UIImage(data: dataImage!)
        
        heroDescription.text = heroDescriptionText
        //heroImage.image = UIImage(named: heroImageView)
        // Do any additional setup after loading the view.
        */
        heroId.text = heroIdLabel
        heroName.text = heroNameLabel
        heroImage.image = heroImageView
        heroDescription.text = heroDescriptionText

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var nextScene = segue.destinationViewController as! ComicsCollectionViewController
        
        nextScene.idHero = heroId.text!
    
    }
    

}
