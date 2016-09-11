//
//  FirstViewController.swift
//  SwiftTest
//
//  Created by Sunny on 16/8/28.
//  Copyright © 2016年 Sunny. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbl.text = "test test";
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

