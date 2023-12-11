//
//  ViewController.swift
//  Counter
//
//  Created by Gleb on 10.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterButton: UIButton!
    
    var count: Int = 0
    
    @IBAction func counterButton(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика: \(String(count))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: \(count)"
        // Do any additional setup after loading the view.
    }


}
