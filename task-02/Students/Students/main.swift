//
//  main.swift
//  Students
//
//  Created by Daniel Wei on 4/7/16.
//  Copyright © 2016 Daniel Wei. All rights reserved.
//

import Foundation

/// 学生结构
struct Student {
    var firstName: String
    var lastName: String
    var scoreOfEnglish: Float
    var scoreOfMath: Float
    
    func avgScore() -> Float {
        if scoreOfMath < 0 && scoreOfEnglish < 0 {
            // 这里不是很熟悉异常处理。
            print("invalid score")
            return 0
        } else {
            return (scoreOfMath + scoreOfEnglish) / 2
        }
    }
    
    func fullname() -> String {
        return "\(firstName) \(lastName)"
    }
    
    func desc() -> String {
        let avgStr = String(format: "%.2f", avgScore())
        return "Student: \(fullname()), English: \(scoreOfEnglish), Math: \(scoreOfMath), Avg: \(avgStr)"
    }
}

/// 顺序标记
enum Order {
    case ASC    // 生序
    case DESC   // 降序
}

/// 学生排序函数，简单打印
/// - parameter students 要排序的学生数组
/// - parameter order 顺序
func sortStudents(students: Array<Student>, order: Order) {
    let sortedStudents = students.sort({
        (student1: Student, student2: Student) -> Bool in
        switch order {
        case .ASC:
            return student1.avgScore() < student2.avgScore()
        case .DESC:
            return student1.avgScore() > student2.avgScore()
        }
    })
    
    // easily print data here
    for student in sortedStudents {
        print(student.desc())
    }
}

let students: Array<Student> = [
    Student(firstName: "Daniel0", lastName: "Wei", scoreOfEnglish: 70.0, scoreOfMath: 71.1),
    Student(firstName: "Daniel1", lastName: "Wei", scoreOfEnglish: 61.0, scoreOfMath: 72.2),
    Student(firstName: "Daniel2", lastName: "Wei", scoreOfEnglish: 52.0, scoreOfMath: 73.3),
    Student(firstName: "Daniel3", lastName: "Wei", scoreOfEnglish: 63.0, scoreOfMath: 74.4),
    Student(firstName: "Daniel4", lastName: "Wei", scoreOfEnglish: 74.0, scoreOfMath: 75.5),
    Student(firstName: "Daniel5", lastName: "Wei", scoreOfEnglish: 85.0, scoreOfMath: 76.6),
    Student(firstName: "Daniel6", lastName: "Wei", scoreOfEnglish: 76.0, scoreOfMath: 77.7),
    Student(firstName: "Daniel7", lastName: "Wei", scoreOfEnglish: 67.0, scoreOfMath: 78.8),
    Student(firstName: "Daniel8", lastName: "Wei", scoreOfEnglish: 58.0, scoreOfMath: 79.9),
    Student(firstName: "Daniel9", lastName: "Wei", scoreOfEnglish: 49.0, scoreOfMath: 80.0)
]

sortStudents(students, order: Order.ASC)
