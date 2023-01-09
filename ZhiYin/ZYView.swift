//
//  ZYView.swift
//  ZhiYin
//
//  Created by 王小劣 on 2023/1/10.
//

import SwiftUI

struct ZYView: View {
    @StateObject var cpuInfo = CpuUsage()
    @State var image = 0
    @State var imageName = "sssss163"
    @State var flag = false

    let imageNum = 17

    var body: some View {
        let timer = Timer.publish(every: TimeInterval(cpuInfo.cuse), on: .main, in: .common).autoconnect()
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 22, height: 22)
                .onReceive(timer) { _ in
                    if image == 16 || image == 0 {
                        flag.toggle()
                    }
                    image = flag ? (image + 1) % imageNum : (image - 1) % imageNum
                    imageName = "sssss\(image + 163)"
                }
        }
    }
}
