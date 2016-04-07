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

enum SortType {
    case System     // 采用系统自带的sort方法
    case Bubble     // 冒泡排序
    case Selection  // 选择排序
    case Insertion  // 插入排序
    case Shell      // 希尔排序
    // ... to be continued
}

/// 学生排序函数，简单打印
/// - parameter students 要排序的学生数组
/// - parameter order 顺序
func sortStudents(students: Array<Student>, sortType: SortType, order: Order) {
    var sortedStudents: Array<Student>
    
    switch sortType {
    case .System: // ----- 系统自带的排序
        sortedStudents = students.sort({
            (student1: Student, student2: Student) -> Bool in
            return student1.avgScore() < student2.avgScore()
        })
    
    case .Bubble: // ----- 冒泡排序
        sortedStudents = students
        var loopsCount = sortedStudents.count
        while loopsCount > 0 {
//            for index in 0 ..< --loopsCount {} // --运算符竟然要弃用了
            for index in 0 ..< loopsCount - 1 {
                if sortedStudents[index].avgScore() > sortedStudents[index + 1].avgScore() {
                    let temp = sortedStudents[index]
                    sortedStudents[index] = sortedStudents[index + 1]
                    sortedStudents[index + 1] = temp
                }
            }
            loopsCount -= 1
        }
    
    case .Selection: // ----- 选择排序
        sortedStudents = students
        var loopsCount = sortedStudents.count
        while loopsCount > 1 { // 最后一次不用判断
            var maxIndex = 0
            for index in 0 ..< loopsCount {
                if sortedStudents[maxIndex].avgScore() < sortedStudents[index].avgScore() {
                    maxIndex = index
                }
            }
            let temp = sortedStudents[loopsCount - 1]
            sortedStudents[loopsCount - 1] = sortedStudents[maxIndex]
            sortedStudents[maxIndex] = temp
            loopsCount -= 1
        }
        
    case .Insertion: // ----- 插入排序
        sortedStudents = students
        var loopsCount = sortedStudents.count
        while loopsCount > 1 { // 最后一次不用判断
            let current = loopsCount - 2 // 避免自己和自己判断
            var insertAt = current
            for index in current + 1 ..< sortedStudents.count {
                if sortedStudents[current].avgScore() > sortedStudents[index].avgScore() {
                    insertAt = index
                }
            }
            
            loopsCount -= 1
            
            if current == insertAt {
                continue
            }
            
            // 插入操作
            let _temp = sortedStudents.removeAtIndex(current)
            sortedStudents.insert(_temp, atIndex: insertAt)
        }
        
    case .Shell: // ----- 希尔排序
        sortedStudents = students
        var gap = sortedStudents.count / 2 // 分组大小

        while gap > 0 {
            for index in gap ..< sortedStudents.count {
                let temp = sortedStudents[index]
                var pos = index
                
                while pos >= gap && sortedStudents[pos - gap].avgScore() > temp.avgScore() {
                    sortedStudents[pos] = sortedStudents[pos - gap]
                    pos -= gap
                }
                sortedStudents[pos] = temp
            }
            gap = gap / 2
        }
    }
    
    // 默认生序，检测到倒序时直接翻转
    if order == Order.DESC {
        sortedStudents = sortedStudents.reverse()
    }
    
    // easily print data here
    for student in sortedStudents {
        print(student.desc())
    }
}

var students: Array<Student> = [
    Student(firstName: "Daniel0", lastName: "Wei", scoreOfEnglish: 70.0, scoreOfMath: 71.1),
    Student(firstName: "Daniel1", lastName: "Wei", scoreOfEnglish: 61.0, scoreOfMath: 72.2),
    Student(firstName: "Daniel2", lastName: "Wei", scoreOfEnglish: 52.0, scoreOfMath: 73.3),
    Student(firstName: "Daniel3", lastName: "Wei", scoreOfEnglish: 63.0, scoreOfMath: 74.4),
    Student(firstName: "Daniel4", lastName: "Wei", scoreOfEnglish: 74.0, scoreOfMath: 75.5),
    Student(firstName: "Daniel5", lastName: "Wei", scoreOfEnglish: 85.0, scoreOfMath: 76.6),
    Student(firstName: "Daniel6", lastName: "Wei", scoreOfEnglish: 76.0, scoreOfMath: 77.7),
    Student(firstName: "Daniel7", lastName: "Wei", scoreOfEnglish: 67.0, scoreOfMath: 78.8),
    Student(firstName: "Daniel8", lastName: "Wei", scoreOfEnglish: 58.0, scoreOfMath: 79.9),
    Student(firstName: "Daniel9", lastName: "Wei", scoreOfEnglish: 49.0, scoreOfMath: 80.0),
    Student(firstName: "DanielX", lastName: "Wei", scoreOfEnglish: 10.0, scoreOfMath: 80.0),
    Student(firstName: "DanielY", lastName: "Wei", scoreOfEnglish: 90.0, scoreOfMath: 80.0)
]

print("------------------ System ------------------")
sortStudents(students, sortType: .System, order: .ASC)
print("------------------ Bubble ------------------")
sortStudents(students, sortType: .Bubble, order: .ASC)
print("------------------ Selection ------------------")
sortStudents(students, sortType: .Selection, order: .ASC)
print("------------------ Insertion ------------------")
sortStudents(students, sortType: .Insertion, order: .ASC)
print("------------------ Shell ------------------")
sortStudents(students, sortType: .Shell, order: .ASC)
