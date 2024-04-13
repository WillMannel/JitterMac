import Foundation
import AppKit

class MouseJitterManager: ObservableObject {
    private var timer: Timer?
    
    func toggleJitter() {
        if timer == nil {
            startJittering()
        } else {
            stopJittering()
        }
    }
    
    private func startJittering() {
        timer = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(jitterMouse), userInfo: nil, repeats: true)
    }
    
    private func stopJittering() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func jitterMouse() {
        let currentPos = NSEvent.mouseLocation
        let randomX = CGFloat.random(in: -5...5)
        let randomY = CGFloat.random(in: -5...5)
        let newPos = CGPoint(x: currentPos.x + randomX, y: currentPos.y - randomY)
        CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: newPos, mouseButton: .left)?.post(tap: .cghidEventTap)
    }
}
