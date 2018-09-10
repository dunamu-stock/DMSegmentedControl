//
//  ViewController.swift
//  Example
//
//  Created by Dominic on 9/7/18.
//  Copyright © 2018 DominicMiller. All rights reserved.
//

import UIKit

import DMSegmentedControl

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var segmentedControl4: DMSegmentedControl!
    var viewWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DMSegmentedControl Demo"
        view.backgroundColor = .white
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        viewWidth = view.frame.width
        
        setUpSegmentedControl()
        setUpSegmentedControl1()
        setUpSegmentedControl2()
        setUpSegmentedControl3()
        setUpSegmentedControl4()
        setUpScrollView()
    }
    
    /// Minimum code required to use the segmented control with the default styling.
    func setUpSegmentedControl() {
        let segmentedControl = DMSegmentedControl(sectionTitles: ["Trending", "News", "Library"])
        segmentedControl.frame = CGRect(x: 0, y: 20, width: viewWidth, height: 40)
        segmentedControl.autoresizingMask = [.flexibleRightMargin, .flexibleWidth]
        segmentedControl.addTarget(self, action: #selector(segmentedControlChangedValue(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    
    /// Segmented control with scrolling
    func setUpSegmentedControl1() {
        let segmentedControl1 = DMSegmentedControl(sectionTitles: ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"])
        segmentedControl1.autoresizingMask = [.flexibleRightMargin, .flexibleWidth]
        segmentedControl1.frame = CGRect(x: 0, y: 60, width: viewWidth, height: 40)
        segmentedControl1.segmentEdgeInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        segmentedControl1.selectionStyle = .fullWidthStripe
        segmentedControl1.selectionIndicatorLocation = .down
        segmentedControl1.isVerticalDividerEnabled = true
        segmentedControl1.verticalDividerColor = .black
        segmentedControl1.verticalDividerWidth = 1.0
        segmentedControl1.titleFormatter = { (segmentedControl, title, index, selected) in
            let attString = NSAttributedString(string: title, attributes:[.foregroundColor : UIColor.blue])
            return attString
        }
        segmentedControl1.addTarget(self, action: #selector(segmentedControlChangedValue(_:)), for: .valueChanged)
        view.addSubview(segmentedControl1)
    }
    
    /// Segmented control with images
    func setUpSegmentedControl2() {
        let images = [UIImage(imageLiteralResourceName: "1"), UIImage(imageLiteralResourceName: "2"),
                      UIImage(imageLiteralResourceName: "3"), UIImage(imageLiteralResourceName: "4")]
        let selectedImages = [UIImage(imageLiteralResourceName: "1-selected"), UIImage(imageLiteralResourceName: "2-selected"),
                              UIImage(imageLiteralResourceName: "3-selected"), UIImage(imageLiteralResourceName: "4-selected")]
        let titles = ["1", "2", "3", "4"]
        
        let segmentedControl2 = DMSegmentedControl(sectionImages: images, sectionSelectedImages: selectedImages, sectionTitles: titles)
        segmentedControl2.imagePosition = .leftOfText
        segmentedControl2.frame = CGRect(x: 0, y: 120, width: viewWidth, height: 50)
        segmentedControl2.selectionIndicatorHeight = 4.0
        segmentedControl2.backgroundColor = .clear
        segmentedControl2.selectionIndicatorLocation = .down
        segmentedControl2.selectionStyle = .textWidthStripe
        segmentedControl2.segmentWidthStyle = .dynamic
        segmentedControl2.addTarget(self, action: #selector(segmentedControlChangedValue(_:)), for: .valueChanged)
        view.addSubview(segmentedControl2)
    }
    
    /// Segmented control with more customization and indexChangeBlock
    func setUpSegmentedControl3() {
        let segmentedControl3 = DMSegmentedControl(sectionTitles: ["One", "Two", "Three", "4", "Five"])
        segmentedControl3.frame = CGRect(x: 0, y: 180, width: viewWidth, height: 50)
        segmentedControl3.indexChangeBlock = { index in
            print("Selected index \(index) (via block)")
        }
        segmentedControl3.selectionIndicatorHeight = 4.0
        segmentedControl3.backgroundColor = UIColor(red: 0.1, green: 0.4, blue: 0.8, alpha: 1)
        segmentedControl3.titleTextAttributes = [.foregroundColor : UIColor.white]
        segmentedControl3.selectionIndicatorColor = UIColor(red: 0.5, green: 0.8, blue: 1, alpha: 1)
        segmentedControl3.selectionIndicatorBoxColor = .black
        segmentedControl3.selectionIndicatorBoxOpacity = 1.0
        segmentedControl3.selectionStyle = .box
        segmentedControl3.selectedSegmentIndex = DMSegmentedControl.NoSegment
        segmentedControl3.selectionIndicatorLocation = .down
        segmentedControl3.shouldAnimateUserSelection = false
        segmentedControl3.tag = 2
        view.addSubview(segmentedControl3)
    }
    
    // Tying up the segmented control to a scroll view
    func setUpSegmentedControl4() {
        segmentedControl4 = DMSegmentedControl(frame: CGRect(x: 0, y: 260, width: viewWidth, height: 50))
        segmentedControl4.sectionTitles = ["Worldwide", "Local", "Headlines"]
        segmentedControl4.selectedSegmentIndex = 1
        segmentedControl4.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        segmentedControl4.titleTextAttributes = [.foregroundColor : UIColor.white]
        segmentedControl4.selectedTitleTextAttributes = [.foregroundColor : UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)]
        segmentedControl4.selectionIndicatorColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
        segmentedControl4.selectionStyle = .box
        segmentedControl4.selectionIndicatorLocation = .up
        segmentedControl4.tag = 3
        segmentedControl4.indexChangeBlock = { [weak self] (index) in
            self?.scrollView.scrollRectToVisible(CGRect(x: self!.viewWidth * CGFloat(index), y: 0,
                                                        width: self!.viewWidth, height: 200),
                                                 animated: true)
        }
        view.addSubview(segmentedControl4)
    }
    
    func setUpScrollView() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 310, width: viewWidth, height: 210))
        scrollView.backgroundColor = UIColor(red: 0.7, green: 0.7, blue:0.7, alpha: 1)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: viewWidth * 3, height: 200)
        scrollView.delegate = self
        scrollView.scrollRectToVisible(CGRect(x: viewWidth, y: 0, width: viewWidth, height: 200), animated: false)
        view.addSubview(scrollView)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 210))
        setApperance(for: label1)
        label1.text = "Worldwide"
        scrollView.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: viewWidth, y: 0, width: viewWidth, height: 210))
        setApperance(for: label2)
        label2.text = "Local"
        scrollView.addSubview(label2)
        
        let label3 = UILabel(frame: CGRect(x: viewWidth * 2, y: 0, width: viewWidth, height: 210))
        setApperance(for: label3)
        label3.text = "Headlines"
        scrollView.addSubview(label3)
    }
    
    func setApperance(for label: UILabel) {
        let hue: CGFloat = CGFloat(arc4random() % 256) / 256.0
        let saturation: CGFloat = (CGFloat(arc4random() % 128) / 256.0) + 0.5  //  0.5 to 1.0, away from white
        let brightness: CGFloat = (CGFloat(arc4random() % 128) / 256.0) + 0.5  //  0.5 to 1.0, away from black
        let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
        label.backgroundColor = color
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 21.0)
        label.textAlignment = .center
    }
    
    @objc func segmentedControlChangedValue(_ segmentedControl: DMSegmentedControl) {
        print("Selected index \(segmentedControl.selectedSegmentIndex) (via UIControlEventValueChanged)")
    }
    
    @objc func uisegmentedControlChangedValue(_ segmentedControl: UISegmentedControl) {
        print("Selected index \(segmentedControl.selectedSegmentIndex)")
    }
    
    /*
     * MARK: - UIScrollViewDelegate
     */
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let page = Int(scrollView.contentOffset.x / pageWidth)
        segmentedControl4.setSelectedSegmentIndex(page, animated: true)
    }
    
}
