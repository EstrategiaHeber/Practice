//
//  ContactoCell.swift
//  ContactosCoreData
//
//  Created by ALAN CARO on 11/10/23.
//

import UIKit

class ContactoCell: UITableViewCell {

    @IBOutlet weak var imagenContacto: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var correoLabel: UILabel!
    @IBOutlet weak var direccionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imagenContacto.layer.cornerRadius = imagenContacto.frame.width / 2
        imagenContacto.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
