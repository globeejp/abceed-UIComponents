import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel

    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            ForEach(0..<2) { n in
                Button {
                    viewModel.onTap(at: n)
                } label: {
                    Row(number: n)
                }
            }
        }
    }
}

struct Row: View {
    var number: Int

    var body: some View {
        Text("\(number)")
            .font(.system(.subheadline))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .multilineTextAlignment(.leading)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: .init())
    }
}
