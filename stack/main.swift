//
//  main.swift
//  stack
//
//  Created by Timur Kuashev on 25.10.2019.
//  2019. OpenSource, so do all what you want
//

import Foundation

// MARK: - Memory Usage In Bytes
// Source of this method: https://stackoverflow.com/questions/40991912/how-to-get-memory-usage-of-my-application-and-system-in-swift-by-programatically/40992791
func reportMemory() -> String {
    
    var taskInfo = mach_task_basic_info()
    var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
    let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
            task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
        }
    }

    if kerr == KERN_SUCCESS {
        return String(taskInfo.resident_size)
    }
    else {
        return String(cString: mach_error_string(kerr), encoding: String.Encoding.ascii) ?? "Unknown Error"
    }
    
}

/*
 Usage example:
 
 class TempName {
     var data: String = "Hello"
     init(_ data: String) {
         self.data = data
     }
 }
 
 let stack: Stack = Stack<TempName>()
 //stack.push(data: TempName("Q") )
 //stack.push(data: TempName("W") )
 //stack.push(data: TempName("E") )
 //stack.push(data: TempName("R") )
 //stack.push(data: TempName("T") )
 //stack.push(data: TempName("Y") )
 for i in 0..<stack.counter {
     
     print(stack.topData?.data)
     stack.pop()
     
 }
 
 */
