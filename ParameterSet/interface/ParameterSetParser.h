#ifndef MessageFacility_ParameterSet_ParameterSetParser_h
#define MessageFacility_ParameterSet_ParameterSetParser_h

///////////////////////////////////////////////////////////////////////////////
//
//
//
///////////////////////////////////////////////////////////////////////////////

#include "ParameterSet/interface/ParameterSet.h"

#include <boost/config/warning_disable.hpp>
#include <boost/spirit/include/qi.hpp>
#include <boost/fusion/include/std_pair.hpp>
#include <boost/any.hpp>

#include <string>
#include <list>

namespace mf 
{

namespace qi = boost::spirit::qi;
namespace ascii = boost::spirit::ascii;
namespace phoenix = boost::phoenix;

template <typename Iterator>
struct PSetParser 
: qi::grammar<Iterator, ascii::space_type>
{

  PSetParser();

  boost::any findPrimaryEntry(std::string const &);
  boost::any findPSetEntry(boost::any const &, std::string const &);
  boost::any findArrayElement(boost::any const &, int);

  void insertPrimaryEntry(std::pair<std::string, boost::any> const & value);
  void insertPSetEntry(ParameterSet &, std::pair<std::string, boost::any> const&);

  ParameterSet getPSet(std::string const & name = "");

  std::vector<std::pair<std::string, boost::any> > PrimaryValues;

  qi::rule<Iterator, ascii::space_type> doc;
  qi::rule<Iterator, std::pair<std::string, boost::any>(), 
           ascii::space_type> assign;
  qi::rule<Iterator, ParameterSet(), ascii::space_type> pset;
  qi::rule<Iterator, std::string(), ascii::space_type> key;
  qi::rule<Iterator, std::string(), ascii::space_type> str;
  qi::rule<Iterator, boost::any(),  ascii::space_type> expr;
  qi::rule<Iterator, boost::any(),  ascii::space_type> reference;
  qi::rule<Iterator, std::vector<boost::any>(), ascii::space_type> array;
  qi::rule<Iterator, void()> comments;

};

class ParameterSetParser
{
private:
  ParameterSetParser() {}

public:
  static bool Parse(std::string const & fname, ParameterSet & pset);
};

}// namespace mf

#endif
