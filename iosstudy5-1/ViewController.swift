//
//  ViewController.swift
//  iosstudy5-1
//
//  5주차 실습
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var mButton: UIButton!
    @IBOutlet var lButton: UIButton!
    @IBOutlet var dButton: UIButton!
    @IBOutlet var cButton: UIButton!
    @IBOutlet var priceButton: UIButton!
    
    var sizeup = 3000
    var dough = 4500
    var corn = 700
    var price = 20000
    
    var mclick = true
    var lclick = false
    var dclick = false
    var cclick = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = headerView.bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.4]
        gradientLayer.opacity = 0.4
        headerView.layer.addSublayer(gradientLayer)
        
    }
    
    func numberFormatter(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: price))!
        return result
    }
    
    @IBAction func mClick(_ sender: Any) {
        
        if mclick == false {
            mclick = true
            lclick = false
            mButton.setImage(UIImage(systemName: "dot.circle.fill"), for: .normal)
            lButton.setImage(UIImage(systemName: "circle"), for: .normal)
            price = price - sizeup
            priceButton.setTitle(numberFormatter(price: price)+"원 담기", for: .normal)
        }
    }
    
    @IBAction func lClick(_ sender: Any) {
        
        if lclick == false {
            mclick = false
            lclick = true
            mButton.setImage(UIImage(systemName: "circle"), for: .normal)
            lButton.setImage(UIImage(systemName: "dot.circle.fill"), for: .normal)
            price = price + sizeup
            priceButton.setTitle(numberFormatter(price: price)+"원 담기", for: .normal)
        }
    }
    
    @IBAction func dClick(_ sender: Any) {
        
        if dclick == false {
            dclick = true
            dButton.setImage(UIImage(systemName: "square.inset.filled"), for: .normal)
            price = price + dough
        }
        else {
            dclick = false
            dButton.setImage(UIImage(systemName: "square"), for: .normal)
            price = price - dough
        }
        priceButton.setTitle(numberFormatter(price: price)+"원 담기", for: .normal)
    }
    
    @IBAction func cClick(_ sender: Any) {
        
        if cclick == false {
            cclick = true
            cButton.setImage(UIImage(systemName: "square.inset.filled"), for: .normal)
            price = price + corn
        }
        else {
            cclick = false
            cButton.setImage(UIImage(systemName: "square"), for: .normal)
            price = price - corn
        }
        priceButton.setTitle(numberFormatter(price: price)+"원 담기", for: .normal)
    }
    
    @IBAction func orderButton(_ sender: Any) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        secondViewController.size = mclick
        secondViewController.dough = dclick
        secondViewController.corn = cclick
        secondViewController.price = price
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true, completion: nil)

    }
    
}

