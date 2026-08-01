// Distribution.Space.swift
// Space distribution strategies used by `Distribution`.

extension Distribution {
    /// Strategies for distributing remaining space among items.
    ///
    /// Use space distribution strategies to create different visual spacing patterns.
    /// `between` creates gaps only between items, `around` adds breathing room around each item,
    /// and `evenly` ensures uniform spacing throughout including edges.
    ///
    /// ## Example
    ///
    /// ```swift
    /// let justified: Distribution.Space = .between
    /// let balanced: Distribution.Space = .around
    /// let uniform: Distribution.Space = .evenly
    ///
    /// // Visual comparison with three items:
    /// // .between: [A     B     C]  // Gaps between only
    /// // .around:  [ A    B    C ]  // Half-space at edges
    /// // .evenly:  [  A   B   C  ]  // Full space everywhere
    /// ```
    public enum Space: Sendable, Hashable, CaseIterable {
        /// Distributes space only between items, leaving no space at container edges.
        case between

        /// Distributes equal space around each item, resulting in half-space at edges.
        case around

        /// Distributes space evenly between items and at both container edges.
        case evenly
    }
}

#if !hasFeature(Embedded)
    extension Distribution.Space: Codable {}
#endif
