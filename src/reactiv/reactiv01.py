#! /usr/bin/env python3





import rx
import rx.operators as ops

print("start")

source = rx.from_iterable([1, 2, 3, 4])

source.pipe(
    ops.map(lambda i: i - 1),
    ops.filter(lambda i: i % 2 == 0),
).subscribe(
    on_next=lambda i: print("on_next: {}".format(i)),
    on_completed=lambda: print("on_completed"),
    on_error=lambda e: print("on_error: {}".format(e))
)

print("done")