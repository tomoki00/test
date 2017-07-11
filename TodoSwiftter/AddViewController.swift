//
//  AddViewController.swift
//  TodoSwiftter
//
//  Created by 土佐智紀 on 2017/07/02.
//  Copyright © 2017年 土佐智紀. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var array = [String]()
    
    @IBOutlet var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
        
    }
    
    @IBAction func register(_ sender: Any) {
        
        //一度取り出さないと新しいarrayの中にappendされてしまうため前もっていたセルの情報を上書きしてしまうため、以下の記述をする
        if UserDefaults.standard.object(forKey: "array") != nil {
            array = UserDefaults.standard.object(forKey: "array") as![String]
        }
        
        
        //配列arrayの中にtextfieldのテキスを入れる
        array.append(textField.text!)
        
        
        //アプリ内にarrayを保存する
        UserDefaults.standard.set(array, forKey: "array")
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
