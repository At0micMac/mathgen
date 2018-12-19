//
//  main.swift
//  mathgen
//
//  Created by Cole on 12/18/18.
//  Copyright © 2018 at0mic. All rights reserved.
//

import Foundation
let fileManager = FileManager.default

// important variables
var randomize = false





// argument handling
for argument in CommandLine.arguments {
	switch argument {
	case "-r":
		randomize = true
	case "-h":
		showHelp()
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


// make sure max isnt nil, if it is set to 100


// do the math
print("processing \(max) lines")
var out = adder(min: 0, max: max)


// make outfile into a string fit for fileManager.fileExists

var outDir = fileManager.currentDirectoryPath
var outFile = "/output.txt"

fileOut(dir: outDir, fileName: outFile)

