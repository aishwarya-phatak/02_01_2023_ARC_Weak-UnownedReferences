//
//  ViewController.swift
//  ARC
//
//  Created by Vishal Jagtap on 03/03/23.
//

import UIKit
class Student{
    var studentName : String
    var course : Course?                    //by default a strong reference is created if weak or unowned is not used
    //weak var course: Course?              //creating weak reference in swift, so that it can be assigned nil value
    init(studentName: String) {
        print("The course init called")
        self.studentName = studentName
    }
    
    deinit{
        print("The deinit of Course called")
    }
}

class Course{
    var courseName : String
    var student : Student?
    init(courseName: String) {
        print("The init of Student called")
        self.courseName = courseName
    }
    
    deinit{
        print("The deinit of Student called")
    }
}


class ViewController: UIViewController {

    var studentRef : Student?
    var courseRef : Course?
   
    override func viewDidLoad() {
        super.viewDidLoad()
       studentRef = Student(studentName: "Sejal")
        courseRef = Course(courseName: "iOS")
        
        studentRef?.course = courseRef
        courseRef?.student = studentRef
        
        studentRef = nil
        courseRef = nil
        
    }
}
