//
//  HomeViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 10/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class HomeViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionCell()
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configUI() {
        let colors:[UIColor] = [
            UIColor.flatBlackDark,
            UIColor.flatBlueDark
        ]
        topView.backgroundColor = GradientColor(.topToBottom, frame: view.frame, colors: colors)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func initCollectionCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell",for: indexPath) as! HomeCollectionViewCell
        
        cell = shadowCell(cell: cell)
        
        if indexPath.row == 1 {
            cell.imageView.image = UIImage(named: "icon-sendimg")
            cell.nameLabel.text = "Send Image"
        } else if indexPath.row == 2 {
            cell.imageView.image = UIImage(named: "icon-train")
            cell.nameLabel.text = "Train Data"
        } else if indexPath.row == 3 {
            cell.imageView.image = UIImage(named: "icon-predict")
            cell.nameLabel.text = "Predict Image"
        } else {
            cell.imageView.image = UIImage(named: "icon-attendance")
            cell.nameLabel.text = "Attendance Class"
        }
        
        cell.backgroundColor = UIColor.white
        // Configure the cell
        return cell
    }
    
    func shadowCell(cell: HomeCollectionViewCell) -> HomeCollectionViewCell {
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
}
