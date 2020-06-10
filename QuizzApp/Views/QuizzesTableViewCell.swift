//
//  QuizListTableViewCell.swift
//  QuizzApp
//
//  Created by Borna on 01/06/2020.
//  Copyright © 2020 hr.fer.majstorovic.borna. All rights reserved.
//

import UIKit
import Kingfisher
class QuizzesTableViewCell: UITableViewCell {

    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizzTitle: UILabel!
    @IBOutlet weak var quizDescription: UILabel!
    @IBOutlet weak var quizzDifficulty: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        quizzTitle.text = ""
        quizDescription.text = ""
        quizzDifficulty.text = ""
        quizImage = nil
        
    }
    // kingfisher ponekad nakon refresha crasha sa nilom
    func configure(withQuizz quiz: QuizCellModel){
        quizzTitle.text = quiz.title
        quizDescription.text = quiz.description
        quizzDifficulty.text = quiz.level
        guard let imageUrl = quiz.imageUrl else {return}
        quizImage.kf.setImage(with: imageUrl)
    }
    
}
