//
//  ViewController.swift
//  Exmaple
//
//  Created by 张伟 on 16/12/2017.
//  Copyright © 2017 zevwings. All rights reserved.
//

import UIKit
import UIComminicator

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentSecondViewController(_ sender: Any) {
        
    }
    
    @IBAction func presentThirdViewController(_ sender: Any) {
        
    }
    
    @IBAction func presentForthViewController(_ sender: Any) {
        
    }
}


extension ViewController: UICommunicationSender {
    
    func communicatorReceiver(_ receiver: UICommunicationReceiver?, callback paramertes: [String: Any]?) {
        
        
    }
}
