#include <iostream>
#include <cmath>

int IsSquare(const int n) {
  const auto sqrt = std::sqrt(n);
  return sqrt == std::floor(sqrt);
}

int FindM(const int solutions) {
  auto count = 0;
  auto M = 0;
  while (true) {
    for (auto w = 1; w <= M; ++w) {
      for (auto h = w; h <= M; ++h) {
        if (IsSquare(std::pow(w + h, 2) + std::pow(M, 2))) {
          ++count;
        }
      }
    }
    std::cout << "M:" << M << " count:" << count << std::endl;
    if (count > solutions) {
      return M;
    }
    ++M;
  }
}

int main() {
  std::cout << FindM(2000) << std::endl;
  std::cout << FindM(1000000) << std::endl;
}

