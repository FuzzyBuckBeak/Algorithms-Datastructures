//
// Graphs - Adjacency List.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 2/20/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
The first graph implementation that you’ll learn uses an adjacency list.
 For every vertex in the graph, the graph stores a list of outgoing edges.
*****************************************************************************************************************************/

import Foundation

public enum EdgeType {
    case directed
    case undirected
}

struct Vertex<T> {
    public let index: Int
    public let data: T
}

struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}

protocol Graph {
    associatedtype T
    func createVertex(data: T) -> Vertex<T>
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?)
    func addUnDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?)
    func add(edgeType: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?)
    func edges(from source: Vertex<T>) -> [Edge<T>]
    func weight(from source:Vertex<T>, to destination: Vertex<T>) -> Double?
}

extension Vertex: Equatable where T: Equatable { }
extension Vertex: Hashable where T: Hashable { }

class AdjacencyList<T: Hashable>: Graph {
    var adjacencies: [Vertex<T>:[Edge<T>]] = [:]
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    func addUnDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    func add(edgeType: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch edgeType {
        case .directed: addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected: addUnDirectedEdge(from: source, to: destination, weight: weight)
        }
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source).filter { $0.destination == destination }.first?.weight
    }
}

extension AdjacencyList: CustomStringConvertible {
    var description: String {
        var result: String = ""
        for (vertex, edges) in adjacencies {
            let edgeString = edges.map { "\($0.destination.data)" }
            var edges = edgeString.joined(separator: ",")
            if edges.isEmpty { edges = "No Outgoing"}
            result.append("\(vertex.data) -> \(edges)\n")
        }
        return result
    }
}
