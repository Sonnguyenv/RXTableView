//
//  ProductTableViewCell.swift
//  RxTableView
//
//  Created by SonNV-D1 on 5/6/20.
//  Copyright © 2020 SonNV-D1. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var viewBound: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDes: UILabel!
    
    static let cellId = "ProductTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBound.layer.cornerRadius = 10
        imageCell.layer.cornerRadius = imageCell.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func item(_ item: Product) {
        imageCell.image = UIImage(named: item.imageName)
        labelTitle.text = item.name
        labelDes.text = item.price
    }
}
