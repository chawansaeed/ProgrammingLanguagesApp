//
//  IntroductionFile.swift
//  ProgrammingLanguages 

//
//  Created by Chawan Saeed on 1/27/22.
//  Copyright © 2022 Chawan Saeed. All rights reserved.
//

import UIKit

class IntroductionView: UITableViewController {
    
    var informations: Information!
    let infoReference = InfoViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("indexCell", forIndexPath: indexPath) as! DetailsTableViewCell
       
        // Adding 4 cells for each category that we have
        switch indexPath.row {
        case 0:
            cell.details.text = informations.introLabel
            
        case 1:
            cell.details.text = informations.historyLabel
            
        case 2:
            cell.details.text = informations.usageLabel
            
        case 3:
            cell.details.text = informations.factsLabel
            
        default: break
        }
        return cell
    }
}