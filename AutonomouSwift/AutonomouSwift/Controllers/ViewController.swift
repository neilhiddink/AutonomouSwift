//
//  ViewController.swift
//  AutonomouSwift
//
//  Created by Neil Hiddink on 1/6/19.
//  Copyright © 2019 Neil Hiddink. All rights reserved.
//

import UIKit

// MARK: ViewController: UIViewController

class ViewController: UIViewController {
    
    var home = CGPoint.zero
    
    // MARK: IB Outlets
    
    @IBOutlet var directionLabel: UILabel!
    
    @IBOutlet var upArrow: UIImageView!
    @IBOutlet var downArrow: UIImageView!
    @IBOutlet var rightArrow: UIImageView!
    @IBOutlet var leftArrow: UIImageView!
    
    @IBOutlet var joystick: UIImageView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        home = CGPoint(x: 168, y: view.frame.height - 168)
        
        upArrow.center = CGPoint(x: 168, y: view.frame.height - 268)
        downArrow.center = CGPoint(x: 168, y: view.frame.height - 68)
        leftArrow.center = CGPoint(x: 68, y: view.frame.height - 168)
        rightArrow.center = CGPoint(x: 268, y: view.frame.height - 168)
        joystick.center = home
        directionLabel.text = ""
    }
    
    // MARK: - Helper Methods
    
    func distance(p1: CGPoint, p2: CGPoint) -> CGFloat {
        return sqrt(((p2.x - p1.x) * (p2.x - p1.x)) + ((p2.y - p1.y) * (p2.y - p1.y)))
    }
    
    func moveAnimation(to point: CGPoint) {
        UIView.animate(withDuration: 0.1) {
            self.joystick.center.x = point.x
            self.joystick.center.y = point.y
        }
    }
    
    func resetScaling() {
        upArrow.scaleDownAnimation()
        downArrow.scaleDownAnimation()
        rightArrow.scaleDownAnimation()
        leftArrow.scaleDownAnimation()
    }
    
}

extension UIView {
    
    // https://stackoverflow.com/questions/3844557/uiview-shake-animation
    func shakeAnimation() {
        self.transform = CGAffineTransform(translationX: 15, y: 0)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        })
    }
    
    func scaleDownAnimation() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }

}

// MARK: - Touch Methods

extension ViewController {
    
    func touchDown(at point: CGPoint) {
        guard self.distance(p1: self.joystick.center, p2: point) < 150 else {
            joystick.shakeAnimation()
            return
        }
        moveAnimation(to: point)
        
        let dx = point.x - home.x
        let dy = point.y - home.y
        let angle = atan(dy / dx) * 180.0 / CGFloat.pi // angle in degrees
        
        let direction = (dx > 0 ? true : false, dy > 0 ? true : false, angle > 0 ? true : false)
        
        resetScaling()
        
        switch direction {
        case (true, false, false): // first quadrant
            if abs(angle) > 45 {
                upArrow.scaleUpAnimation()
                directionLabel.text = "UP"
            } else {
                rightArrow.scaleUpAnimation()
                directionLabel.text = "RIGHT"
            }
        case (false, false, true): // second quadrant
            if abs(angle) > 45 {
                upArrow.scaleUpAnimation()
                directionLabel.text = "UP"
            } else {
                leftArrow.scaleUpAnimation()
                directionLabel.text = "LEFT"
            }
        case (false, true, false): // third quadrant
            if abs(angle) > 45 {
                downArrow.scaleUpAnimation()
                directionLabel.text = "DOWN"
            } else {
                leftArrow.scaleUpAnimation()
                directionLabel.text = "LEFT"
            }
        case (true, true, true): // fourth quadrant
            if abs(angle) > 45 {
                downArrow.scaleUpAnimation()
                directionLabel.text = "DOWN"
            } else {
                rightArrow.scaleUpAnimation()
                directionLabel.text = "RIGHT"
            }
        default:
            break
        }
        
//        print("dx: \(dx), dy: \(dy), angle: \(angle)") // useful for debugging
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first { touchDown(at: touch.location(in: self.view)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self.view)
            guard distance(p1: home, p2: location) < 100 else { return }
            
            touchDown(at: location)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        joystick.center = home
        resetScaling()
        directionLabel.text = ""
    }
    
}
