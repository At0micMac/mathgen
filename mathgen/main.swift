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
// how many lines to generate
var max = 0
if let maxFromArgs: Int = Int(CommandLine.arguments[1]) {
	max = maxFromArgs
} else {
	max = 100  // if it doesn't exist, default is 100
}

print("processing \(max) lines")

// doing the actual math, then shuffe and save to disk
if addition {
	opName = "addition"
	var out = adder(min: 0, max: max)
	let outFile = "/\(opName).txt"
	if randomize {
		out.shuffle()
	}
	fileOut(dir: outDir, fileName: outFile, data: out)
}

if subtract {
	opName = "subtract"
	var out = subtracter(min: 0, max: max)
	let outFile = "/\(opName).txt"
	if randomize {
		out.shuffle()
	}
	fileOut(dir: outDir, fileName: outFile, data: out)
}

if multiply {
	opName = "multiply"
	var out = multiplier(min: 0, max: max)
	let outFile = "/\(opName).txt"
	if randomize {
		out.shuffle()
	}
	fileOut(dir: outDir, fileName: outFile, data: out)
}

if divide {
	opName = "divide"
	var out = divider(min: 0, max: max)
	let outFile = "/\(opName).txt"
	if randomize {
		out.shuffle()
	}
	fileOut(dir: outDir, fileName: outFile, data: out)
}

