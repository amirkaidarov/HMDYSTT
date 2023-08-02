//
//  PreviewData.swift
//  HMDYSTT
//
//  Created by Амир Кайдаров on 8/1/23.
//

import Foundation

var transactionPreviewData = Transaction(id: 1,
                                         date: "01/01/2012",
                                         institution: "Ins",
                                         account: "Acc",
                                         merchant: "Merchant",
                                         amount: 12,
                                         type: "debit",
                                         categoryId: 12,
                                         category: "Cat",
                                         isPending: false,
                                         isTransfer: true,
                                         isExpense: false,
                                         isEdited: true)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
