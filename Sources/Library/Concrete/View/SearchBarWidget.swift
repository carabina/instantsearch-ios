//
//  SearchBarWidget.swift
//  ecommerce
//
//  Created by Guy Daher on 08/03/2017.
//  Copyright © 2017 Guy Daher. All rights reserved.
//

import Foundation
import InstantSearchCore

@objc public class SearchBarWidget: UISearchBar, SearchableViewModel, ResettableDelegate, AlgoliaWidget, UISearchBarDelegate {
    
    public var searcher: Searcher!
    
    public func setup(with searcher: Searcher) {
        self.searcher = searcher
        delegate = self
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searcher.params.query = searchText
        searcher.search()
    }
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searcher.params.query = ""
        searcher.search()
    }
    
    public func onReset() {
        resignFirstResponder()
        text = ""
    }
}