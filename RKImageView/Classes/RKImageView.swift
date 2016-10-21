//
//  RKImageView.swift
//  Pods
//
//  Created by Radhakrishna Pai on 10/20/2016.
//  Copyright (c) 2016 Radhakrishna Pai. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
    
    @IBDesignable public class RKImageView: UIView, UIScrollViewDelegate {

        @IBInspectable public var image: UIImage? = nil {
            didSet {
                self.imageView.image = image
            }
        }
        
        var imageView: UIImageView = UIImageView()
        
        var scrollView: UIScrollView = UIScrollView()
        
        required public init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initialiseImageView()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            initialiseImageView()
        }
        
        func initialiseImageView() {
            self.backgroundColor = UIColor.black
            addScrollView()
            addImageView()
        }
        
        func addScrollView() {
            self.addSubview(self.scrollView)
            self.scrollView.translatesAutoresizingMaskIntoConstraints = false
            self.scrollView.delegate = self
            
            self.scrollView.minimumZoomScale = 1.0
            self.scrollView.maximumZoomScale = 10.0
            self.scrollView.clipsToBounds = false
            
            let leadingConstraint = self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            let trailingConstraint = self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            let topConstraint = self.scrollView.topAnchor.constraint(equalTo: self.topAnchor)
            let bottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        }
        
        func addImageView() {
            self.scrollView.addSubview(self.imageView)
            self.imageView.translatesAutoresizingMaskIntoConstraints = false
            self.imageView.contentMode = UIViewContentMode.scaleAspectFit
            
            let leadingConstraint = self.imageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
            let trailingConstraint = self.imageView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
            let topConstraint = self.imageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
            let bottomConstraint = self.imageView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
            let widthConstraint = self.imageView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
            let heightConstraint = self.imageView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
            NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint, widthConstraint, heightConstraint])
            self.layoutIfNeeded()
        }
        
        public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return self.imageView
        }
        
        public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
            self.superview?.bringSubview(toFront: self)
        }
        
        public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
            UIView.animate(withDuration: 0.3) {
                scrollView.zoomScale = 1.0
                self.scrollView.layoutIfNeeded()
            }
        }
    }
