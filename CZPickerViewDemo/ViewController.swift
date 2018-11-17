//
//  ViewController.swift
//  CZPickerViewDemo
//
//  Created by volive solutions on 17/11/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit
import CZPicker

class ViewController: UIViewController {
    var fruits = [String]()
    var fruitImages = [UIImage]()
    var pickerWithImage: CZPickerView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruits = ["Apple", "Banana", "Grape", "Watermelon", "Lychee"]
        fruitImages = [UIImage(named: "Apple")!, UIImage(named: "Banana")!, UIImage(named: "Grape")!, UIImage(named: "Watermelon")!, UIImage(named: "Lychee")!]
        self.title = "CZPicker"
    }

    @IBAction func pickerBtnAction(_ sender: Any) {
        pickerWithImage = CZPickerView(headerTitle: "Fruits", cancelButtonTitle: "Cancel", confirmButtonTitle: "Confirm")
        pickerWithImage?.delegate = self
        pickerWithImage?.dataSource = self
        pickerWithImage?.needFooterView = false
        pickerWithImage?.show()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: CZPickerViewDelegate, CZPickerViewDataSource {
    
    func czpickerView(_ pickerView: CZPickerView!, imageForRow row: Int) -> UIImage! {
        if pickerView == pickerWithImage {
            return fruitImages[row]
        }
        return nil
    }
    
    func numberOfRows(in pickerView: CZPickerView!) -> Int {
         return fruits.count
    }
    func czpickerView(_ pickerView: CZPickerView!, titleForRow row: Int) -> String! {
         return fruits[row]
    }
    
    
    
    func czpickerView(_ pickerView: CZPickerView!, didConfirmWithItemAtRow row: Int){
        print(fruits[row])
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func czpickerViewDidClickCancelButton(_ pickerView: CZPickerView!) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func czpickerView(pickerView: CZPickerView!, didConfirmWithItemsAtRows rows: [AnyObject]!) {
        for row in rows {
            if let row = row as? Int {
                print(fruits[row])
            }
        }
    }
}

