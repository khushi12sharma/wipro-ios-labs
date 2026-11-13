
# Lab 11: Performance Report

## Application
Course Explorer SwiftUI Application

## 1. Test Conditions

- Environment: Windows PC
- Xcode: Not available
- Instruments: Not available
- Simulator/device profiling: Not performed
- Workload: Launch Course Explorer, scroll the course list, open a course detail screen and return.

## 2. Baseline Observation

No baseline CPU or memory measurements were collected because Instruments could not be run.

Potential investigation area: Course list rendering and repeated view updates.

## 3. Identified Area

The courses collection was originally exposed through a computed property in CourseExplorerView.

This is a possible area to investigate, not a confirmed performance issue.

## 4. Proposed Improvement

Consider using an immutable stored property for the sample course collection instead of a computed property.

This is a code-level cleanup. Its performance impact has not been measured.

## 5. After-Change Observation

No after-change measurement was collected.

No CPU-time reduction or memory improvement is claimed.

## 6. Before and After Comparison

| Metric | Before | After |
|---|---|---|
| CPU time | Not measured | Not measured |
| Memory usage | Not measured | Not measured |
| Allocations | Not measured | Not measured |
| Rendering time | Not measured | Not measured |

## 7. Conclusion

The profiling workflow and repeatable workload have been documented. Actual diagnosis and performance comparison remain pending because macOS, Xcode and Instruments are unavailable in the current environment.

A performance gain must not be claimed without measurements.
