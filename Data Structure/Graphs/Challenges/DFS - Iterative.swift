//
// Graphs - DFS Iterative.swift
// DataStructures
//
// Created by: FuzzyBuckBeak on 2/20/19
// Copyright © 2018 FuzzyBuckBeak. All rights reserved.

/*****************************************************************************************************************************
DFS Iterative - Implementation
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

class AdjacencyMatrix<T: Hashable>: Graph {
    var vertices: [Vertex<T>] = []
    var weights: [[Double?]] = []
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        for i in 0 ..< weights.count { weights[i].append(nil) }
        weights.append([Double?](repeatElement(nil, count: vertices.count)))
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        weights[source.index][destination.index] = weight
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
        let edgeWeights = weights[source.index]
        var edgesToReturn: [Edge<T>] = []
        
        for (index, weight) in edgeWeights.enumerated() {
            if weight != nil {
                let edge = Edge(source: source, destination: vertices[index] , weight: weight)
                edgesToReturn.append(edge)
            }
        }
        return edgesToReturn
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return weights[source.index][destination.index]
    }

    func dfs(source: Vertex<T>) -> [Vertex<T>] {
        var stack: [Vertex<T>] = []
        var visited: [Vertex<T>] = []
        var pushed: Set<Vertex<T>> = Set()
        
        stack.append(source)
        visited.append(source)
        pushed.insert(source)
        
        outer: while !stack.isEmpty {
            if let top = stack.last {
                let neighbors = edges(from: top)
                guard !neighbors.isEmpty else {
                    stack.removeLast()
                    continue
                }
                for edge in neighbors {
                    if !pushed.contains(edge.destination) {
                        stack.append(edge.destination)
                        pushed.insert(edge.destination)
                        visited.append(edge.destination)
                        continue outer
                    }
                }
            }
            stack.removeLast()
        }
        
        return visited
    }
}
