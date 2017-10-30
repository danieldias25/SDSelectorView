//
//  SDPresentationView.swift
//  Pods
//
//  Created by Daniel Dias on 30/10/17.
//
//


import UIKit

class SDPresentationView: UIView {
    var imageView: UIImageView?
    var blackView: UIView?
    var x:CGFloat = 0.0
    var y:CGFloat = 0.0
    
    
    override init(frame:CGRect) {
        super.init(frame:frame)
    }
    
    init(frame:CGRect ,AndImage image:UIImage, AndSize size: CGSize, AndScale scale: CGFloat){
        
        self.blackView = UIView(frame: frame)
        self.blackView?.backgroundColor = UIColor.black
        self.blackView?.alpha = 0.0
        
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.imageView?.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        self.x = (frame.size.width - (self.imageView?.frame.size.width)!)/2.0
        self.y = (frame.size.height - (self.imageView?.frame.size.height)!)/2.0
        let height = self.imageView?.frame.size.height
        let width = self.imageView?.frame.size.width
        
        self.imageView?.frame = CGRect(x: self.x, y: self.y, width: width!, height: height!)
        self.imageView?.backgroundColor = UIColor.clear
        self.imageView?.image = image
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.addSubview(self.blackView!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }) { (true) in
            self.removeFromSuperview()
        }
        
    }
    func presentImage() {
        
        let x = (frame.size.width - CGFloat(1))/2.0
        let y = (frame.size.height - CGFloat(1))/2.0
        
        let animateView = UIView(frame: CGRect(x: x, y: y, width: 1.00, height: 1.00))
        animateView.backgroundColor = UIColor.white
        animateView.alpha = 0.85
        self.addSubview(animateView)
        let horizontal = (self.imageView?.frame.size.width)! + CGFloat(5)
        let vertical = (self.imageView?.frame.size.height)! + CGFloat(5)
        UIView.animate(withDuration: 0.5, animations: {
            
            animateView.transform = CGAffineTransform(scaleX: horizontal, y: 1)
            
        }, completion: { (true) in
            
            UIView.animate(withDuration: 0.5, animations: {
                
                animateView.transform = CGAffineTransform(scaleX: horizontal, y: vertical)
                
            }, completion:  { (true) in
                self.imageView?.alpha = 0
                self.addSubview(self.imageView!)
                UIView.animate(withDuration: 0.2, animations: {
                    self.imageView?.alpha = 1
                }, completion: nil)
                
            })
            
        })
        
        
        
    }
    
    
}
