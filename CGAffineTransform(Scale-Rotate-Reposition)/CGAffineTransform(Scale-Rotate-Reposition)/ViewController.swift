//
//  ViewController.swift
//  CGAffineTransform(Scale-Rotate-Reposition)
//
//  Created by Md. Faysal Ahmed on 4/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var darkFillView: UIView!
    @IBOutlet weak var toggleMenuButton: UIButton!
    @IBOutlet weak var socialIcon1: UIButton!
    @IBOutlet weak var socialIcon2: UIButton!
    @IBOutlet weak var socialIcon3: UIButton!
    @IBOutlet weak var socialIcon4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuButtonsAlpha(0)
    }
    
    @IBAction func didTapToggleMenuButton(_ sender: UIButton) {
        // .identity is a default (initial transform)
        if darkFillView.transform == .identity {
            UIView.animate(withDuration: 1.0, animations: {
                self.darkFillView.transform = CGAffineTransform(scaleX: 11, y: 11)
                
            }, completion: { success in
                UIView.animate(withDuration: 0.5, animations: {
                    //as menu view 69 height constant is below of super view bottom
                    self.menuView.transform = CGAffineTransform(translationX: 0, y: -69)
                    self.toggleMenuButton.transform = CGAffineTransform(rotationAngle: .pi)
                    
                }, completion: { suc in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.menuButtonsAlpha(1.0)
                    })
                })
            })
        }else {
            // back to initial states
            UIView.animate(withDuration: 1.0, animations: {
                self.menuButtonsAlpha(0)
                self.darkFillView.transform = .identity
                
            }, completion: { success in
                UIView.animate(withDuration: 1.0, animations: {
                    self.toggleMenuButton.transform = .identity
                    self.menuView.transform = .identity

                })
            })
        }
        
    }
    
    func menuButtonsAlpha(_ alpha: Double) {
        socialIcon1.alpha = alpha
        socialIcon2.alpha = alpha
        socialIcon3.alpha = alpha
        socialIcon4.alpha = alpha

    }
    
}
