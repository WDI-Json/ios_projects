import UIKit
import SwiftUI

let colorArray = [
    "#e51c23",
    "#e91e63", //<- WD
    "#9c27b0",
    "#673ab7",
    "#3f51b5",
    "#5677fc",
    "#03a9f4",
    "#00bcd4",
    "#009688",
    "#259b24",
    "#8bc34a",
    "#afb42b",
    "#ff9800",
    "#ff5722",
    "#795548",
    "#607d8b"
];

let defaultColors = [
    //             Color("BlueGray"), Color("BrightGreen"), Color("BrightOrange"),
    //             Color("BrightRed"), Color("Brown"), Color("Cyan"),
    //             Color("DarkPurple"), Color("defBlue1"), Color("defBlue2"),
    //             Color("defBlue3"), Color("Pink"), Color("Olive"),
    //             Color("defGreen"), Color("defOrange"), Color("Purple"),
    //             Color("Aqua")
    Color(hex: "#e51c23"),
    Color(hex: "#e91e63"), //<- WD
    Color(hex: "#9c27b0"),
    Color(hex: "#673ab7"),
    Color(hex: "#3f51b5"),
    Color(hex: "#5677fc"),
    Color(hex: "#03a9f4"),
    Color(hex: "#00bcd4"),
    Color(hex: "#009688"),
    Color(hex: "#259b24"),
    Color(hex: "#8bc34a"),
    Color(hex: "#afb42b"),
    Color(hex: "#ff9800"),
    Color(hex: "#ff5722"),
    Color(hex: "#795548"),
    Color(hex: "#607d8b")
]

//print(getColorObject(name: "Jeffrey spring int veld")); //#e91e63
print(getColorFromString(name: "Wouter Dijks", colors: colorArray))
//print(getColorFromString(value: "CH", colors: colorArray));

func getColorObject(name: String) -> Color {
    let hexcode = getColorFromString(name: name, colors: colorArray)
    for (index, color) in defaultColors.enumerated() {
        if let colorHex = color?.toHex() {
            if colorHex == hexcode {
                print("Match between colorHex \(colorHex) and \(color?.toHex() ?? "")")
            }
        }
    }
    return .gray
}

//https://stackoverflow.com/q/74178538/13440357
func getColorFromString(name: String, colors: [String]) -> String {
    var hash = 0;
    let count = colors.count;
    let nameAsUnicode = name.unicodeScalars

    for unicode in nameAsUnicode {
        var bitShift = ((hash << 5) - hash)
        hash = Int(unicode.value) + bitShift;
    }
    hash = ((hash % count) + count) % count;
    return colors[Int(hash)];
}

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }

    func toHex() -> String? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if a != Float(1.0) {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

let string  = "QHChLUHDMNh5UTBUcgtLmlPziN42"
print(string.djbHash())
extension String {
    public func djbHash() -> Int {
        return self.utf16
            .map {return $0}
            .reduce(5381) {
                let h = ($0 << 5) &+ $0 &+ Int($1)
                print("h", h)
                return h
            }
    }
}
print(gethash(string: "QHChLUHDMNh5UTBUcgtLmlPziN42"))
func gethash(string: String) -> Int {
    var hash = 5381; // our hash

    let count = string.count;
    let nameAsUnicode = string.utf16

    for unicode in nameAsUnicode {
        var bitShift = ((hash << 5) &+ hash )
        hash = Int(unicode) + bitShift;
    }
    return hash;
}
//var djbHash = function (string) {
//    var h = 5381; // our hash
//    var i = 0; // our iterator
//
//    for (i = 0; i < string.length; i++) {
//        var ascii = string.charCodeAt(i); // grab ASCII integer
//        h = (h << 5) + h + ascii; // bitwise operations
//    }
//    return h;

