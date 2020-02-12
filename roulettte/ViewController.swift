//
//  ViewController.swift
//  roulettte
//
//  Created by FullName on 2020/02/11.
//  Copyright © 2020 syamoji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startAndStopButton: UIButton!
    @IBOutlet var rouletteDisplayLabel: UILabel!
    
    var rouletteContents:[String]=["大吉","中吉","小吉","吉"]
    var contentsNumber = 0
    var timer=Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startAndStopButtonAction(_ sender: Any) {
        timerAction()
        buttonTitleUpdate()
    }
    
    func timerAction(){
        if !timer.isValid {
            timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timeUpdate), userInfo: nil, repeats: true)
        }
        else{
            timer.invalidate()
        }
    }
    
    @objc func timeUpdate(){
        contentsNumber+=1
        if contentsNumber>=rouletteContents.count{
            contentsNumber=0
        }
        if rouletteContents.count > 0 {
            rouletteDisplayLabel.text=rouletteContents[contentsNumber]
        }
    }
    
    func buttonTitleUpdate(){
        if !timer.isValid {
            startAndStopButton.setTitle("スタート", for: .normal)
        }else{
            startAndStopButton.setTitle("ストップ", for: .normal)
        }
    }
    
    @IBAction func changeViewButtonAction(_ sender: Any) {
        if timer.isValid {
         timer.invalidate()
        }
        buttonTitleUpdate()
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC=segue.destination as! EditViewController
        nextVC.editRouletteContents=rouletteContents
    }
    
    func setContents(contents:[String]){
    
        rouletteContents=contents
    }
}

