import math
import unittest
from dataclasses import dataclass

from cybersamx_test.stats import mean


@dataclass
class StatsTestCase:
    m: list[float]
    expect: float


def compare(a: float, b: float) -> bool:
    epsilon = 0.00001
    return math.fabs(a-b) < epsilon


class TestStats(unittest.TestCase):
    def test_mean(self):
        tcs = [
            StatsTestCase([1, 2, 3, 4], 2.5),
            StatsTestCase([610, 450, 160, 420, 310], 390),
        ]

        for tc in tcs:
            result = mean(tc.m)
            self.assertTrue(compare(result, tc.expect))


if __name__ == '__main__':
    unittest.main()
