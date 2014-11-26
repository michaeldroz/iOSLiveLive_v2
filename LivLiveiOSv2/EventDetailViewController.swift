//
//  EventDetailViewController.swift
//  LivLiveiOSv2
//
//  Created by Michael Droz on 11/21/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
     /* @IBOutlet weak var nameField: UITextField!
        @IBOutlet weak var serialNumberField: UITextField!
        @IBOutlet weak var valueField: UITextField!
        @IBOutlet weak var dateLabel: UILabel!*/
    
    var events = [[NSObject:AnyObject]]()
    
    /*
        Make this view a TableView and then use a different cell (.Nib file)  design for different
        types of content.
    
        >Text type 
        >Image type 
        >Video type (same as Image w/controls to play?)


        Example code to fetch the different types of .nib files
    
        For each nib: 
        >>Init
        >>Load
        >>Register
    
    
    override func viewDidLoad() {
   
    //Load the NIB file
    let nib = UINib(nibName: "EventCell", bundle: nil)
    
    //REgister the NIB, which contains the cell
    tableView.registerNib(nib, forCellReuseIdentifier: "EventCell")
    println("I am about to call fectchFeed")
    fetchFeed()
    
    *****Probably need to use the "Group Type" UITableView since we'll be mixing in different shpaed cells based on contentTYpe.
    ***************************************
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  
    //Get a new or recycled cell
    
        if contentType? == Text {
            let cell = tableView.dequeueReusableCellWithIdentifier("EventTextCell", for ...) as EventTextCell
    } else if contentType? == Image {
            let cell = tableView.dequeueResableCellWithIdentifier("EventImageCell", for...) as EventImageCell
    } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("EventVideoCell", for...) as EventVideoCell
    }
    
    
    
    let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as EventCell
  
    let event = events[indexPath.row]
  
    //Configure the cell with the item
    if let title: AnyObject = event["title"] {
    if let titleString = title as? String {
    cell.eventTitle.text = titleString
    }

    



                                */
   
}
