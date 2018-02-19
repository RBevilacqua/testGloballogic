//
//  LaptopTableViewCell.swift
//  testGloballogic
//
//  Created by Robert on 16-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import UIKit
import Kingfisher

class LaptopTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(data: LaptopModel, index: IndexPath) -> Void {
        
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.descrip
        
        if data.image != nil {
            self.thImageView.kf.indicatorType = .activity
            self.thImageView.kf.indicator!.startAnimatingView()
            self.thImageView.kf.setImage(with: URL(string: data.image != nil ? data.image! : "") as Resource?,
                                             placeholder: UIImage(named: ""),
                                             options: [.transition(ImageTransition.fade(1))],
                                             progressBlock: { receivedSize, totalSize in
                                                print("\(receivedSize)/\(totalSize)")
            },
                                             completionHandler: { image, error, cacheType, imageURL in
                                                print("Finished")
                                                self.thImageView.kf.indicator!.stopAnimatingView()
            })
            
        } else {
            self.thImageView.image = UIImage(named: "")
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
