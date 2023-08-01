//
//  TransactionListViewModel.swift
//  HMDYSTT
//
//  Created by Амир Кайдаров on 8/1/23.
//

import Foundation
import Combine

final class TransactionListViewModel : ObservableObject {
    @Published var transactions : [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        self.getTransactions()
    }
    
    func getTransactions() {
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transaction", error.localizedDescription)
                case .finished:
                    print("Finished fetching transaction")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellables)

    }
}
