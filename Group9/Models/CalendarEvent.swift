//
//  CalendarEvent.swift
//  Group9
//
//  Created by Ridwan Abdurrasyid on 28/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import Foundation
import UIKit
import EventKit
import EventKitUI

class CalendarEvent : NSObject{
    static let instance  = CalendarEvent()

    func allowAccess (store : EKEventStore) -> Bool{
        var authorized = false
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            authorized = true
        case .denied:
            print("Access denied")
        case .notDetermined:
            store.requestAccess(to: .event, completion:
                {[weak self] (granted: Bool, error: Error?) -> Void in
                    if granted {
                        authorized = true
                    } else {
                        print("Access denied")
                    }
            })
        default:
            print("Case default")
        }
        return authorized
    }
}
