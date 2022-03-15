//
//  HDAVerbModel.swift
//  ALCPlugFix-Swift
//
//  Created by Nick on 10/14/20.
//

import Foundation

struct HDAVerbModel: Codable, Equatable {
    let enabled: Bool               // 该命令是否应该被执行，覆盖所有条件
    let comment: String?            // 人类可读的命令描述
    let nodeID: String              // 编解码器的节点 ID
    let verb: String                // Verb selector (see hdaverb.h)
    let param: String               // The command for the node
    let onBoot: Bool                // 在启动时发送动词（实际上是在 lauchd 加载时）
    let onShutdown: Bool            // 在关机时发送动词（实际上是在 lauchd 加载时）
    let onWake: Bool                // 当机器从睡眠中唤醒时发送动词
    let onSleep: Bool               // 机器进入睡眠状态时发送动词
    let onConnect: Bool             // 在耳机插头上发送动词
    let onDisconnect: Bool          // 在耳机插头上发送动词
    let onMute: Bool                // 在源静音上发送动词
    let onUnmute: Bool              // 在源上发送动词取消静音

    // For easy decoding
    enum CodingKeys: String, CodingKey {
        case enabled = "Enabled"
        case comment = "Comment"
        case nodeID = "Node ID"
        case verb = "Verb"
        case param = "Param"
        case onBoot = "On Boot"
        case onShutdown = "On Shutdown"
        case onWake = "On Wake"
        case onSleep = "On Sleep"
        case onConnect = "On Connect"
        case onDisconnect = "On Disconnect"
        case onMute = "On Mute"
        case onUnmute = "On Unmute"
    }
}
