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


func showHelp() {
	print("Usage: mathgen number -r")
	print("number: the number to count to, default 100")
	print("-r: randomize data")
	print("-h: show this help message")
	print("saves output.txt in working directory")
	
}


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

var max: Int? = Int(CommandLine.arguments[2])


// make sure max isnt nil, if it is set to 100
if max != nil {
	_ = 0
} else {
	max = 100
}

// do the math

var output: [String] = []
if let maxed = max {
	for i in 0...maxed {
		for j in 0...maxed {
		output.append("\(i) + \(j) = \(i + j)")
		}
	}
}



// make outfile into a string fit for fileManager.fileExists
var outStr = fileManager.currentDirectoryPath
outStr.append("/output.txt")

var i = 0
while fileManager.fileExists(atPath: outStr) {
	print("file exists, \(outStr)")
	
	print("File exists, append? [y/n]")
	let ans = readLine()
	if ans == "y" {
		print("appends")
	} else {                   // creates new filename, loops back around. if exists it keeps counting up
		print("not appending")
		outStr = "file://\(fileManager.currentDirectoryPath)"
		outStr.append("/output\(i).txt")
		i += 1
		if(i > 10000) {        // prevent looping too many times.
			print("you have too many files!")
			exit(1)
		}
	}
}
outStr = "file://\(outStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)"
print("%%% \(outStr)")
let outURL = Foundation.URL(string: outStr)
print("foundURL \(outURL)")
try "".write(to: outURL!, atomically: false, encoding: .utf8)



// filewriter stuff
if let fileUpdater = try? FileHandle(forUpdating: outURL!) {
	
	// function which when called will cause all updates to start from end of the file
	fileUpdater.seekToEndOfFile()
	
	// which lets the caller move editing to any position within the file by supplying an offset
	for o in output {
		fileUpdater.write((o + "\n").data(using: .utf8)!)
	}
	//Once we convert our new content to data and write it, we close the file and that’s it!
	fileUpdater.closeFile()
}


