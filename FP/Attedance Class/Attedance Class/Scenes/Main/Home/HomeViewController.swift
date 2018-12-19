//
//  HomeViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 10/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import ChameleonFramework
import KTSnackBar
import Device

class HomeViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var botView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var user: UserModel!
    fileprivate var snackBar: KTSnackBar?
    let connection = ConnectionUtil.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isReachableConnection()
        isUserLogin()
        initCollectionCell()
        configUI()
    }
    
    func isUserLogin() {
        if user == nil {
            performSegue(withIdentifier: "Login", sender: self)
        }
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

extension HomeViewController {
    func isReachableConnection() {
        ConnectionUtil.isUnreachable { networkManagerInstance in
            print("aduh dek rara")
            self.messageConnection()
        }
        connection.reachability.whenUnreachable = { _ in
            self.messageConnection()
        }
        connection.reachability.whenReachable = { _ in
            self.snackBar?.dismiss()
        }
    }
    
    func messageConnection() {
        self.snackBar = KTSnackBar()
        self.snackBar?.show(buttonText: "Lost connection")
        self.snackBar?.pressedBlock = {
            ConnectionUtil.isUnreachable { networkManagerInstance in
                self.messageConnection()
            }
        }
    }
}

extension HomeViewController: isAbleToReceiveData {
    func pass(user: UserModel) {
        self.user = UserModel(_nrp: user.nrp, _password: user.password)
        print(self.user.nrp)
    }
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let loginViewController = segue.destination as? LoginViewController {
            loginViewController.delegate = self
        } else if segue.identifier == "AttendanceClass" {
            print("AttendanceClass")
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func initCollectionCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell",for: indexPath) as! HomeCollectionViewCell
        
        cell = shadowCell(cell: cell)
        
        if indexPath.row == 0 {
            cell.imageView.image = UIImage(named: "icon-attendance")
            cell.nameLabel.text = "Attendance Class"
        } else if indexPath.row == 1 {
            cell.imageView.image = UIImage(named: "icon-sendimg")
            cell.nameLabel.text = "Send Image"
        } else if indexPath.row == 2 {
            cell.imageView.image = UIImage(named: "icon-train")
            cell.nameLabel.text = "Train Image"
        } else if indexPath.row == 3 {
            cell.imageView.image = UIImage(named: "icon-predict")
            cell.nameLabel.text = "Predict Image"
        } else if indexPath.row == 4 {
            cell.imageView.image = UIImage(named: "icon-sendsignature")
            cell.nameLabel.text = "Send Signature"
        } else if indexPath.row == 5 {
            cell.imageView.image = UIImage(named: "icon-trainsignature")
            cell.nameLabel.text = "Train Signature"
        } else {
            cell.imageView.image = UIImage(named: "icon-predictsignature")
            cell.nameLabel.text = "Predict Signature"
        }
        
        cell.backgroundColor = UIColor.white
        // Configure the cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var targetView: String = ""
        if indexPath.row == 0 {
            targetView = "AttendaceClass"
        } else if indexPath.row == 1 {
            targetView = "SendImage"
        } else if indexPath.row == 2 {
            targetView = "TrainData"
        } else if indexPath.row == 3 {
            targetView = "PredictImage"
        } else {
            targetView = "SendSignature"
        }
        performSegue(withIdentifier: targetView, sender: self)
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