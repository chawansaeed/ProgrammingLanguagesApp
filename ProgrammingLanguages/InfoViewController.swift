//
//  InfoViewController.swift
//  ProgrammingLanguages
//
//  Created by Chawan Saeed on 3/19/22.
//  Copyright © 2022 Chawan Saeed. All rights reserved.
//

import UIKit

public class InfoViewController: UIViewController {

    public var headerLabelText = ""
    public var infoLabelText = ""
    
    @IBOutlet public var headerLabel: UILabel!
    @IBOutlet public var infoLabel: UILabel!
    @IBOutlet public var backgroundImage: UIImageView!

    override public func viewDidLoad() {
        super.viewDidLoad() 
        
        backgroundImage.image = UIImage(named: "background")
        headerLabel.text = headerLabelText
        infoLabel.text = infoLabelText
    
    }
    
    // Adding a button to cancel the view and go back to main view
    @IBAction func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}