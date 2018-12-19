//
//  processors.swift
//  mathgen
//
//  Created by Cole on 12/18/18.
//  Copyright © 2018 at0mic. All rights reserved.
//

import Foundation


func adder(min: Int, max: Int) -> [String] {
	var output: [String] = []
	for i in min...max {
		for j in min...max {
			output.append("\(i) + \(j) = \(i + j)")
		}
	}
	return output
}

func multiplier(min: Int, max: Int) -> [String] {
	var output: [String] = []
	for i in min...max {
		for j in min...max {
			output.append("\(i) * \(j) = \(i * j)")
		}
	}
	return output
}

func subtracter(min: Int, max: Int) -> [String] {
	var output: [String] = []
	for i in min...max {
		for j in min...max {
			output.append("\(i) - \(j) = \(i - j)")
		}
	}
	return output
}

func divider(min: Int, max: Int) -> [String] {
	var output: [String] = []
	for i in min...max {
		for j in min...max {
			output.append("\(i) / \(j) = \(i / j)")
		}
	}
	return output
}
