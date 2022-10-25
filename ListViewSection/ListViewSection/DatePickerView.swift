//
//  DatePickerView.swift
//  ListViewSection
//
//  Created by Wouter on 25/10/2022.
//

import SwiftUI

struct DatePickerView: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Datum")
                .foregroundColor(.gray)
                ZStack {
                    DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .accentColor(.black)
                        .compositingGroup()
                        .scaleEffect(x: 10, y: 1.5)
                        .clipped()
                    SwiftUIWrapper {
                        HStack {
                            Text(selectedDate.formatted())
                            Spacer()
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 18, height: 20)
                        }
                        .padding(16)
                        .background(Color.white)
                    }
                    .padding(.vertical, 32)
                    .fixedSize(horizontal: false, vertical: true)
                    .allowsHitTesting(false)
            }
            .overlay (
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(
                        style: StrokeStyle(lineWidth: 0.5)
                    )
                    .foregroundColor(.black)
            )
        }
    }
}

struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
    let content: () -> T
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: content())
    }
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
