
# Performance Investigation

## Area Selected
Course Explorer list rendering.

## Potential Issue
The CourseExplorerView currently declares courses using a computed property:

    private var courses: [Course] {
        Course.sampleCourses
    }

This property is accessed when the view body is evaluated.

Repeated evaluation is a possible area to inspect, but it has not been confirmed as a performance problem.

## Investigation Method

Use Time Profiler while repeatedly scrolling the Course Explorer list.

Check:
- CPU time during list rendering.
- Repeated calls related to view updates.
- Whether list rendering contributes significantly to CPU usage.

Use Allocations to observe memory allocations during the same workload.

## Proposed Targeted Improvement

Use an immutable stored property instead:

    private let courses = Course.sampleCourses

This makes the course collection reference explicit and avoids repeatedly evaluating the computed property.

## Measurement Status

Before change: Not measured.

After change: Not measured.

Performance improvement: Not established.

The proposed change is a code-level cleanup. No measurable performance gain is claimed without Instruments evidence.

## Conclusion

A possible area for investigation has been identified. Actual profiling is required to determine whether it has a meaningful performance impact.
