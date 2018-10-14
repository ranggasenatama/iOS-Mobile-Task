//
//  PostTableViewCell.swift
//  Mobile App
//
//  Created by Rangga Senatama Putra on 12/10/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit

final class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageCellView: UIImageView!
    
    func bind(_ viewModel: PostItemViewModel) {
        self.titleLabel.text = viewModel.title
        self.timeLabel.text = viewModel.time
        self.imageCellView.image = viewModel.image
    }
}
