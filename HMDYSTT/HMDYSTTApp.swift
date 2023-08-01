//
//  HMDYSTTApp.swift
//  HMDYSTT
//
//  Created by Амир Кайдаров on 8/1/23.
//

import SwiftUI

@main
struct HMDYSTTApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
