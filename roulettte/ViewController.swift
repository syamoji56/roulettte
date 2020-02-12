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
    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var rouletteView: UIView!
    @IBOutlet weak var circleView1: UILabel!
    @IBOutlet weak var circleView2: UILabel!
    @IBOutlet weak var circleView3: UILabel!
    @IBOutlet weak var circleView4: UILabel!
    
    var rouletteContents:[String]=["大吉","中吉","小吉","吉"]
    var contentsNumber = 0
    var timer=Timer()
    var angleCount:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circleView1.text=rouletteContents[0]
        circleView2.text=rouletteContents[1]
        circleView3.text=rouletteContents[2]
        circleView4.text=rouletteContents[3]
    }
    
    @IBAction func startAndStopButtonAction(_ sender: Any) {
        timerAction()
        buttonTitleUpdate()
    }
    
    func timerAction(){
        if !timer.isValid {
            timer=Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.timeUpdate), userInfo: nil, repeats: true)
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
        
        angleCount += 10
        let angle =  angleCount * CGFloat.pi / 180
        rouletteView.transform=CGAffineTransform(rotationAngle: angle)
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
    //画面遷移時に値の受け渡し　changeViewButtonActionのperformSegueに関連する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC=segue.destination as! EditViewController
        nextVC.editRouletteContents=rouletteContents
    }
    
    func setContents(contents:[String]){
        rouletteContents=contents
        circleView1.text=rouletteContents[0]
        circleView2.text=rouletteContents[1]
        circleView3.text=rouletteContents[2]
        circleView4.text=rouletteContents[3]
    }
}

