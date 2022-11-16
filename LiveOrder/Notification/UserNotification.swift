//
//  UserNotification.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import UIKit
import UserNotifications

class UserNotification: NSObject {
    private let userNotificationCenter = UNUserNotificationCenter.current()
    private let app = UIApplication.shared

    func requestAuthorization() async {
        do {
            let authorization = try await userNotificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
            if authorization {
                print("Push Notification is Authorization")
                await app.registerForRemoteNotifications()
                userNotificationCenter.delegate = self
            } else {
                print("Push Notification is No Authorization")
            }
        } catch {
            print("Error in authorization: \(error.localizedDescription)")
        }
    }
}

extension UserNotification: UNUserNotificationCenterDelegate {
    @MainActor func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let body = response.notification.request.content.body
        print("Data body: \(body)")
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.sound, .badge]
    }
}
