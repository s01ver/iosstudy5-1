//
//  SecondViewController.swift
//  iosstudy5-1
//
//  
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var pizzaTableView: UITableView!
    
    var size : Bool!
    var dough : Bool!
    var corn : Bool!
    var price : Int!
    
    var pizzaSizes = [Bool]()
    var pizzaDoughs = [Bool]()
    var pizzaToppings = [Bool]()
    var pizzaPrices = [Int]()
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pizzaSizes.append(size)
        pizzaDoughs.append(dough)
        pizzaToppings.append(corn)
        pizzaPrices.append(price)
        
        pizzaTableView.delegate = self
        pizzaTableView.dataSource = self
        
    }
    
    func numberFormatter(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: price))!
        return result
    }

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaSizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCell", for: indexPath) as! PizzaTableViewCell
                
        cell.pizzaImage.image = UIImage(named: "pizza")
        if pizzaSizes[indexPath.row] == true {
            cell.pizzaSize.text = "∙가격: M (20,000원)"
        }
        else {
            cell.pizzaSize.text = "∙가격: L (23,000원)"
        }
        if pizzaDoughs[indexPath.row] == true {
            cell.pizzaDough.text = "∙도우변경: 크림리치골드 크러스트 (4,500원)"
        }
        if pizzaToppings[indexPath.row] == true {
            cell.pizzaTopping.text = "∙토핑추가: 옥수수(30g) (700원)"
        }
        cell.pizzaPrice.text = numberFormatter(price: pizzaPrices[indexPath.row])+"원"

        return cell
    }
    
}
