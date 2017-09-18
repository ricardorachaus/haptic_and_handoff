//
//  InterfaceController.swift
//  HapticEngineAndHandoff WatchKit Extension
//
//  Created by Rachaus on 17/09/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, NSUserActivityDelegate {
  
    @IBOutlet var myLabel: WKInterfaceLabel!
    var session: WCSession!
    var textInfo = "Teste"
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
      
        myLabel.setAlpha(0)
      
        invalidateUserActivity()
        if WCSession.isSupported() {
          session = WCSession.default()
          session.delegate = self
          session.activate()
        }
      
    }
  
    override func willActivate() {
      super.willActivate()
      
      
      
    }
  
}

extension InterfaceController : WCSessionDelegate {
  
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
  }
  
  func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    let text = message["Text"] as! String
    myLabel.setAlpha(1)
    myLabel.setText(text)
    textInfo = text
    
    self.updateUserActivity("it.iachieved.hapticengineandhandoff.viewing.text", userInfo: ["info":textInfo], webpageURL: nil)
    
  }
  
  override func updateUserActivity(_ type: String, userInfo: [AnyHashable : Any]? = nil, webpageURL: URL?) {
    
  }

  
}
