//
//  DatePickerView.swift
//  ListViewSection
//
//  Created by Wouter on 25/10/2022.
//

import SwiftUI

//
//  DatePicker.swift
//  Deskie
//
//  Created by Wouter on 18/10/2022.
//

import SwiftUI

struct DatePickerView: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Datum")
                .foregroundColor(.black)
            HStack {
                Text("\(selectedDate.formatted())")
                Spacer()
                ZStack {
                    DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .accentColor(.black)
                    SwiftUIWrapper {
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 18, height: 20)
                    }
                    .allowsHitTesting(false)
                }
                .frame(width: 18, height: 20)
            }
            .padding(16)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(
                        style: StrokeStyle(
                            lineWidth: 0.5
                        )
                    )
                    .foregroundColor(.black)
            }
        }
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

struct SwiftUIWrapper<T: View>: UIViewControllerRepresentable {
    let content: () -> T
    func makeUIViewController(context: Context) -> UIHostingController<T> {
        UIHostingController(rootView: content())
    }
    func updateUIViewController(_ uiViewController: UIHostingController<T>, context: Context) {}
}


struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
