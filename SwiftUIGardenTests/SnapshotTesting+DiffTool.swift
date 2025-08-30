// geotrainer App
// Copyright © 2025 Ralf Ebert – Alle Rechte vorbehalten.

import SnapshotTesting

public extension SnapshotTestingConfiguration.DiffTool {
    static let checkDiff = Self {
        "check-diff \($0) \($1)"
    }
}
