
# Lab 11: Profiling Plan

## Objective
To investigate application performance and memory usage using Apple Instruments.

## Application Under Test
Course Explorer SwiftUI application.

## Repeatable Workload
1. Launch the application.
2. Open the Course Explorer screen.
3. Wait for the course list to appear.
4. Scroll through the available courses.
5. Open a course detail screen.
6. Return to the course list.
7. Repeat the navigation and scrolling steps.

## Profiling Tools
The following Instruments tools will be explored on a Mac with Xcode:

- Time Profiler: To identify methods consuming CPU time.
- Allocations: To inspect object allocation patterns and memory usage.
- Leaks: To check for memory leaks and retained objects.

## Test Conditions
- Same application build for baseline and comparison.
- Same simulator or physical device.
- Same repeatable workload.
- Close unrelated applications where practical.
- Record device model, iOS version and Xcode version.

## Current Environment

Development system: Windows.

Xcode availability: Not available.

Instruments execution: Not performed.

Baseline measurements: Pending actual profiling.

No CPU or memory measurements have been invented.

## Expected Investigation

Inspect whether unnecessary repeated calculations or excessive view creation occur during list navigation and scrolling.

A targeted improvement will be evaluated only after collecting baseline measurements.

## Evidence Checklist

- [ ] App running on simulator/device.
- [ ] Time Profiler trace.
- [ ] Allocations observation.
- [ ] Baseline measurements.
- [ ] After-change measurements.
- [ ] Comparison screenshots.
