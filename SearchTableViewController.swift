//
//  SearchTableViewController.swift
//  mymarvelapp
//
//  Created by it on 30/04/15.
//  Copyright (c) 2015 it. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var hero = [Hero]()
    var heroResults = [Hero]()
    
    /*@IBOutlet var tableView: UITableView!*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createArray()

    }
    
    func createArray(){
        self.hero = [Hero(i:1009610,n:"Spider-Man",u:"http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b.jpg"),Hero(i:1011054,n:"Spider-Man (1602)",u:"http://i.annihil.us/u/prod/marvel/i/mg/e/03/5317713c9e746.jpg"),Hero(i:1014873,n:"Spider-Man (2099)",u:"http://i.annihil.us/u/prod/marvel/i/mg/8/c0/520d1ad3e543f.jpg"),Hero(i:1016452,n:"Spider-Man (Ai Apaec)",u:"http://i.annihil.us/u/prod/marvel/i/mg/c/60/4fce7a4d900f4.jpg"),Hero(i:1014858,n:"Spider-Man (Ben Reilly)",u:"http://i.annihil.us/u/prod/marvel/i/mg/9/c0/5317717bed6fe.jpg"),Hero(i:1012200,n:"Spider-Man (House of M)",u:"http://i.annihil.us/u/prod/marvel/i/mg/3/60/5317718f0a2e7.jpg"),Hero(i:1017332,n:"Spider-Man (LEGO Marvel Super Heroes)",u:"http://i.annihil.us/u/prod/marvel/i/mg/5/03/5239c4d095611.jpg"),Hero(i:1011114,n:"Spider-Man (Marvel Zombies)",u:"http://i.annihil.us/u/prod/marvel/i/mg/3/00/531772716d0ac.jpg"),Hero(i:1017305,n:"Spider-Man (Marvel: Avengers Alliance)",u:"http://i.annihil.us/u/prod/marvel/i/mg/9/03/5239b59f49020.jpg"),Hero(i:1016181,n:"Spider-Man (Miles Morales)",u:"http://i.annihil.us/u/prod/marvel/i/mg/f/50/537bcfa1eed73.jpg"),Hero(i:1009368,n:"Iron Man",u:"http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55.jpg"),Hero(i:1017320,n:"Iron Man (Iron Man 3 - The Official Game)",u:"http://i.annihil.us/u/prod/marvel/i/mg/9/03/5239c1408c936.jpg"),Hero(i:1017294,n:"Iron Man (LEGO Marvel Super Heroes)",u:"http://i.annihil.us/u/prod/marvel/i/mg/6/90/5239c3cc8a259.jpg"),Hero(i:1017310,n:"Iron Man (Marvel Heroes)",u:"http://i.annihil.us/u/prod/marvel/i/mg/9/40/5239be60a67da.jpg"),Hero(i:1017326,n:"Iron Man (Marvel War of Heroes)",u:"http://i.annihil.us/u/prod/marvel/i/mg/f/f0/5239bfbfeea88.jpg"),Hero(i:1010935,n:"Iron Man (Ultimate)",u:"http://i.annihil.us/u/prod/marvel/i/mg/1/90/53176e7785d95.jpg"),Hero(i:1017104,n:"Iron Man/Tony Stark (MAA)",u:"http://i.annihil.us/u/prod/marvel/i/mg/2/d0/5232190d42df2.jpg"),Hero(i:1009165,n:"Avengers",u:"http://i.annihil.us/u/prod/marvel/i/mg/9/20/5102c774ebae7.jpg"),Hero(i:1009726,n:"X-Men",u:"http://i.annihil.us/u/prod/marvel/i/mg/8/03/510c08f345938.jpg"),Hero(i:1011109,n:"X-Men (Ultimate)",u:"http://i.annihil.us/u/prod/marvel/i/mg/8/a0/4feb34f2017a0.jpg"),Hero(i:1009718,n:"Wolverine",u:"http://i.annihil.us/u/prod/marvel/i/mg/2/60/537bcaef0f6cf.jpg"),Hero(i:1017297,n:"Wolverine (LEGO Marvel Super Heroes)",u:"http://i.annihil.us/u/prod/marvel/i/mg/6/00/5239c3b29cb40.jpg"),Hero(i:1017325,n:"Wolverine (Marvel War of Heroes)",u:"http://i.annihil.us/u/prod/marvel/i/mg/1/60/5239bf9387906.jpg"),Hero(i:1011006,n:"Wolverine (Ultimate)",u:"http://i.annihil.us/u/prod/marvel/i/mg/9/03/531773b76840c.jpg"),Hero(i:1017479,n:"Wolverine (X-Men: Battle of the Atom)",u:"http://i.annihil.us/u/prod/marvel/i/mg/6/90/52d72b4c8376c.jpg"),Hero(i:1010914,n:"Captain America (House of M)",u:"http://i.annihil.us/u/prod/marvel/i/mg/6/10/53176a1e7c0d5.jpg"),Hero(i:1017295,n:"Captain America (LEGO Marvel Super Heroes)",u:"http://i.annihil.us/u/prod/marvel/i/mg/d/b0/5239c38051946.jpg"),Hero(i:1017327,n:"Captain America (Marvel War of Heroes)",u:"http://i.annihil.us/u/prod/marvel/i/mg/2/03/5239c005a4827.jpg"),Hero(i:1017575,n:"Captain America (Sam Wilson)",u:"http://i.annihil.us/u/prod/marvel/i/mg/c/80/545a84a75ddaf.jpg"),Hero(i:1010913,n:"Captain America (Ultimate)",u:"http://i.annihil.us/u/prod/marvel/i/mg/5/80/53176a0bb810c.jpg"),Hero(i:1017105,n:"Captain America/Steve Rogers (MAA)",u:"http://i.annihil.us/u/prod/marvel/i/mg/3/10/52321928eaa72.jpg"),Hero(i:1009223,n:"Captain Britain",u:"http://i.annihil.us/u/prod/marvel/i/mg/9/50/4dbf0e5d57226.jpg"),Hero(i:1010915,n:"Captain Britain (Ultimate)",u:"http://i.annihil.us/u/prod/marvel/i/mg/6/a0/4c003574e99fb.jpg"),Hero(i:1011190,n:"Captain Cross",u:"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg")]
    }
    
    func filterContentForSearchText(searchText: String){
        self.heroResults = self.hero.filter({(heroes: Hero)->Bool in
            let stringMatch = heroes.name?.rangeOfString(searchText)
            return (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.heroResults.count
        }else{
            return self.hero.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        var value : Hero
        if tableView == self.searchDisplayController!.searchResultsTableView {
             value = self.heroResults[indexPath.row]
        }else{
             value = self.hero[indexPath.row]
        }
        // Configure the cell...
        cell.textLabel!.text = value.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if let heroDetailsViewController = segue.destinationViewController as? DetailViewController
        {
            if self.searchDisplayController!.active {
                let indexPath = self.searchDisplayController?.searchResultsTableView.indexPathForSelectedRow()
                if indexPath != nil {
                    heroDetailsViewController.heroIdLabel = String(stringInterpolationSegment: self.heroResults[indexPath!.row].id)
                    heroDetailsViewController.heroNameLabel = self.heroResults[indexPath!.row].name!
                    let url = NSURL(string: self.heroResults[indexPath!.row].urlImage!)
                    let data = NSData(contentsOfURL: url!)
                    
                    if (data != nil ) {
                        heroDetailsViewController.heroImageView = UIImage(data: data!)
                    }
                    } else {
                        let indexPath = self.tableView?.indexPathForSelectedRow()
                        if indexPath != nil {
                            heroDetailsViewController.heroIdLabel = String(stringInterpolationSegment: self.hero[indexPath!.row].id)
                            heroDetailsViewController.heroNameLabel == self.hero[indexPath!.row].name!
                            let url = NSURL(string: self.hero[indexPath!.row].urlImage!)
                            let data = NSData(contentsOfURL: url!)
                            
                            if (data != nil ) {
                                heroDetailsViewController.heroImageView = UIImage(data: data!)
                            }

                        }
                    }
                    
                    
                }
            }
        }
}
