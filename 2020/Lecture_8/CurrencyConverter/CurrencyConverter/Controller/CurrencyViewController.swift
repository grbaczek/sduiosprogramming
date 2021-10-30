//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Emil Nielsen on 27/10/2020.
//

import UIKit

class CurrencyViewController: UIViewController {

    let session = URLSession(configuration: .default)
    let baseUrl = "https://api.ratesapi.io/api/latest?base="
    let jsonDecoder = JSONDecoder()

    var currencyName = ""
    var currency: Currency?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isHidden = true
        self.tableView.dataSource = self
        fetchCurrencyRates(for: currencyName.uppercased())
    }

    func fetchCurrencyRates(for currency: String) {
        if let url = URL(string: baseUrl + currency) {
            print(url)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {

                    if let error = error {
                        self.showError(description: "Something went wrong. Try again.")
                        print(error.localizedDescription)
                        return
                    }

                    if let response = response as? HTTPURLResponse {
                        print(response.statusCode)
                        if response.statusCode == 400 {
                            self.showError(description: "Invalid currency. Try another.")
                            return
                        }
                    }

                    if let data = data, let currency = try? self.jsonDecoder.decode(Currency.self, from: data) {
                        self.activityIndicator.isHidden = true
                        self.tableView.isHidden = false
                        self.currency = currency
                        self.tableView.reloadData()
                    } else {
                        self.showError(description: "Something went wrong. Try again.")
                    }

                }
            })
            task.resume()

        }
    }

    func showError(description: String) {
        self.activityIndicator.isHidden = true
        let alert = UIAlertController(title: "Error", message: description, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

extension CurrencyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.currency != nil {
            return (currency?.rates.count)!
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as! CurrencyTableViewCell
        if let currency = self.currency {
            let currencyName = Array(currency.rates)[indexPath.item].key
            let rate = Array(currency.rates)[indexPath.item].value
            cell.conversion.text = "\(currencyName) : \(rate)"
        }
        return cell
    }

}
