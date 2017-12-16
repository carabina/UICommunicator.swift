//
//  SecondViewController.swift
//  Exmaple
//
//  Created by 张伟 on 16/12/2017.
//  Copyright © 2017 zevwings. All rights reserved.
//

import UIKit
import UIComminicator

class SecondViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = valueLabel.text
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func presentThirdViewController(_ sender: Any) {
    }
    
    @IBAction func backFirstViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SecondViewController: UICommunicationReceiver {
    
    func communicatorSender(transmit paramertes: [String : Any]?) {
        print(OperationQueue.current)
        
        _ = valueLabel.text
        
        let val = paramertes?["ParamKey"] as? String
//        DispatchQueue.main.async {
            print(valueLabel.tag)
//                .text = val
//        }
    }
    
}
