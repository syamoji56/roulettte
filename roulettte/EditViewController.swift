//
//  EditViewController.swift
//  roulettte
//
//  Created by FullName on 2020/02/11.
//  Copyright © 2020 syamoji. All rights reserved.
//

import UIKit

class EditViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField4: UITextField!
    var editRouletteContents=["none"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField1.delegate=self
        textField2.delegate=self
        textField3.delegate=self
        textField4.delegate=self
        textField1.text=editRouletteContents[0]
        textField2.text=editRouletteContents[1]
        textField3.text=editRouletteContents[2]
        textField4.text=editRouletteContents[3]
        
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
        
        editRouletteContents.append(textField1.text ?? "")
        editRouletteContents.append(textField2.text ?? "")
        editRouletteContents.append(textField3.text ?? "")
        editRouletteContents.append(textField4.text ?? "")
        // 値を渡す
        createGroupViewController.setContents(contents: editRouletteContents)
        // popする
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
