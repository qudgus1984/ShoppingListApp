//
//  ShoppingListTableViewCell.swift
//  ShoppingListApp
//
//  Created by 이병현 on 2022/08/23.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonImage()
    }

    @IBAction func checkBoxButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {
    }
    
    func setButtonImage() {
        checkBoxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
}
