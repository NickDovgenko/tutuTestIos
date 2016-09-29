//
//  DetailTableViewController.swift
//  tutuTestIos
//
//  Created by Nick on 29.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var stationTitle: UILabel!
    @IBOutlet weak var countryTitle: UILabel!
    @IBOutlet weak var regionTitle: UILabel!
    @IBOutlet weak var districtTitle: UILabel!
    @IBOutlet weak var cityTitle: UILabel!
    
    var recivedDataCT = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stationTitle?.text = "Cтанция: \(recivedDataCT[0].station)"
        self.countryTitle?.text = "Страна: \(recivedDataCT[0].country)"
        self.regionTitle?.text = "Регион: \(recivedDataCT[0].regionTitle)"
        self.districtTitle?.text = "Район: \(recivedDataCT[0].districtTitle)"
        self.cityTitle?.text = "\(recivedDataCT[0].city)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
