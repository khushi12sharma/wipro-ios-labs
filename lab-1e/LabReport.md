# Lab 1E: Classes, Structs, ARC, and Memory

## Objective
Understand the difference between value types and reference types and observe how Automatic Reference Counting (ARC) manages class instances.

## 1. Struct and Class Behaviour

A `Course` struct was copied and its copied value was modified. The original course remained unchanged because structs follow value semantics.

A `CourseManager` class instance was assigned to another variable. Changing the manager name through the second variable also changed the value seen through the first variable because both variables refer to the same instance.

## 2. Weak References

Two related classes, `Teacher` and `Classroom`, were created.

- `Classroom` holds a strong reference to `Teacher`.
- `Teacher` holds a weak reference to `Classroom`.
- The weak reference does not increase the classroom's strong reference count.

Both instances were released when their strong references were set to `nil`.

## 3. Strong Reference Cycle and Prevention

A closure stored in `ClosureOwner` captured `self` strongly. This could create a strong reference cycle because the instance owns the closure and the closure owns the instance.

The cycle was prevented by setting the stored closure to `nil` using `breakCycle()`.

A second closure used `[weak self]` in its capture list. This avoided creating a strong reference cycle.

## 4. ARC and Deinitialization

ARC automatically manages the lifetime of class instances by tracking strong references.

The `deinit` methods printed release messages when the instances were deallocated. This helped observe when the objects were released.

## 5. Conclusion

Structs demonstrate value semantics, while classes demonstrate reference semantics. Weak references and weak closure captures help prevent strong reference cycles. ARC releases class instances when their strong references are no longer retained.
