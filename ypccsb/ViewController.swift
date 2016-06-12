//
//  ViewController.swift
//  ypccsb
//
//  Created by 李言 on 16/6/12.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView:UICollectionView!;
    var list: Array<UIColor> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        self.collectionView = UICollectionView.init(frame: CGRectMake(100, 40, 280, 100), collectionViewLayout: layout)
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "choushabi")
        self.collectionView.pagingEnabled = true
        self.view.addSubview(self.collectionView)
        list.append(UIColor.redColor())
        list.append(UIColor.greenColor())
        list.append(UIColor.blueColor())
        list.append(UIColor.redColor())
        list.append(UIColor.greenColor())
        list.append(UIColor.blueColor())
        list.append(UIColor.redColor())
        list.append(UIColor.greenColor())
        list.append(UIColor.blueColor())
        
        
       self.collectionView.setContentOffset(CGPointMake(270, 0) , animated: false)
        
    
    }
    
    

    internal func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return list.count;
    }
    
    internal func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("choushabi", forIndexPath: indexPath)
        
        cell.backgroundColor = list[indexPath.item] as UIColor!
        return cell
    
    }
    
    internal func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(80, 80)
        
    }
    
    internal func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10;
    }
    
    internal func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    
        
        return UIEdgeInsetsMake(0, 10, 0, 10);
    
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        
        
        let offset = scrollView.contentOffset
        if offset.x <= 0 {
            let x:CGFloat  = self.collectionView.bounds.width * CGFloat(self.list.count/3 - 2)
            scrollView.setContentOffset(CGPointMake(x, 0) , animated: false)
        }
        
        
        let maxx =   Float(self.collectionView.bounds.width) * Float(self.list.count/3-1)
        
        let offsetx = Float(offset.x)
        if  offsetx >= maxx{
            
            let x  = self.view.frame.width
            scrollView.setContentOffset(CGPointMake(x, 0) , animated: false)
            
        }
        
        UIView.animateWithDuration(3, animations: { () -> Void in
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

