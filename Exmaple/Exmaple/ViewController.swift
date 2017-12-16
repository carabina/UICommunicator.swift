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
        DispatchQueue.main.async {
            let parameters = ["ParamKey": "ParamValue"]
            let second = SecondRepeater.default(paramerts: parameters)
            self.call(.present, for: second)

        }
//        let vc = call(second)
//
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
//        vc?.communicatorSender(transmit: parameters)
//
//        self.present(vc!, animated: true, completion: nil)
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
