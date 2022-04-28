//
//  LanguagesCollectionViewController.swift
//  ProgrammingLanguages
//
//  Created by Chawan Saeed on 12/24/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class LanguagesCollectionViewController: UICollectionViewController {

    var informations = [Information]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readJsonFile("JSONFile")
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return informations.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let reuseIdentifier = "mainCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! LanguagesCollectionViewCell
        cell.languageIcon.image = UIImage(named: informations[indexPath.row].languageIcon)
        cell.languageName.text = informations[indexPath.row].languageName
        return cell
    }
    
    func readJsonFile(path: String) {
        if let filePath = NSBundle.mainBundle().pathForResource(path, ofType: "json") {
            let data = NSData(contentsOfFile: filePath)
            parseJsonFile(data!)
        }
    }
    
    func parseJsonFile(data: NSData) -> [Information] {
        do {
            let decodedData = try NSJSONSerialization.JSONObjectWithData(data, options: [ ]) as? NSDictionary
            
            // Parse json data:
            let jsonDatas = decodedData?["languages"] as! [AnyObject]
            
            for jsonData in jsonDatas {
                let information = Information()
                information.languageName = jsonData["name"] as! String
                information.languageIcon = jsonData["icons"] as! String
                information.languageIntroduction = jsonData["introduction"] as! String
                information.introLabel = jsonData["introLabel"] as! String
                information.historyLabel = jsonData["historyLabel"] as! String
                information.usageLabel = jsonData["usageLabel"] as! String
                information.factsLabel = jsonData["factsLabel"] as! String
                informations.append(information)
            }
        } catch { "Could not parse data, the problem is: \(error)" }
        return informations
    }
    
    // Preparing a segue so we can transform the data to other files
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "furtherInfo" {
            if let indexPath = collectionView?.indexPathsForSelectedItems() {

            let destinationVC = segue.destinationViewController as! IntroductionView
                destinationVC.informations = informations[indexPath[0].row]
            }
        }
    }
}