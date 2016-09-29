//
//  TimingController.swift
//  tutuTestIos
//
//  Created by Nick on 24.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class TimingController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Запрет на выбор "вчерашней" даты
        let todayDate = NSDate()
        datePicker.minimumDate = todayDate as Date
        
        // Background градиент
        let gradient: CAGradientLayer = CAGradientLayer()
        let color0 = UIColor(red:92.0/255, green:165.0/255, blue:196.0/255, alpha:0.2).cgColor
        let color1 = UIColor(red:255.0/255, green:255.0/255, blue: 255.0/255, alpha:0.2).cgColor
        let color2 = UIColor(red:92.0/255, green:165.0/255, blue: 196.0/255, alpha:0.2).cgColor
        gradient.colors = [color0,color1,color2]
        gradient.locations = [0.0 ,0.5, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
extension UITableViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UITableViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
}
}
