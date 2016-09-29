//
//  InfoViewController.swift
//  tutuTestIos
//
//  Created by Nick on 27.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
