//
//  ViewController.swift
//  CZPickerViewDemo
//
//  Created by volive solutions on 17/11/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit
import CZPicker
import EventKit
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
    
    
    let store = EKEventStore()
    
    @IBOutlet var startYearTF: UITextField!
    @IBOutlet var endYearTF: UITextField!
    @IBOutlet var pickerTF: UITextField!
    
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
    
    //MARK:- DONE AND CANCEL PICKER BUTTONS ACTION
    
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
    
    //MARK:- TEXTFILED DELEGATES METHODS
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
            
            
        }else if textField == endYearTF{
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
        }else{
            
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == startYearTF {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            startYearTF.text = formatter.string(from: datePicker.date)
            
        }else if textField == endYearTF{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            let toYear:String = formatter.string(from: datePicker.date)
            if (startYearTF.text?.isEqualToString(find: toYear))! {
                print("Equals")
            }else {
                endYearTF.text = formatter.string(from: datePicker.date)
                let startDate = formatter.date(from: startYearTF.text!)
                
             
            }
            
        }else{
            
        }
        
    }
    //MARK:- PICKER BTN ACTION
    @IBAction func pickerBtnAction(_ sender: Any) {
        
        addEventToCalendar(title: "joshi ", description: "Remember you or miss you!", startDate: NSDate() as Date, endDate: NSDate() as Date)
        UIApplication.shared.openURL(NSURL(string: "calshow://")! as URL)
        
        
//        pickerWithImage = CZPickerView(headerTitle: "Fruits", cancelButtonTitle: "Cancel", confirmButtonTitle: "Confirm")
//        pickerWithImage?.delegate = self
//        pickerWithImage?.dataSource = self
//        pickerWithImage?.needFooterView = false
//        pickerWithImage?.show()
      
        
        
    }
    
    func addEventToCalendar(title: String, description: String?, startDate: Date, endDate: Date, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
        
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                let event = EKEvent(eventStore: eventStore)
                event.title = title
                event.startDate = startDate
                event.endDate = endDate
                event.notes = description
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let e as NSError {
                    completion?(false, e)
                    return
                }
                completion?(true, nil)
            } else {
                completion?(false, error as NSError?)
            }
        })
    }
    
    
    func createEventinTheCalendar(with title:String, forDate eventStartDate:Date, toDate eventEndDate:Date) {
        
        store.requestAccess(to: .event) { (success, error) in
            if  error == nil {
                let event = EKEvent.init(eventStore: self.store)
                event.title = title
                event.calendar = self.store.defaultCalendarForNewEvents // this will return deafult calendar from device calendars
                event.startDate = eventStartDate
                event.endDate = eventEndDate
                
                let alarm = EKAlarm.init(absoluteDate: Date.init(timeInterval: -3600, since: event.startDate))
                event.addAlarm(alarm)
                
                do {
                    try self.store.save(event, span: .thisEvent)
                    //event created successfullt to default calendar
                } catch let error as NSError {
                    print("failed to save event with error : \(error)")
                }
                
            } else {
                //we have error in getting access to device calnedar
                print("error = \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
//MARK:- CZPICKER DELEGATE & DATA SOURCE METHODS
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
        self.pickerTF.text = fruits[row]
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
//MARK:- STRINGS COMPARE METHODS
extension String {
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
}
