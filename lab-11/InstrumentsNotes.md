
# Instruments Exploration Notes

## 1. Time Profiler
Purpose:
Identifies functions and methods consuming CPU time.

Planned observation:
Inspect CPU usage while scrolling the Course Explorer list and opening course details.

Execution status: Not performed.

## 2. Allocations
Purpose:
Tracks memory allocations and object lifetimes.

Planned observation:
Observe memory allocations while navigating between the course list and detail screens.

Execution status: Not performed.

## 3. Leaks
Purpose:
Helps identify memory leaks and objects that remain allocated unexpectedly.

Planned observation:
Check whether objects remain retained after navigating away from screens.

Execution status: Not performed.

## Evidence Status

- Instruments screenshots: Pending.
- Exported trace: Pending.
- Actual CPU measurements: Pending.
- Actual memory measurements: Pending.

## Environment Limitation

The current development system is Windows and does not have Xcode or Apple Instruments.

No profiling screenshot or trace has been fabricated.

## Final Note

The profiling tools and their intended use have been documented. Actual profiling must be completed on a Mac with Xcode before reporting measured performance results.
