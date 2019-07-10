//
//  ZLMyDepositViewController.swift
//  EYEE
//
//  Created by MacMini on 2019/7/9.
//  Copyright © 2019 zali. All rights reserved.
//

import UIKit

class ZLMyDepositViewController: UIViewController {
    
    lazy var pageHeader: ZLPageControlHeader = {
        let header = ZLPageControlHeader(frame: CGRect(x: 0, y: statusBarAndNavigationBarHeight, width: screenWidth, height: headerHeight))
        header.delegate = self
        let titleArr = ["我最美","我最强","我最高","我最棒"]
        header.configUIWithTitleArray(titleArray: titleArr)
        header.frame = CGRect(x: 0, y: statusBarAndNavigationBarHeight, width: screenWidth, height: headerHeight)
        return header
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: statusBarAndNavigationBarHeight + headerHeight, width: screenWidth, height: screenHeight - statusBarAndNavigationBarHeight - headerHeight))
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: screenWidth * 4.0, height: scrollView.frame.size.height)
        return scrollView
    }()
    var headerHeight: CGFloat = 44.0
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.white
        setupUI()
    }
    
}

//MARK: 方法
extension ZLMyDepositViewController {
    func setupUI() {
        self.view.addSubview(pageHeader)
        let depositVC_0 = ZLDepositTableViewController()
        depositVC_0.typeIndex = 0
        
        let depositVC_1 = ZLDepositTableViewController()
        depositVC_1.typeIndex = 1
        
        let depositVC_2 = ZLDepositTableViewController()
        depositVC_2.typeIndex = 2
        
        let depositVC_3 = ZLDepositTableViewController()
        depositVC_3.typeIndex = 3
        
        let vcArr = [depositVC_0, depositVC_1, depositVC_2, depositVC_3]
        for i in 0..<vcArr.count {
            let vc = vcArr[i]
            vc.view.frame = CGRect(x: screenWidth * CGFloat(i), y: 0, width: screenWidth, height: screenHeight - statusBarAndNavigationBarHeight - headerHeight)
            self.addChild(vc)
            scrollView.addSubview(vc.view)
        }
        
        self.view.addSubview(scrollView)
   
    }

}

//MARK: - 代理
extension ZLMyDepositViewController: PageControlHeaderDelegate {
    func pageControlBtnClick(index: Int) {
        scrollView.contentOffset = CGPoint(x: screenWidth * CGFloat(index), y: 0)
    }
}

extension ZLMyDepositViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if pageHeader.btnArray.count > 0 {
            let btArr = pageHeader.btnArray
            for i in 0..<btArr.count {
                if let btn = btArr[i] as? UIButton {
                    if btn.isSelected {
                        btn.isSelected = false
                    }
                }
            }
            UIView.animate(withDuration: 0.2) {
                let index: Int = Int(scrollView.contentOffset.x / screenWidth);
                if let btn = btArr[index] as? UIButton {
                    btn.isSelected = true
                    self.pageHeader.lineV.center.x = btn.center.x
                }
            }
           
            
        }
    }

}
