//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = ["Soft" : 3 , "Medium" : 420 , "Hard" : 720]
    var totalTime = 0
    var timePassed = 0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        totalTime = eggTime[sender.currentTitle!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(ViewController.updateCounter),
                                     userInfo: nil,
                                     repeats: true
        )
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if totalTime > timePassed {
            
        
            timePassed += 1
            print("totalTime\(totalTime)")
            print("timePass\(timePassed)")

          let  percentageProgress = Float(timePassed) / Float(totalTime)
            print(percentageProgress)
            progressBar.progress = percentageProgress
            
            
            
        }else{
            
            timer.invalidate()
            titleLabel.text = "Done ! "
        }
    }
}
