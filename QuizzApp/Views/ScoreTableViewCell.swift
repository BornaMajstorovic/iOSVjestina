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
        placeLabel.text = String(score.place)
        usernameLabel.text = score.user
        scoreLabel.text = score.score
    }
    
}
