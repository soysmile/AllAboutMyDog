//
//  DogDisplayViewController.swift
//  MoreAboutYourDog
//
//  Created by George Heints on 18.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit

class DogDisplayViewController: UIViewController {

    @IBOutlet weak var dogViewDescription: UITextView!
    @IBOutlet weak var dogViewImage: UIImageView!
    
    var _Sources: testing?

    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    func displayData(){
        dogViewImage.downloadImg(from: (_Sources?.imageUrl)!)
        dogViewDescription.text = _Sources?.descr_ru
    }

}
