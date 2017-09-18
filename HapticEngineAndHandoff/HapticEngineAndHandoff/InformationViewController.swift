//
//  ViewController.swift
//  HapticEngineAndHandoff
//
//  Created by Rachaus on 17/09/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import UIKit
import WatchConnectivity

class InformationViewController: UIViewController, NSUserActivityDelegate {

    @IBOutlet weak var informationLabel: UILabel!
    
    var haptic: String?
  
    var session: WCSession!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        informationLabel.text = returnTextForHaptic()
      
        if WCSession.isSupported() {
          session = WCSession.default()
          session.delegate = self
          session.activate()
        }
      
        let message = ["Text":returnTextForHaptic()]
        session.sendMessage(message, replyHandler: nil, errorHandler: nil)
        let activity = NSUserActivity(activityType: "it.iachieved.hapticengineandhandoff.viewing.text")
        activity.title = "Viewing"
        activity.userInfo = ["teste":returnTextForHaptic()]
        self.userActivity = activity
        self.userActivity?.becomeCurrent()
    
    }
    
    func returnTextForHaptic() -> String {
        
        switch haptic! {
        case "Start":
            return "Indicates the beginning of an action. For example, a stopwatch app uses this haptic when the user starts the stopwatch."
            
        case "Stop":
            return "Indicates the end of an action. For example, a stopwatch app uses this haptic when the user stops the stopwatch."
            
        case "Click":
            return "Indicates a simple click type of feedback. Use this haptic to mark fixed points along a path. Space out the intervals at which you play the haptic rather than playing it several times in quick succession."
            
        case "Notification":
            return "Alerts the user to an arrived notification when the Watch app is not running in the foreground."
            
        case "DirectionUp":
            return "Indicates an increase in a specific value or when a value has gone above a certain threshold. For example, you could use this feedback when adjusting the value of a thermostat."
            
        case "DirectionDown":
            return "Indicates a decrease in a specific value or when a value has gone below a certain threshold. For example, you could use this feedback when adjusting the value of a thermostat."
            
        case "Success":
            return "Indicates the successful completion of a task or the answering of a question."
            
        case "Failure":
            return "Indicates the failed completion of a task or answering of a question."
            
        case "Retry":
            return "Indicates that the user should retry a task that temporarily failed."
            
        default:
            print("Nenhum dos casos")
        }
        
        return ""
    }
  
  override func restoreUserActivityState(_ activity: NSUserActivity) {
    self.informationLabel.text = activity.userInfo?["teste"] as? String
  }

}

extension InformationViewController : WCSessionDelegate {
  
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
  }
  
  func sessionDidBecomeInactive(_ session: WCSession) {
    
  }
  
  func sessionDidDeactivate(_ session: WCSession) {
    
  }
  
}







