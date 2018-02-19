//
//  DetailViewController.swift
//  testGloballogic
//
//  Created by Robert on 16-02-18.
//  Copyright © 2018 Robert Bevilacqua. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var fullViewImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var laptop: LaptopModel?
    var index: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configDetail()

        // Do any additional setup after loading the view.
    }
    
    func configDetail() -> Void {
        
        self.titleLabel.text = self.laptop?.title
        self.descriptionLabel.text = self.laptop?.descrip
        
        if laptop?.image != nil {
            self.loadImage(image: laptop!.image!)
            
        } else {
            self.fullViewImage.image = UIImage(named: "")
        }
        
    }
    
    func loadImage(image: String) -> Void {
        self.fullViewImage.kf.indicatorType = .activity
        self.fullViewImage.kf.indicator!.startAnimatingView()
        self.fullViewImage.kf.setImage(with: URL(string: image) as Resource?,
                                       placeholder: UIImage(named: ""),
                                       options: [.transition(ImageTransition.fade(1))],
                                       progressBlock: { receivedSize, totalSize in
                                        print("\(receivedSize)/\(totalSize)")
        },
                                       completionHandler: { image, error, cacheType, imageURL in
                                        print("Finished")
                                        self.fullViewImage.kf.indicator!.stopAnimatingView()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
