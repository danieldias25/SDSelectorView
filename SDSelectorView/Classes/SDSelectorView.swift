//
//  SDSelectorView.swift
//  Pods
//
//  Created by Daniel Dias on 30/10/17.
//
//

import Foundation
import UIKit

public protocol SDSelectorViewDelegate {
    
    func didCangedIndex(index: Int)
    func didSelectView(index: Int)
}


public class SDSelectorView: UIScrollView {
    
    public var SDdelegate: SDSelectorViewDelegate?
    
    public var presentationModeEnable = true
    public var presentationScale:CGFloat = 2.0
    public var maximunSpace : CGFloat? = 0
    public var spaceToViews:CGFloat = 30
    public var numberOfItems = 0
    public var scrollSize = CGFloat(0)
    public var collectionIndex = 0
    public var imageSize: CGSize?
    public var images: [UIImage?] = []
    public var stopOver: CGFloat?
    
    public func configSDSelectorWith(imageSize: CGSize, spacedBy space: CGFloat, withImages images: [UIImage]) {
        
        self.imageSize = imageSize
        self.spaceToViews = space
        self.images = images
        
        self.stopOver = (self.imageSize?.width)! + self.spaceToViews
        
        self.numberOfItems = images.count
        
        let myHeight = self.frame.size.height
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: myHeight)
        self.maximunSpace = (self.frame.size.width  - (self.imageSize?.width)!)/2.0
        self.scrollSize = ((self.frame.size.width  - (self.imageSize?.width)!)/2.0) + ((self.imageSize?.width)!/2.0)
        
        let first = (self.frame.size.width  - (self.imageSize?.width)!)/2.0
        
        let mywidth = (first * 2) + CGFloat(numberOfItems)*(self.imageSize?.width)! + CGFloat(numberOfItems-1)*spaceToViews
        
        self.contentSize = CGSize(width: mywidth, height: myHeight)
        
        self.showsHorizontalScrollIndicator = false
        self.delegate = self
        self.bounces = true
        
        self.createViewsForScroll(images: images)
        
        
    }
    
    public func createViewsForScroll(images: [UIImage]) {
        
        let myHeight = self.imageSize?.height
        let myWidth = self.imageSize?.width
        
        
        
        for i in 1...images.count{
            
            let first = (self.frame.size.width  - (self.imageSize?.width)!)/2.0
            if self.spaceToViews >= self.maximunSpace! {
                self.spaceToViews = self.maximunSpace!
            }
            
            let x = first + ((myWidth! + CGFloat(spaceToViews))*CGFloat(i-1))
            let y = (self.frame.size.height - (self.imageSize?.height)!)/2.0
            
            let myImageView = UIImageView(frame: CGRect(x: x , y: y, width:myWidth!, height: myHeight!))
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            
            
            myImageView.isUserInteractionEnabled = true
            myImageView.addGestureRecognizer(tapGestureRecognizer)
            myImageView.tag = i - 1
            myImageView.alpha = 0.6
            
            myImageView.image = images[i-1]
            
            if i == 1 {
                
                UIView.animate(withDuration: 0.2,
                               animations: {
                                myImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                myImageView.alpha = 1
                },completion: nil)
            }
            
            
            self.addSubview(myImageView)
        }
    }
    
    public func goToIndex(index:Int) {
        
        self.collectionIndex = index
        
        if self.collectionIndex >= self.numberOfItems - 1 {
            self.collectionIndex = self.numberOfItems - 1
        }
        if self.collectionIndex <= 0 {
            self.collectionIndex = 0
        }
        
        let x = self.stopOver!*CGFloat(self.collectionIndex)
        
        self.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        self.expandImageView(index: self.collectionIndex)
        SDdelegate?.didCangedIndex(index: self.collectionIndex)
        
        
    }
    
    public func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if tappedImage.tag == self.collectionIndex {
            
            self.SDdelegate?.didSelectView(index: tappedImage.tag)
            
            if self.presentationModeEnable == true {
                
                let width = self.superview?.frame.size.width
                let height = self.superview?.frame.size.height
                
                let image = self.images[tappedImage.tag]
                
                
                
                let presentationView = SDPresentationView(frame: CGRect(x: 0, y: 0, width: width!, height: height!), AndImage: image!, AndSize: self.imageSize!, AndScale: self.presentationScale)
                
                
                self.superview?.addSubview(presentationView)
                UIView.animate(withDuration: 0.5, animations: {
                    
                    presentationView.blackView?.alpha = 0.85
                    
                }, completion: { (true) in
                    presentationView.presentImage()
                })
            }
        }else {
            
            self.goToIndex(index: tappedImage.tag)
            
        }
        
        
        
    }
    
    
    public func expandImageView(index: Int) {
        
        let scrollSubViews = self.subviews
        
        for images in scrollSubViews{
            if images == scrollSubViews[index] {
                
                UIView.animate(withDuration: 0.2,
                               animations: {
                                images.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                images.alpha = 1
                },completion: nil)
                
            }else{
                
                UIView.animate(withDuration: 0.3,
                               animations: {
                                images.transform = CGAffineTransform.identity
                                images.alpha = 0.6
                },completion: nil)
                
            }
            
        }
    }
    
    public func setViewsOffset(_ scrollView: UIScrollView) {
        
        let x = round(scrollView.contentOffset.x / self.stopOver!) * self.stopOver!
        
        self.collectionIndex = Int(x/self.stopOver!)
        if self.collectionIndex >= self.numberOfItems - 1 {
            self.collectionIndex = self.numberOfItems - 1
        }
        if self.collectionIndex <= 0 {
            self.collectionIndex = 0
        }
        
        self.expandImageView(index: self.collectionIndex)
        SDdelegate?.didCangedIndex(index: self.collectionIndex)
        
        
        guard x >= 0 && x <= scrollView.contentSize.width - scrollView.frame.width else {
            return
        }
        
        
        scrollView.setContentOffset(CGPoint(x: x, y: scrollView.contentOffset.y), animated: true)
        
        
    }
    
}


extension SDSelectorView: UIScrollViewDelegate {
    
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        setViewsOffset(scrollView)
        
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        guard !decelerate else {
            return
        }
        
        setViewsOffset(scrollView)
    }
    
    
}





