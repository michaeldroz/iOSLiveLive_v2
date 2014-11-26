//
//  ViewController.swift
//  LivLiveiOSv2
//
//  Created by Michael Droz on 11/20/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class EventsViewController: UITableViewController {

    var session: NSURLSession!
    var events = [[NSObject:AnyObject]]()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("DOn't use this")
    
    }
    
    @IBAction func addNewItem(sender: AnyObject) {
        // create a new Item and add it to the store
           }

    
    
    override init(style: UITableViewStyle) {
        println("I am inside override init")
//        TODO: Add Style .Plain 
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: config, delegate: nil, delegateQueue: nil)
        
        
        super.init(nibName: nil, bundle: nil)
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .Add,
            target: self,
            action: "addNewItem:")
        
        
        // set this bar button item as the right item in the navItem
        navigationItem.rightBarButtonItem = addItem
        
        navigationItem.title = "LivLive Events"
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
    }
    
    override func viewDidLoad() {
       // tableView.delegate = self
       // tableView.dataSource = self
        println("I am inside viewDidLoad")

        //Load the NIB file
        let nib = UINib(nibName: "EventCell", bundle: nil)
        
        //REgister the NIB, which contains the cell
        tableView.registerNib(nib, forCellReuseIdentifier: "EventCell")
        println("I am about to call fectchFeed")
        fetchFeed()
       // super.viewDidLoad()
        
        //Uncomment this section to control the rowHeight, this is key to implement my design. 
        //tableView.rowHeight = 80


    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(events.count)
        return events.count
    }
        
        
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println("About to get a new or receyvled cell")
        //Get a new or recycled cell 
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as EventCell
        println("about to go into let event = events...after deque")
         let event = events[indexPath.row]
        println("Trying to print cell.eventTitle")
        //Configure the cell with the item
        if let title: AnyObject = event["title"] {
            if let titleString = title as? String {
                cell.eventTitle.text = titleString
            }
        }
        if let description: AnyObject = event["description"] {
            if let descriptionString = description as? String {
                cell.eventDescription.text = descriptionString
            }
        }
        if let date: AnyObject = event["date"] {
            if let dateDescription = date as? String {
                cell.eventDate.text = dateDescription
            }
        }
        
       //cell.eventTitle.text = "cellText"
        
        return cell
        
    }
    
    
    //Create and show EventDeailViewController
   override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    
        let vc = EventDetailViewController(nibName: "EventDetailViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)

    }

    
    func fetchFeed() {
        
        println("Quarantine Begins Here")
        let requestString = "http://private-8618e-michaeldroz.apiary-mock.com/events"
        if let url = NSURL(string: requestString) {
            let req = NSURLRequest(URL: url)
            
            let dataTask = session.dataTaskWithRequest(req) {
                (data, response, error) in
                if data != nil {
                    var error: NSError?
                    if let jsonObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as? [NSObject:AnyObject] {
                        // println("\(jsonObject)")
                        if let eventArray: AnyObject = jsonObject["events"]{
                            if let cs = eventArray as? [[NSObject:AnyObject]] {
                                self.events = cs
                                println("\(self.events)")
                                println("printing here below self.events")
                                NSOperationQueue.mainQueue().addOperationWithBlock() {
                                    println("about to execute reloadSections")
                                    println("about to preint event.soucn \(self.events.count)")
                                    self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
                                    println("Inside of the closure for reloadSelctions")
                                }
                            }
                        }
                    }
                    else {
                        if let error = error {
                            println("Error parsing JSON: \(error)")
                        }
                    }
                    /*if let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding) {
                    println("\(jsonString)")
                    }*/
                }
                else {
                    println("Error fetching courses: \(error.localizedDescription)")
                }
            }
            println("abbout to do dataTask.resume")
            dataTask.resume()
            
        }
    }
    
    
   



}

