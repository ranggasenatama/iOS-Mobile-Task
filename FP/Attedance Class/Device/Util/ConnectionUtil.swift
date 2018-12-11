//
//  ConnectionUtil.swift
//  Device
//
//  Created by Rangga Senatama Putra on 11/12/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import Foundation
import Reachability

public class ConnectionUtil: NSObject {
    
    public var reachability: Reachability!
    
    // Create a singleton instance
    public static let sharedInstance: ConnectionUtil = { return ConnectionUtil() }()
    
    
    public override init() {
        super.init()
        
        // Initialise reachability
        reachability = Reachability()!
        
        // Register an observer for the network status
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkStatusChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
        
        do {
            // Start the network status notifier
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    @objc public func networkStatusChanged(_ notification: Notification) {
        // Do something globally here!
    }
    
    public static func stopNotifier() -> Void {
        do {
            // Stop the network status notifier
            try (ConnectionUtil.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    
    // Network is reachable
    public static func isReachable(completed: @escaping (ConnectionUtil) -> Void) {
        if (ConnectionUtil.sharedInstance.reachability).connection != .none {
            completed(ConnectionUtil.sharedInstance)
        }
    }
    
    // Network is unreachable
    public static func isUnreachable(completed: @escaping (ConnectionUtil) -> Void) {
        if (ConnectionUtil.sharedInstance.reachability).connection == .none {
            completed(ConnectionUtil.sharedInstance)
        }
    }
    
    // Network is reachable via WWAN/Cellular
    public static func isReachableViaWWAN(completed: @escaping (ConnectionUtil) -> Void) {
        if (ConnectionUtil.sharedInstance.reachability).connection == .cellular {
            completed(ConnectionUtil.sharedInstance)
        }
    }
    
    // Network is reachable via WiFi
    public static func isReachableViaWiFi(completed: @escaping (ConnectionUtil) -> Void) {
        if (ConnectionUtil.sharedInstance.reachability).connection == .wifi {
            completed(ConnectionUtil.sharedInstance)
        }
    }
}
