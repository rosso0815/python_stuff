"""Tbd."""

from dataclasses import dataclass


@dataclass(frozen=True)
class DataCheck:
    name: str


class Checker:
    """Tbd."""

    def __init__(self, comment: str) -> None:
        """Tbd."""
        self.comment: str = comment

    def info(self) -> None:
        """Tbd."""
        print(f"comment: {self.comment}")


def hello(c: Checker) -> None:
    """Tbd."""
    dc = DataCheck(name="andreas")
    print(f"dc: {dc}")
    print("done")


c = Checker("comment 1")
hello(c)
print(
    "kjfwe f jkfhkwejfh  kewjfhkejfh kejf kejfhkejwhr kejwrhh    ewkjthkjrth erkjth   qerkjthkqejr   erkjhkerjth  ekrtjh t "
)
