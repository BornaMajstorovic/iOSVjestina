//
//  ScoreTableViewCell.swift
//  QuizzApp
//
//  Created by Borna on 17/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // 320x50
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        placeLabel.text = ""
        usernameLabel.text = ""
        scoreLabel.text = ""
    }
    
    func configure(withScore score: ScoreCellModel){
        self.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.8901960784, blue: 0.6549019608, alpha: 1)
        placeLabel.text = String(score.place)
        usernameLabel.text = score.user
        scoreLabel.text = score.score
    }
    
}
