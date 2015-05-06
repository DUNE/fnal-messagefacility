#include <vector>

int main()
{
  typedef std::vector<int> ContainerType;

  ContainerType v;
  v.push_back(1);
  v.push_back(2);

  // emplace_back
  v.emplace_back(20);

  // emplace
  v.emplace(v.begin()+1, 10);

  return (v[0] == 1 &&
          v[1] == 10 &&
          v[2] == 2 &&
          v[3] == 20) ? 0 : 1;
}
