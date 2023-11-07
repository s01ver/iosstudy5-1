//
//  PizzaTableViewCell.swift
//  iosstudy5-1
//
//
//

import UIKit

class PizzaTableViewCell: UITableViewCell {

    @IBOutlet var pizzaImage: UIImageView!
    @IBOutlet var pizzaSize: UILabel!
    @IBOutlet var pizzaDough: UILabel!
    @IBOutlet var pizzaTopping: UILabel!
    @IBOutlet var pizzaPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
