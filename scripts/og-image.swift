// Draws the 1200x630 social preview. Run: swift scripts/og-image.swift <app-icon-1024.png> <out.png>
import AppKit

let icon = NSImage(contentsOfFile: CommandLine.arguments[1])!
let output = CommandLine.arguments[2]
let size = NSSize(width: 1200, height: 630)

func color(_ hex: UInt32, _ alpha: CGFloat = 1) -> NSColor {
    NSColor(srgbRed: CGFloat((hex >> 16) & 0xFF) / 255, green: CGFloat((hex >> 8) & 0xFF) / 255, blue: CGFloat(hex & 0xFF) / 255, alpha: alpha)
}

let rep = NSBitmapImageRep(
    bitmapDataPlanes: nil, pixelsWide: Int(size.width), pixelsHigh: Int(size.height),
    bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
    colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0
)!
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)

NSGradient(colors: [color(0xFFF9F1), color(0xF7EADB), color(0xEFDCC4)], atLocations: [0, 0.6, 1], colorSpace: .sRGB)!
    .draw(in: NSRect(origin: .zero, size: size), angle: -90)
let glow = NSPoint(x: 300, y: 315)
NSGradient(colors: [color(0xFFFFFF, 0.9), color(0xFFFFFF, 0)])!
    .draw(fromCenter: glow, radius: 0, toCenter: glow, radius: 300, options: [])

icon.draw(in: NSRect(x: 80, y: 95, width: 440, height: 440))

// y is the bottom of the line, AppKit's origin is bottom-left
func line(_ string: String, size fontSize: CGFloat, weight: NSFont.Weight, color textColor: NSColor, x: CGFloat, y: CGFloat) {
    NSAttributedString(string: string, attributes: [
        .font: NSFont.systemFont(ofSize: fontSize, weight: weight),
        .foregroundColor: textColor,
    ]).draw(at: NSPoint(x: x, y: y))
}

line("Macaffeine", size: 80, weight: .bold, color: color(0x3B2014), x: 556, y: 350)
line("Keep your Mac awake", size: 44, weight: .medium, color: color(0x6B3F24), x: 560, y: 285)
line("while you're away.", size: 44, weight: .medium, color: color(0x6B3F24), x: 560, y: 232)
line("Free & open source menu bar app for macOS", size: 25, weight: .regular, color: color(0x8A5A38), x: 562, y: 170)

NSGraphicsContext.restoreGraphicsState()
try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: output))
