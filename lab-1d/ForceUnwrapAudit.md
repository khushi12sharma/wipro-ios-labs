# Force Unwrap Audit – Lab 1D

## Objective
Search the Swift source code for force unwraps and use safe optional handling wherever possible.

## Audit Result

File checked: `OptionalsAndUnwrapping.swift`

- No force unwrap operator (`!`) is used.
- `if let` is used to safely unwrap optional values.
- `guard let` handles missing dictionary values.
- Optional chaining (`?.`) safely accesses optional properties.
- Nil-coalescing (`??`) provides a default value when data is missing.
- Empty text input is handled gracefully.

## Conclusion
The source code uses safe optional handling. No force unwraps were found, so no changes were required.
