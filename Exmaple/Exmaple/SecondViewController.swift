//
//  SecondViewController.swift
//  Exmaple
//
//  Created by 张伟 on 16/12/2017.
//  Copyright © 2017 zevwings. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentThirdViewController(_ sender: Any) {
    }
    
    @IBAction func backFirstViewController(_ sender: Any) {
    }
    
}
