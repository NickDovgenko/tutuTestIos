//
//  CustomTableViewCell.swift
//  tutuTestIos
//
//  Created by Nick on 27.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

//Кастомная ячейка таблицы для отображения нужных данных

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var countryTitleText: UILabel!
    @IBOutlet weak var cityTitleText: UILabel!
    @IBOutlet weak var stationTitleText: UILabel!

    @IBAction func detailInfo(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
