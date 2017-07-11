//
//  TableViewController.swift
//  TodoSwiftter
//
//  Created by 土佐智紀 on 2017/07/02.
//  Copyright © 2017年 土佐智紀. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var resultArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //アプリ内に保存されてarrayというキー地で保存された配列arrayを取り出す
        if UserDefaults.standard.object(forKey: "array") != nil {
            resultArray = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        
        //arrayの中身を取り出してリストに表示する
        //reloadData->tableViewが持つnumbersSectionなどを一気に呼ぶ。これがないとセルが更新されない
        
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = resultArray[indexPath.row]
        
        //[indexPath.row]->これらのoverride funcは何回も呼ばれるため、添え字は0から始まり呼ばれた数だけプラスされていくと言ったことを表す(1回目は0, 2回目は1, ...のように)
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //配列のスライドされた番号のセルを消去
            resultArray.remove(at: indexPath.row)
            
            //その配列を再びアプリ内に保存
            UserDefaults.standard.set(resultArray, forKey: "array")
            
            //TableViewを更新
            //cellの数などの更新
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
