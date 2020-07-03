//
//  SearchBar.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 04/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchQuery: String
    @Binding var forceShowCancelButton: Bool
    var onSearchBarClicked: (() -> Void)?
    var textDidChange: ((String) -> Void)?
    var onCancel: (() -> Void)?

    var body: some View {
        HStack {
            SearchBarUIView(text: $searchQuery, forceShowCancelButton: $forceShowCancelButton, onSearchBarClicked: onSearchBarClicked, textDidChange: textDidChange, onCancel: onCancel)
        }
    }
}

struct SearchBarUIView: UIViewRepresentable {
    @Binding var text: String
    @Binding var forceShowCancelButton: Bool
    var onSearchBarClicked: (() -> Void)?
    var textDidChange: ((String) -> Void)?
    var onCancel: (() -> Void)?

    class Coordinator: NSObject, UISearchBarDelegate {
        let text: Binding<String>
        var forceShowCancelButton: Binding<Bool>
        var onSearchBarClicked: () -> Void
        var textDidChange: (String) -> Void
        var onCancel: () -> Void

        init(text: Binding<String>, forceShowCancelButton: Binding<Bool> = .constant(false), onSearchBarClicked: @escaping () -> Void, textDidChange: @escaping (String) -> Void, onCancel: @escaping () -> Void) {
            self.text = text
            self.forceShowCancelButton = forceShowCancelButton
            self.onSearchBarClicked = onSearchBarClicked
            self.textDidChange = textDidChange
            self.onCancel = onCancel
        }

        func updateSearchBarCancelButtonDisplay(_ searchBar: UISearchBar, forcedState: Bool? = nil) {
            if forcedState != nil {
                searchBar.setShowsCancelButton(forcedState!, animated: true)
            } else if forceShowCancelButton.wrappedValue {
                searchBar.setShowsCancelButton(true, animated: true)
            } else {
                searchBar.setShowsCancelButton(!(searchBar.text?.isEmpty ?? true), animated: true)
            }
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text.wrappedValue = searchText
            textDidChange(searchText)

            updateSearchBarCancelButtonDisplay(searchBar)
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            textDidChange(text.wrappedValue)
        }

        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBar.text = ""
            text.wrappedValue = ""
            textDidChange("")
            onCancel()
        }

        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.setShowsCancelButton(true, animated: true)
            updateSearchBarCancelButtonDisplay(searchBar, forcedState: true)
            onSearchBarClicked()
        }

        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            updateSearchBarCancelButtonDisplay(searchBar)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, forceShowCancelButton: $forceShowCancelButton, onSearchBarClicked: {
            self.onSearchBarClicked?()
        }, textDidChange: { searchText in
            self.textDidChange?(searchText)
        }, onCancel: {
            self.onCancel?()
        })
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBarUIView>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.isTranslucent = true
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.clearButtonMode = .never
        searchBar.placeholder = NSLocalizedString("Rechercher", comment: "")
        return searchBar
    }

    func updateUIView(_ searchBar: UISearchBar, context: UIViewRepresentableContext<SearchBarUIView>) {
        searchBar.text = text
        searchBar.setShowsCancelButton(forceShowCancelButton ? true : (!text.isEmpty || searchBar.searchTextField.isFirstResponder), animated: true)
    }
}


extension SearchBar {
    init(searchQuery: Binding<String>) {
        _searchQuery = searchQuery
        _forceShowCancelButton = .constant(false)
    }
}
