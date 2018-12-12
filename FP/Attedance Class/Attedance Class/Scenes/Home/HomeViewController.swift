//
//  HomeViewController.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 10/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import ChameleonFramework
import MaterialComponents
import Device
import Reachability

class HomeViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var botView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var user: UserModel!
    
    var workItem: DispatchWorkItem?
    let connection = ConnectionUtil.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isUserLogin()
        isReachableConnection()
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
        workItem?.cancel()
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
            self.messageConnection()
        }
        connection.reachability.whenUnreachable = { reachability in
            self.messageConnection()
        }
    }
    
    func item() {
        workItem = DispatchWorkItem{
            self.viewDidLoad()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: workItem!)
    }
    
    func messageConnection() {
        let messageWithAction = MDCSnackbarMessage()
        let action = MDCSnackbarMessageAction()
        workItem?.cancel()
        messageWithAction.text = "You are offline, Check your connection"
        let actionHandler = {() in
            self.viewDidLoad()
            self.workItem?.cancel()
        }
        action.handler = actionHandler
        action.title = "Retry"
        messageWithAction.action = action
        messageWithAction.duration = 10
        item()
        MDCSnackbarManager.show(messageWithAction)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var targetView: String = ""
        if indexPath.row == 0 {
            targetView = "AttendaceClass"
        } else if indexPath.row == 1 {
            targetView = "SendImage"
        } else if indexPath.row == 2 {
            targetView = "TrainData"
        } else {
            targetView = "PredictImage"
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
