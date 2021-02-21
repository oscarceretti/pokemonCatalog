//
//  RechabilityHandler.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 21/02/2021.
//

import Foundation
import SystemConfiguration

class RechabilityHandler {

    private let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")

    // Queue where the `SCNetworkReachability` callbacks run
    private let queue = DispatchQueue.main

    // We use it to keep a backup of the last flags read.
    private var currentReachabilityFlags: SCNetworkReachabilityFlags?

    // Flag used to avoid starting listening if we are already listening
    private var isListening = false

    // Starts listening
    func start(completion: @escaping (Bool) -> ()) {
        // Checks if we are already listening

        guard !isListening else { return }

        // Optional binding since `SCNetworkReachabilityCreateWithName` returns an optional object
        guard let reachability = reachability else { return }

        // Creates a context
        var context = SCNetworkReachabilityContext(version: 0, info: nil, retain: nil, release: nil, copyDescription: nil)
        // Sets `self` as listener object
        context.info = UnsafeMutableRawPointer(Unmanaged<RechabilityHandler>.passUnretained(self).toOpaque())

        let _: SCNetworkReachabilityCallBack? = {
            (reachability:SCNetworkReachability, flags: SCNetworkReachabilityFlags, info: UnsafeMutableRawPointer?) in
            guard let info = info else { return }

            // Gets the `Handler` object from the context info
            let handler = Unmanaged<RechabilityHandler>.fromOpaque(info).takeUnretainedValue()

            DispatchQueue.main.async {
                handler.checkReachability(flags: flags)
            }
        }


        // Runs the first time to set the current flags
        queue.async {
            // Resets the flags stored, in this way `checkReachability` will set the new ones
            self.currentReachabilityFlags = nil

            // Reads the new flags
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(reachability, &flags)
            
            self.checkReachability(flags: flags)
            completion( flags.rawValue > 0 )
        }

        isListening = true
    }

    // Called inside `callbackClosure`
    private func checkReachability(flags: SCNetworkReachabilityFlags) {
        if currentReachabilityFlags != flags {
            // 🚨 Network state is changed 🚨

            // Stores the new flags
            currentReachabilityFlags = flags
        }
    }

    // Stops listening
    func stop() {
        // Skips if we are not listening
        // Optional binding since `SCNetworkReachabilityCreateWithName` returns an optional object
        guard isListening,
            let reachability = reachability
            else { return }

        // Remove callback and dispatch queue
        SCNetworkReachabilitySetCallback(reachability, nil, nil)
        SCNetworkReachabilitySetDispatchQueue(reachability, nil)

        isListening = false
    }
    
}
