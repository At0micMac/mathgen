//
//  main.swift
//  mathgen
//
import Foundation
let fileManager = FileManager.default

// important variables
var randomize = false
var addition = false
var multiply = false
var subtract = false
var divide = false
var opName = "addition"
var outDir = fileManager.currentDirectoryPath

// argument handling
for argument in CommandLine.arguments {
	switch argument {
	case "-r":
		randomize = true
	case "-h":
		showHelp()
	case "-a":
		addition = true
	case "-m":
		multiply = true
	case "-s":
		subtract = true
	case "-d":
		divide = true
	case "-all":
		addition = true
		multiply = true
		subtract = true
		divide = true
	default:
		_ = 0
	}
}
let myPath = Foundation.URL(string: CommandLine.arguments[0])
var max = 0
if let maxFromArgs: Int = Int(CommandLine.arguments[1]) {
	max = maxFromArgs
} else {
	max = 100
}


// do the math
print("processing \(max) lines")

if addition {
	opName = "addition"
	var out = adder(min: 0, max: max)
	let outFile = "/\(opName).txt"
	fileOut(dir: outDir, fileName: outFile, data: out)
	if randomize {
		out.shuffle()
	}
}

if subtract {
	opName = "subtract"
	var out = subtracter(min: 0, max: max)
	let outFile = "/\(opName).txt"
	fileOut(dir: outDir, fileName: outFile, data: out)
	if randomize {
		out.shuffle()
	}
}

if multiply {
	opName = "multiply"
	var out = multiplier(min: 0, max: max)
	let outFile = "/\(opName).txt"
	fileOut(dir: outDir, fileName: outFile, data: out)
	if randomize {
		out.shuffle()
	}
}

if divide {
	opName = "divide"
	var out = divider(min: 0, max: max)
	let outFile = "/\(opName).txt"
	fileOut(dir: outDir, fileName: outFile, data: out)
	if randomize {
		out.shuffle()
	}
}

