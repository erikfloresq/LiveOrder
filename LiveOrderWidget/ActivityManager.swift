//
//  ActivityManager.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import Foundation
import ActivityKit

class ActivityManager {
    var orderActivity: Activity<LiveOrderWidgetAttributes>?

    func request(step: OrderStep = .started) {
        let attributes = LiveOrderWidgetAttributes(restaurant: "Weriklandia")
        let initialState = LiveOrderWidgetAttributes.ContentState(step: step.rawValue)

        do {
            orderActivity = try Activity.request(attributes: attributes,
                                                 contentState: initialState,
                                                 pushType: .token)
            if let orderActivity = orderActivity {
                print("orderActivity \(orderActivity.id)")
                Task {
                    let tokenUpdates = orderActivity.pushTokenUpdates.makeAsyncIterator()
                    await tokenUpdates.next().map { data in
                        print("tokenUpdates data \(DeviceToken(data: data).hexString)")
                    }
                }
            }
            
        } catch(let error) {
            print("Error in request: \(error.localizedDescription)")
        }
    }

    func update(step: OrderStep = .inProgress) {
        let newState = LiveOrderWidgetAttributes.ContentState(step: step.rawValue)
        Task {
            let alertConfiguration = AlertConfiguration(title: "Delivery Update", body: "Your pizza order will arrive in 25 minutes.", sound: .default)
            await orderActivity?.update(using: newState, alertConfiguration: alertConfiguration)
        }
    }

    func end(step: OrderStep = .completed){
        let endState = LiveOrderWidgetAttributes.ContentState(step: step.rawValue)
        Task {
            await orderActivity?.end(using: endState, dismissalPolicy: .default)
        }
    }
}
