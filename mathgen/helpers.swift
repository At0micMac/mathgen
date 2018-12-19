//
//  helpers.swift
//  mathgen
//
//  Created by Cole on 12/18/18.
//  Copyright © 2018 at0mic. All rights reserved.
//

import Foundation

func showHelp() {
	print("Usage: mathgen number -r")
	print("number: the number to count to, default 100")
	print("-r: randomize the list")
	print("-a: do addition list (default if none specified)")
	print("-m: do multiplication list")
	print("-s: do subtraction list")
	print("-all: do all of the lists")
	print("-h: show this help message")
	print("\nsaves (operation name).txt in working directory")
	exit(0)
}


func fileOut(dir: String, fileName: String, data: [String]) {
	
	let outStr = "\(dir)\(fileName)"
	let outURL = Foundation.URL(string: "file://\(outStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)")
	
	if fileManager.fileExists(atPath: outStr) {
		print("File exists, append? [y/n]")
		let ans = readLine()
		if ans == "y" {
			
		} else {                   // creates new filename, loops back around. if exists it keeps counting up
			print("exiting")
			exit(1)
		}
	} else {
		do { try "".write(to: outURL!, atomically: false, encoding: .utf8) }
		catch {
			print("Failed to create file, \(error)")
		}
	}
	// write to end of file
	if let fileUpdater = try? FileHandle(forUpdating: outURL!) {
		// function which when called will cause all updates to start from end of the file
		fileUpdater.seekToEndOfFile()
		// which lets the caller move editing to any position within the file by supplying an offset
		for o in data { fileUpdater.write((o + "\n").data(using: .utf8)!) }
		//Once we convert our new content to data and write it, we close the file and that’s it!
		fileUpdater.closeFile()
	}
}
