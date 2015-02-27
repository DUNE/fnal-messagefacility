// ----------------------------------------------------------------------
//
// ELerrorList.cc
//
//
// 9/21/00      mf      Created
// 10/4/00      mf      excludeModule()
//                      intializer for moduleOfINterest in constructors
//  4/4/01      mf      Simplify filter/exclude logic by using base class
//                      method thisShouldBeIgnored().  Eliminate
//                      moduleOfinterest and moduleToexclude.
//
// ----------------------------------------------------------------------


#include "messagefacility/MessageService/ELerrorList.h"
#include "messagefacility/MessageService/ELadministrator.h"
#include "messagefacility/MessageService/ELcontextSupplier.h"

#include "messagefacility/MessageLogger/ELstring.h"

// Possible Traces:
// #define ELerrorListCONSTRUCTOR_TRACE
// #define ELerrorListTRACE_LOG

namespace mf {
  namespace service {


    // ----------------------------------------------------------------------
    // Constructors:
    // ----------------------------------------------------------------------

    ELerrorList::ELerrorList(std::list<mf::ErrorObj> & errorList) :
      ELdestination (),
      errorObjs ( errorList )
    {

#ifdef ELerrorListCONSTRUCTOR_TRACE
      std::cerr << "Constructor for ELerrorList()\n";
#endif

    }  // ELerrorList()

    ELerrorList::ELerrorList(const ELerrorList & orig) :
      ELdestination (),
      errorObjs ( orig.errorObjs )
    {

#ifdef ELerrorListCONSTRUCTOR_TRACE
      std::cerr << "Copy Constructor for ELerrorList()\n";
#endif

      ignoreMostModules    = orig.ignoreMostModules;
      respondToThese       = orig.respondToThese;
      respondToMostModules = orig.respondToMostModules;
      ignoreThese          = orig.ignoreThese;

    }  // ELerrorList()


    ELerrorList::~ELerrorList()  {

#ifdef ELerrorListCONSTRUCTOR_TRACE
      std::cerr << "Destructor for ELerrorList\n";
#endif

    }  // ~ELerrorList()


    // ----------------------------------------------------------------------
    // Methods invoked by the ELadministrator:
    // ----------------------------------------------------------------------

    void ELerrorList::log( mf::ErrorObj & msg )  {

#ifdef ELerrorListTRACE_LOG
      std::cerr << "    =:=:=: Log to an ELerrorList \n";
#endif

      mf::ErrorObj m (msg);

      // See if this message is to be acted upon, and add it to limits table
      // if it was not already present:
      //
      if ( msg.xid().severity < threshold        ) return;
      if ( thisShouldBeIgnored(msg.xid().module) ) return;
      if ( ! stats.limits.add( msg.xid() )       ) return;

#ifdef ELerrorListTRACE_LOG
      std::cerr << "    =:=:=: Limits table work done \n";
#endif

      // add a last item to the message:  The fullContext string supplied.

      m.eo_emit(ELadministrator::instance()->getContextSupplier().fullContext());

      // Now just put m on the list:

      errorObjs.push_back(m);

      // Done; message has been fully processed:
      //

#ifdef ELerrorListTRACE_LOG
      std::cerr << "  =:=:=: log(msg) done: \n";
#endif

      msg.setReactedTo( true );

    }  // log()


  } // end of namespace service
} // end of namespace mf
