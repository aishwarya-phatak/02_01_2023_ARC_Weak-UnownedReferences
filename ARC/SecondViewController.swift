//
//  SecondViewController.swift
//  ARC
//
//  Created by Vishal Jagtap on 03/03/23.
//

import UIKit
class Customer{
    var name : String
    var creditCard : CreditCard?
    init(name: String, creditCard: CreditCard? = nil) {
        print("The init block of customer called")
        self.name = name
        self.creditCard = creditCard
    }
    deinit {
        print("The deinit block of customer called")
    }
}

class CreditCard{
    var number : UInt64
    unowned var customer : Customer             //unowned reference
    
    init(number: UInt64, customer: Customer) {
        print("The init block of Credit Card is called")
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("The deinit block of Credit Card is called")
    }
}
class SecondViewController: UIViewController {

    var customerRef : Customer?
    var creditCardRef : CreditCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerRef = Customer(name: "Pratiksha")
        
        //creditCardRef?.customer = Customer(name: "Pratiksha")
        creditCardRef?.customer = customerRef!
        creditCardRef = CreditCard(number: 12341212, customer: customerRef!)            //customer unowned reference cannot be assigned nil value here
        
        creditCardRef = nil
        customerRef = nil

    }

}
