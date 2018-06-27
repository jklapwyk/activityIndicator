//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Jamie Klapwyk on 2018-06-27.
//  Copyright © 2018 Jklapwyk. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class TableViewCell: UITableViewCell {
    @IBOutlet var imageView:UIImageView!
}

