//
//  ViewController.swift
//  PageScroll
//
//  Created by Arpita Bhatia on 1/23/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //***dragg the Pan Gesture Recognizer into the View Controller and write the following codeline for scroll to work when swiped outside scroll view
        
        view.addGestureRecognizer(scrollView.panGestureRecognizer)
    }
    //moved code from view did load to view did appear when scroll view was not same as full screen, as scroll view frame sizes are available in view did appear and not view did load
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollView.frame.size.width
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth  * CGFloat(x)
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        //scrollView.backgroundColor = UIColor.blue
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

