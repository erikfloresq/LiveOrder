//
//  AppDelegate.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    let userNotification = UserNotification()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Task {
            await userNotification.requestAuthorization()
        }
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceToken = DeviceToken(data: deviceToken)
        print("deviceToken \(deviceToken.hexString)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Fail register notification \(error)")
    }
}
