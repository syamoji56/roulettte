//
//  EditViewController.swift
//  roulettte
//
//  Created by FullName on 2020/02/11.
//  Copyright © 2020 syamoji. All rights reserved.
//

import UIKit

class EditViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField4: UITextField!
    var editRouletteContents=["none"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField.delegate=self
        textField2.delegate=self
        textField3.delegate=self
        textField4.delegate=self
        
        if editRouletteContents.count >= 1 {
            textField.text=editRouletteContents[0]
        }
        if editRouletteContents.count >= 2 {
            textField2.text=editRouletteContents[1]
        }
        if editRouletteContents.count >= 3 {
            textField3.text=editRouletteContents[2]
        }
        if editRouletteContents.count >= 4 {
            textField4.text=editRouletteContents[3]
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
    @IBAction func done(_ sender: Any) {
        let nav = self.navigationController
        // 一つ前のViewControllerを取得する
        let createGroupViewController = nav?.viewControllers[(nav?.viewControllers.count)!-2] as! ViewController
        
        editRouletteContents.removeAll()
        
        if ((textField.text) != "") {
            editRouletteContents.append(textField.text ?? "")
        }
        if ((textField2.text) != "") {
            editRouletteContents.append(textField2.text ?? "")
        }
        if ((textField3.text) != "") {
            editRouletteContents.append(textField3.text ?? "")
        }
        if ((textField4.text) != "") {
            editRouletteContents.append(textField4.text ?? "")
        }
        
        // 値を渡す
        createGroupViewController.setContents(contents: editRouletteContents)
        
        // popする
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    //        let vc = self.presentingViewController as! UINavigationController
    //        //let vc = nc.topViewController as! ViewController
    //        vc.text = self.text
    //        self.dismiss(animated: true, completion: nil)
    //        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "View") as! ViewController
    //                 nextVC.text = "fromViewController"
    //        self.navigationController?.popViewController(animated: true)
    //self.navigationController?.pushViewController(nextVC, animated: true)
    //         _ = navigationController?.popViewController(animated: true)
    
    
    //    @IBAction func done(_ sender: Any) {
    //        // 表示の大元がViewControllerかNavigationControllerかで戻る場所を判断する
    //        if self.presentingViewController is UINavigationController {
    //            //  表示の大元がNavigationControllerの場合
    //            let nc = self.presentingViewController as! UINavigationController
    //            let vc = nc.topViewController as! ViewController
    //            vc.text = self.text
    //            self.dismiss(animated: true, completion: nil)
    //
    //        } else {
    //            // 表示元がViewControllerの場合
    //            // 前画面のViewControllerを取得
    //            let count = (self.navigationController?.viewControllers.count)! - 2
    //            let vc = self.navigationController?.viewControllers[count] as! SingleViewController
    //            vc.receivedTextLabel.text = self.returnTextField.text
    //            // 画面を消す
    //            self.navigationController?.popViewController(animated: true)
    //        }
    //    }
    
    //      @IBAction func byNavicationPush(_ sender: Any) {
    //          let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "View") as! ViewController
    //          //nextVC.text = "fromViewController"
    //          self.navigationController?.pushViewController(nextVC, animated: true)
    //    }
    //
  
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
