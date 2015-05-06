#include <map>

#include <iostream>
int main()
{
  typedef std::map<int, int> ContainerType;
  typedef std::pair<ContainerType::iterator, bool> EmplaceReturnType;

  ContainerType m;

  // pair move constructor
  EmplaceReturnType aResult = m.emplace(std::make_pair(int(1), int(2)));
  bool aValid = (aResult.second) && ((*(aResult.first)).second == 2);

  // pair converting move constructor
  EmplaceReturnType bResult = m.emplace(std::make_pair(2, 4));
  bool bValid = (bResult.second) && ((*(bResult.first)).second == 4);

  // pair template constructor
  EmplaceReturnType cResult = m.emplace(3, 6);
  bool cValid = (cResult.second) && ((*(cResult.first)).second == 6);

  return (aValid && bValid && cValid) ? 0 : 1;
}
