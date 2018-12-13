//
//  ShowAgendaScan.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 28/11/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit
import CoreLocation
import KTSnackBar

class ShowAgendaScan: UIViewController {
    fileprivate var snackBar: KTSnackBar?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.checkServiceGPS()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.snackBar?.dismiss()
    }
    
    func checkServiceGPS() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
            }
        } else {
            messageGPS()
        }
    }
    
    func messageGPS() {
        self.snackBar = KTSnackBar()
        self.snackBar?.show(buttonText: "Location services are not enabled")
        self.snackBar?.pressedBlock = {
            
        }
    }
}
