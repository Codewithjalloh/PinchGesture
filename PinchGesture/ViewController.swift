//
//  ViewController.swift
//  PinchGesture
//
//  Created by wealthyjalloh on 05/07/2016.
//  Copyright © 2016 CWJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var generalTzuImage: UIImageView!
    var lastScaleFactor: CGFloat = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let pinchGesture:UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: "pinchGesture:")
        generalTzuImage.addGestureRecognizer(pinchGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pinchGesture(sender: UIPinchGestureRecognizer) {
        let factor = sender.scale
        if (factor > 1) {
            // increase zoom
            sender.view?.transform = CGAffineTransformMakeScale(lastScaleFactor + (factor-1), lastScaleFactor + (factor-1))
        } else {
            // decrease zoom
            sender.view?.transform = CGAffineTransformMakeScale(lastScaleFactor * factor, lastScaleFactor * factor-1)
        }
        if (sender.state == UIGestureRecognizerState.Ended){
            if (factor > 1) {
                lastScaleFactor += (factor-1)
            }else {
                lastScaleFactor *= factor
            }
        }
    }


}

