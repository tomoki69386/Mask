//
//  ViewController.swift
//  ARPlus
//
//  Created by 築山朋紀 on 2018/10/24.
//  Copyright © 2018 築山朋紀. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var faceTracker: FaceTracker? = nil
    @IBOutlet var cameraView :UIView!
    var rectView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //四角い枠を用意しておく
        self.rectView.layer.borderWidth = 3
        rectView.layer.borderColor = UIColor.yellow.cgColor
        self.view.addSubview(self.rectView)
        faceTracker = FaceTracker(view: self.cameraView, findface:{arr in
            //一番の顔だけ使う
            let rect = arr[0]
            
            //四角い枠を顔の位置に移動する
            self.rectView.frame = rect
        })
    }


}

