//
//  SendSignatureDataViewModel.swift
//  Attedance Class
//
//  Created by Rangga Senatama Putra on 19/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import UIKit

public class SendSignatureDataViewModel {
    var nrp: String!
    var password: String!
    var signature: UIImage!
    
    init(_nrp: String, _password: String, _signature: UIImage) {
        self.nrp = _nrp
        self.password = _password
        self.signature = _signature
    }
}
