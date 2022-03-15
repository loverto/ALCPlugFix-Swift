//
//  main.swift
//  ALCPlugFix-Swift
//
//  Created by Nick on 10/14/20.
//

import Foundation

private func printHelp() {
    let help = """
    ALCPlugFix for alc-verb (adapted from ALCPlugFix)
    usage:  alc-verb [alc_xxx.plist]
            alc_xxx.plist is a PLIST file containing custom HDA Verb commands
    """

    print(help)
}

private func lockAndLoad() {
    for (index, _) in CommandLine.arguments.enumerated() {
        if CommandLine.arguments.indices.contains(index + 1) {
            let plistFile = CommandLine.arguments[index + 1]
            do {
                try ALCPlugFix(withPlistFile: URL(fileURLWithPath: plistFile)).start()

                // Run forever
                RunLoop.current.run()
            } catch let ex {
                print("Exception in initializing ALCPlugFix\n\(ex.localizedDescription)")
                exit(1)
            }
        }
        break
    }

    // Either the program will keep running or exit, if not, invalid args, print help
    // 程序将继续运行或退出，如果不是，无效参数，打印帮助
    printHelp()
}

lockAndLoad()
