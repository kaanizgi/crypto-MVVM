//
//  CryptoViewModel.swift
//  cryptoMVVM
//
//  
//

import Foundation


struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
}

struct CryptoViewModel {
    let crytpoCurrency: CryptoCurrency
}

extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
         return self.cryptoCurrencyList.count
     }
     
     func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
         let crypto = self.cryptoCurrencyList[index]
         return CryptoViewModel(crypto)
     }
}


extension CryptoViewModel {
    init(_ crypto: CryptoCurrency) {
        self.crytpoCurrency = crypto
    }
    
    var name: String {
        return self.crytpoCurrency.currency
    }
    
    var price: String {
        return self.crytpoCurrency.price
    }
}

