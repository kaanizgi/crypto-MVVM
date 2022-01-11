//
//  ViewController.swift
//  cryptoMVVM
//
//  Created by Kaan İzgi on 11.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewim: UITableView!
    private var cryptoListViewModel: CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
         func getData() {
                 
            let url = URL(string: "http://json.kaanizgi.com/crypto.json")!
            
            Webservice().downloadCurrencies(url: url) { cryptos in
                
                if let cryptos = cryptos {
                    
                    self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                    
                    DispatchQueue.main.async {
                        self.tableViewim.reloadData()
                    }
                }
            }
        }
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewim.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        
        return cell
    }
}
