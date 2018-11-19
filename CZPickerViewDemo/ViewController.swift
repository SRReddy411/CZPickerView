//
//  ViewController.swift
//  CZPickerViewDemo
//
//  Created by volive solutions on 17/11/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit
import CZPicker

class ViewController: UIViewController,UITextFieldDelegate {
  
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        <#code#>
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        <#code#>
    //    }
    
    //var myPickerView : UIPickerView!
    
    var fruits = [String]()
    var fruitImages = [UIImage]()
    var pickerWithImage: CZPickerView?
    let datePicker = UIDatePicker()
    
    @IBOutlet var startYearTF: UITextField!
    @IBOutlet var endYearTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        //        self.myPickerView.delegate = self
        //        self.myPickerView.dataSource = self
        //        self.myPickerView.backgroundColor = UIColor.white
        //        startYearTF.inputView = self.myPickerView
        //        endYearTF.inputView = self.myPickerView
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        endYearTF.inputAccessoryView = toolBar
        startYearTF.inputAccessoryView = toolBar
        fruits = ["Apple", "Banana", "Grape", "Watermelon", "Lychee"]
        fruitImages = [UIImage(named: "Apple")!, UIImage(named: "Banana")!, UIImage(named: "Grape")!, UIImage(named: "Watermelon")!, UIImage(named: "Lychee")!]
        self.title = "CZPicker"
        
        // showDatePicker()
        
    }
    
    //MARK:- Button
    @objc func doneClick() {
        startYearTF.resignFirstResponder()
        endYearTF.resignFirstResponder()
    }
    @objc func cancelClick() {
        startYearTF.resignFirstResponder()
        endYearTF.resignFirstResponder()
    }
    
    
    //MARK:- DATE PICKER
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        startYearTF.inputAccessoryView = toolbar
        startYearTF.inputView = datePicker
        
        endYearTF.inputAccessoryView = toolbar
        endYearTF.inputView = datePicker
    }
    
    @objc func donedatePicker(){
        
        
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == startYearTF{
            datePicker.datePickerMode = .date
            
            //ToolBar
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
            
            toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
            
            startYearTF.inputAccessoryView = toolbar
            startYearTF.inputView = datePicker
            
            
        }else{
            datePicker.datePickerMode = .date
            
            //ToolBar
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
            
            toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
            
            endYearTF.inputAccessoryView = toolbar
            endYearTF.inputView = datePicker
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == startYearTF {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            startYearTF.text = formatter.string(from: datePicker.date)
        }else{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            let toYear:String = formatter.string(from: datePicker.date)
            if (startYearTF.text?.isEqualToString(find: toYear))! {
                print("Equals")
            }else{
                endYearTF.text = formatter.string(from: datePicker.date)
            }
            
        }
    }
    
    @IBAction func pickerBtnAction(_ sender: Any) {
        
        
        
        
        
        
        
        
        //        pickerWithImage = CZPickerView(headerTitle: "Fruits", cancelButtonTitle: "Cancel", confirmButtonTitle: "Confirm")
        //        pickerWithImage?.delegate = self
        //        pickerWithImage?.dataSource = self
        //        pickerWithImage?.needFooterView = false
        //        pickerWithImage?.show()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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

extension String {
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
}
