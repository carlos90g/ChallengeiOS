//
//  HomeTableViewCell.swift
//  ChallengeiOS
//
//  Created by Carlos Garcia on 17/06/2021.
//  Copyright © 2021 Carlos Garcia. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    let imgView = UIImageView()
    let paymentsTitleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        //imgView.backgroundColor = .red
        let topConstraintImg = imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0 )
        let bottomConstraintImg = imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0)
        let leadingConstraintImg = imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0)
        let widthConstraintImg = imgView.widthAnchor.constraint(equalToConstant:65.0)
        let heightConstraintImg = imgView.heightAnchor.constraint(equalToConstant:45.0)

        NSLayoutConstraint.activate([topConstraintImg, bottomConstraintImg, leadingConstraintImg, widthConstraintImg, heightConstraintImg])
        
        contentView.addSubview(paymentsTitleLabel)
        paymentsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        //paymentsTitleLabel.backgroundColor = .blue
        let topConstraintLabel = paymentsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20.0 )
        let bottomConstraintLabel = paymentsTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20.0)
        let leadingConstraintLabel = paymentsTitleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20.0)
        let trailingConstraintLabel = paymentsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-30.0)
        let heightConstraintLabel = paymentsTitleLabel.heightAnchor.constraint(equalToConstant: 60.0)

        NSLayoutConstraint.activate([topConstraintLabel, bottomConstraintLabel, leadingConstraintLabel, trailingConstraintLabel, heightConstraintLabel])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
