//
//  MyTable1.swift
//  EXA_PRACT2_CUPCAKE
//
//  Created by LEONARDO on 05/04/17.
//  Copyright © 2017 CUPCAKE. All rights reserved.
//

import UIKit

class MyTable1: UITableViewCell {

    //Outlets de elementos en la vista con la tabla
    @IBOutlet weak var lblDir: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var imgOp1: UIImageView!
    @IBOutlet weak var imgOp2: UIImageView!
    @IBOutlet weak var imgOp3: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
