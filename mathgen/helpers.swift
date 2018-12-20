//
//  helpers.swift
//  mathgen
//
import Foundation

// show help and exit
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
	// outStr to check if file exits, outURL for fileManager
	let outStr = "\(dir)\(fileName)"
	// convert string to URL
	let outURL = Foundation.URL(string: "file://\(outStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)")
	
	// check if file exists
	if fileManager.fileExists(atPath: outStr) {
		print("File exists, append? [y/n]")
		let ans = readLine()
		if ans == "y" {
			// move along
		} else {
			print("exiting")
			exit(1)
		}
	} else {
		// if it doesn't exit, we create it
		do { try "".write(to: outURL!, atomically: false, encoding: .utf8) }
		catch { print("Failed to create file, \(error)") }
	}
	// write to end of file
	if let fileUpdater = try? FileHandle(forUpdating: outURL!) {
		fileUpdater.seekToEndOfFile()    // go to end of file
		for o in data { fileUpdater.write((o + "\n").data(using: .utf8)!) }   // loop over the array
		fileUpdater.closeFile()    // close file
	}
}
