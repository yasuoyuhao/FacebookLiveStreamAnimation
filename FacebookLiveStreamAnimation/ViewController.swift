//
//  ViewController.swift
//  FacebookLiveStreamAnimation
//
//  Created by 陳囿豪 on 2017/4/17.
//  Copyright © 2017年 yasuoyuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let curvedView = CurvedView(frame: view.frame)
//        curvedView.backgroundColor = UIColor(colorLiteralRed: 220/255, green: 220/255, blue: 220/255, alpha: 1)
//        view.addSubview(curvedView)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    func handleTap(gesture : UITapGestureRecognizer) {
        (0...5).forEach { (_) in
            generateAnimatedViews()
        }
        let location = gesture.location(in: view)
        print(location)
    }
    
    fileprivate func generateAnimatedViews(){
        
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "Hearts_000000_100") : #imageLiteral(resourceName: "Good Quality_000000_100")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
        
        view.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

func customPath() -> UIBezierPath {
    
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 180, y: 700))
    
    let endPoint = CGPoint(x: 187, y: -50)
    //        path.addLine(to: endPoint)
    
    let randomYShite = 150 + drand48() * 300
    let cp1 = CGPoint(x: 0 - randomYShite, y: 380 )
    let cp2 = CGPoint(x: 400 + randomYShite, y: 100 )

    
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    
    
    
    return path
}


class CurvedView : UIView {
    
    override func draw(_ rect: CGRect) {
        
        let path = customPath()
        path.lineWidth = 3
        path.stroke()
    }
    
    
}












